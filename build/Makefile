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
all: artifacts checks archives ## Run all pipelines

.PHONY: artifacts
artifacts: schemas converters resolved-metaschemas ## Generate all artifacts

.PHONY: checks
checks: linkcheck validate test-profile-resolution ## Run all tests and checks

.PHONY: dependencies
dependencies: node_modules ## Ensure dependencies have been installed

node_modules: package.json package-lock.json
	npm ci

.PHONY: clean
clean: clean-schemas clean-linkcheck clean-converters clean-archives clean-resolved-metaschemas ## Remove all generated content

METASCHEMA_XSLT_COMMAND:=metaschema-xslt/bin/metaschema-xslt
SRC_DIR:=../src/metaschema
# Contains all OSCAL metaschema modules, including those without exported roots
ALL_METASCHEMAS:=$(shell find $(SRC_DIR) -name '*_metaschema.xml')
# Contains the OSCAL metaschema modules that contain root assemblies
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

###################################
# Resolved Metaschemas Generation #
###################################

POM_PATH:=./pom.xml
define EXEC_SAXON
	mvn --quiet -f "$(POM_PATH)" exec:java \
    	-Dexec.mainClass="net.sf.saxon.Transform" \
		-Dexec.args="$1"
endef

RESOLVER_STYLESHEET:=./resolve-entities.xsl

RESOLVED_METASCHEMA_SUFFIX:=RESOLVED
RESOLVED_METASCHEMAS:=$(patsubst $(SRC_DIR)/%_metaschema.xml,$(GENERATED_DIR)/%_metaschema_$(RESOLVED_METASCHEMA_SUFFIX).xml,$(ALL_METASCHEMAS))

$(GENERATED_DIR)/%_metaschema_$(RESOLVED_METASCHEMA_SUFFIX).xml: $(SRC_DIR)/%_metaschema.xml
	@mkdir -p $(GENERATED_DIR)
	$(call EXEC_SAXON,-s:$(SRC_DIR)/$*_metaschema.xml -xsl:$(RESOLVER_STYLESHEET) -o:$@ importHrefSuffix=$(RESOLVED_METASCHEMA_SUFFIX))

.PHONY: resolved-metaschemas
resolved-metaschemas: $(RESOLVED_METASCHEMAS) ## Generate the resolved metaschema modules

.PHONY: clean-resolved-metaschemas
clean-resolved-metaschemas: ## Remove generated resolvd metaschema modules
	rm -f $(RESOLVED_METASCHEMAS)

######################
# Archive Generation #
######################

RELEASE:=SNAPSHOT
ZIP_ARCHIVE:=$(GENERATED_DIR)/oscal-$(RELEASE).zip
TARBZ2_ARCHIVE:=$(GENERATED_DIR)/oscal-$(RELEASE).tar.bz2
ARCHIVE_TEMP_DIR:=$(GENERATED_DIR)/archive_temp

.PHONY: archives
archives: $(ZIP_ARCHIVE) ## Archive converters and schemas

$(ZIP_ARCHIVE) $(TARBZ2_ARCHIVE): converters schemas resolved-metaschemas
	@echo Generating archive
	mkdir -p $(ARCHIVE_TEMP_DIR)/{{json,xml}/{convert,schema},metaschema}
	cp ../src/release/release-readme.txt "$(ARCHIVE_TEMP_DIR)/README.txt"
	cp $(XSD_OUTPUTS) "$(ARCHIVE_TEMP_DIR)/xml/schema"
	cp $(JSONSCHEMA_OUTPUTS) "$(ARCHIVE_TEMP_DIR)/json/schema"
	cp $(XML2JSON_CONVERTERS) "$(ARCHIVE_TEMP_DIR)/xml/convert"
	cp $(JSON2XML_CONVERTERS) "$(ARCHIVE_TEMP_DIR)/json/convert"
	cp $(RESOLVED_METASCHEMAS) "$(ARCHIVE_TEMP_DIR)/metaschema"

	(cd "$(ARCHIVE_TEMP_DIR)" && zip -r $(abspath $(ZIP_ARCHIVE)) .)
	tar -jcvf "$(TARBZ2_ARCHIVE)" -C "$(ARCHIVE_TEMP_DIR)" .

	@echo Removing temporary archive staging directory $(ARCHIVE_TEMP_DIR)
	rm -fr $(ARCHIVE_TEMP_DIR)

.PHONY: clean-archives
clean-archives: ## Clean generated archive of converters and schemas
	rm -fr $(ARCHIVE_TEMP_DIR)
	rm -fr $(ZIP_ARCHIVE) $(TARBZ2_ARCHIVE)

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
		xargs -0n1 npx --prefix build/ markdown-link-check -c build/$(LINKCHECK_CONFIG) | \
		tee build/$(LINKCHECK_OUTPUT); \
		echo ""; echo "... Done checking Markdown links."; \
	exit $${PIPESTATUS[1]}

.PHONY: clean-linkcheck
clean-linkcheck: ## Remove linkcheck log
	rm -fr $(LINKCHECK_OUTPUT)

#######################
# Artifact Validation #
#######################

.PHONY: validate
validate: validate-jsonschemas validate-xsds validate-composition ## Validate all generated content

.PHONY: validate-jsonschemas
validate-jsonschemas: node_modules $(JSONSCHEMA_OUTPUTS) ## Validate generated JSON Schemas
	@echo Validating generated JSON Schemas
	npx ajv compile -c "ajv-formats" -s "$(GENERATED_DIR)/*_schema.json"

.PHONY: validate-xsds
validate-xsds: $(XSD_OUTPUTS) ## Validate generated XSD files
	@echo Validating generated XSDs
	xmllint --noout $(XSD_OUTPUTS)

VALIDATE_COMPOSITION_TARGETS:=$(patsubst $(SRC_DIR)/oscal_%_metaschema.xml,validate-composition-%,$(METASCHEMAS))

.PHONY: validate-composition
validate-composition: $(VALIDATE_COMPOSITION_TARGETS) ## Validate source metaschemas

validate-composition-%:
	@echo Performing composition validation of the $* model via schematron
	$(METASCHEMA_XSLT_COMMAND) composition-validate $(SRC_DIR)/oscal_$*_metaschema.xml

.IGNORE: test-profile-resolution # TODO: fix up the profile resolution tests
.PHONY: test-profile-resolution
test-profile-resolution: ## Unit test the profile resolver
	$(MAKE) -C ../src/utils/resolver-pipeline test

###################
# Utility Targets #
###################

# These targets may be used by consumers of the OSCAL repository

# All artifacts typically included in a release
RELEASE_ARTIFACTS:=$(XSD_OUTPUTS) $(JSONSCHEMA_OUTPUTS) $(XML2JSON_CONVERTERS) $(JSON2XML_CONVERTERS) $(RESOLVED_METASCHEMAS) $(ZIP_ARCHIVE) $(TARBZ2_ARCHIVE)

# This target is used by OSCAL-Reference to generate meta-redirects for release assets
.PHONY: list-release-artifacts
list-release-artifacts: ## Print out a list of all artifacts typically included in an OSCAL release
	@echo $(RELEASE_ARTIFACTS)
