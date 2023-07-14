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
all: schemas linkcheck ## Run all pipelines

.PHONY: dependencies
dependencies: node_modules ## Ensure dependencies have been installed

node_modules: package.json package-lock.json
	npm ci

.PHONY: clean
clean: clean-schemas clean-linkcheck ## Remove all generated content

METASCHEMA_XSLT_COMMAND:=metaschema-xslt/bin/metaschema-xslt
SRC_DIR:=../src/metaschema
# Contains the metaschemas that do not contain "common" or "metadata"
METASCHEMAS:=$(shell find $(SRC_DIR) -name '*_metaschema.xml' -a ! -name '*common*' -a ! -name '*metadata*')
GENERATED_DIR:=generated

$(GENERATED_DIR):
	mkdir -p $(GENERATED_DIR)

#####################
# Schema Generation #
#####################

XSD_OUTPUTS:=$(patsubst $(SRC_DIR)/%_metaschema.xml,$(GENERATED_DIR)/%_schema.xsd,$(METASCHEMAS))
JSONSCHEMA_OUTPUTS:=$(patsubst $(SRC_DIR)/%_metaschema.xml,$(GENERATED_DIR)/%_schema.json,$(METASCHEMAS))

# Note: dependants should specify the json or the xsd schemas, not both.
# 	If both are specified the command will run twice.
$(GENERATED_DIR)/%_schema.json $(GENERATED_DIR)/%_schema.xsd: $(GENERATED_DIR) $(SRC_DIR)/%_metaschema.xml
	$(METASCHEMA_XSLT_COMMAND) schema-gen $(SRC_DIR)/$*_metaschema.xml $(GENERATED_DIR) $*

.PHONY: schemas
schemas: $(XSD_OUTPUTS) ## Generate the schemas

.PHONY: clean-schemas
clean-schemas: ## Remove generated schemas
	rm -fr $(GENERATED_DIR)/*_schema.*

#######################
# Markdown Link Check #
#######################

LINKCHECK_OUTPUT:=$(GENERATED_DIR)/mlc_report.log
LINKCHECK_CONFIG:=markdown-link-check.json

.PHONY: linkcheck
linkcheck: $(LINKCHECK_OUTPUT) ## Perform Markdown link checking

# 1. cd into the parent directory
# 2. list all markdown files known to git
# 3. Pass the files as an argument to the markdown link checker
# 4. Write the log to a file
# 5. Exit with a failure if any of the link checker invocations failed
$(LINKCHECK_OUTPUT): node_modules $(GENERATED_DIR)
	cd ..; git ls-files -z "*.md" | \
		xargs -0 npx --prefix build/ markdown-link-check -c build/$(LINKCHECK_CONFIG) | \
		tee build/$(LINKCHECK_OUTPUT); \
	exit $${PIPESTATUS[2]}

.PHONY: clean-linkcheck
clean-linkcheck: ## Remove linkcheck log
	rm -fr $(LINKCHECK_OUTPUT)
