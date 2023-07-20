SHELL:=/usr/bin/env bash

.PHONY: help
# Run "make" or "make help" to get a list of user targets
# Adapted from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | awk 'BEGIN { \
	 FS = ":.*?## "; \
	 printf "\033[1m%-30s\033[0m %s\n", "TARGET", "DESCRIPTION" \
	} \
	{ printf "\033[32m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: all
all: artifacts checks ## Run all pipelines

.PHONY: artifacts
artifacts: schemas converters ## Generate all artifacts

.PHONY: checks
checks: linkcheck validate test-profile-resolution ## Run all tests and checks

.PHONY: dependencies
dependencies: node_modules ## Ensure dependencies have been installed

node_modules: package.json package-lock.json
	npm ci

.PHONY: clean
clean: clean-schemas clean-linkcheck clean-converters ## Remove all generated content

METASCHEMA_XSLT_COMMAND:=metaschema-xslt/bin/metaschema-xslt
SRC_DIR:=../src/metaschema
# Contains the metaschemas that do not contain "common" or "metadata"
METASCHEMAS:=$(shell find $(SRC_DIR) -name '*_metaschema.xml' -a ! -name '*common*' -a ! -name '*metadata*')
GENERATED_DIR:=generated

#####################
# Schema Generation #
#####################

XSD_OUTPUTS:=$(patsubst $(SRC_DIR)/%_metaschema.xml,$(GENERATED_DIR)/%_schema.xsd,$(METASCHEMAS))
JSONSCHEMA_OUTPUTS:=$(patsubst $(SRC_DIR)/%_metaschema.xml,$(GENERATED_DIR)/%_schema.json,$(METASCHEMAS))

$(GENERATED_DIR)/%_schema.json $(GENERATED_DIR)/%_schema.xsd: $(SRC_DIR)/%_metaschema.xml
	@mkdir -p $(GENERATED_DIR)
	$(METASCHEMA_XSLT_COMMAND) schema-gen $(SRC_DIR)/$*_metaschema.xml $(GENERATED_DIR) $*

.PHONY: schemas
schemas: $(XSD_OUTPUTS) $(JSONSCHEMA_OUTPUTS) ## Generate the schemas

.PHONY: clean-schemas
clean-schemas: ## Remove generated schemas
	rm -fr $(GENERATED_DIR)/*_schema.*

########################
# Converter Generation #
########################

XML2JSON_CONVERTERS:=$(patsubst $(SRC_DIR)/%_metaschema.xml,$(GENERATED_DIR)/%_xml-to-json-converter.xsl,$(METASCHEMAS))
JSON2XML_CONVERTERS:=$(patsubst $(SRC_DIR)/%_metaschema.xml,$(GENERATED_DIR)/%_json-to-xml-converter.xsl,$(METASCHEMAS))

$(GENERATED_DIR)/%_xml-to-json-converter.xsl $(GENERATED_DIR)/%_json-to-xml-converter.xsl: $(SRC_DIR)/%_metaschema.xml
	@mkdir -p $(GENERATED_DIR)
	$(METASCHEMA_XSLT_COMMAND) converter-gen $(SRC_DIR)/$*_metaschema.xml $(GENERATED_DIR) $*

.PHONY: converters
converters: $(XML2JSON_CONVERTERS) $(JSON2XML_CONVERTERS) ## Generate the converters

.PHONY: clean-converters
clean-converters: ## Remove generated converters
	rm -fr $(GENERATED_DIR)/*_xml-to-json-converter.xsl
	rm -fr $(GENERATED_DIR)/*_json-to-xml-converter.xsl

#######################
# Markdown Link Check #
#######################

LINKCHECK_OUTPUT:=$(GENERATED_DIR)/mlc_report.log
LINKCHECK_CONFIG:=markdown-link-check.json

.PHONY: linkcheck
linkcheck: $(LINKCHECK_OUTPUT) ## Perform Markdown link checking

# WARNING: will fail if locally deleted markdown files are not staged.
# 1. cd into the parent directory
# 2. list all markdown files known to git
# 3. Pass the files as an argument to the markdown link checker
# 4. Write the log to a file
# 5. Exit with a failure if any of the link checker invocations failed
$(LINKCHECK_OUTPUT): node_modules $(LINKCHECK_CONFIG)
	@mkdir -p $(GENERATED_DIR)
	@echo Checking Markdown links...
	cd ..; git ls-files -z "*.md" | \
		xargs -0 npx --prefix build/ markdown-link-check -c build/$(LINKCHECK_CONFIG) | \
		tee build/$(LINKCHECK_OUTPUT); \
	exit $${PIPESTATUS[1]}

.PHONY: clean-linkcheck
clean-linkcheck: ## Remove linkcheck log
	rm -fr $(LINKCHECK_OUTPUT)

#######################
# Artifact Validation #
#######################

.PHONY: validate
validate: validate-jsonschemas validate-xsds ## Validate all generated content

.PHONY: validate-jsonschemas
validate-jsonschemas: $(JSONSCHEMA_OUTPUTS) ## Validate generated JSON Schemas
	@echo Validating generated JSON Schemas
	npx ajv compile -c "ajv-formats" -s "$(GENERATED_DIR)/*_schema.json"

.PHONY: validate-xsds
validate-xsds: $(XSD_OUTPUTS) ## Validate generated XSD files
	@echo Validting generated XSDs
	xmllint --noout $(XSD_OUTPUTS)

.IGNORE: test-profile-resolution # TODO: fix up the profile resolution tests
.PHONY: test-profile-resolution
test-profile-resolution: ## Unit test the profile resolver
	$(MAKE) -C ../src/utils/resolver-pipeline test
