SHELL:=/usr/bin/env bash

OSCAL_DIR:=../../../
METASCHEMA_XSLT_DIR:=$(OSCAL_DIR)/build/metaschema-xslt
XSPEC_DIR:=$(METASCHEMA_XSLT_DIR)/support/xspec
XSPEC_COMMAND:=$(XSPEC_DIR)/bin/xspec.sh
POM_FILE:=$(METASCHEMA_XSLT_DIR)/support/pom.xml

TEST_DIR:=./testing/xspec
# Must be an absolute path due to maven issues
# (maven's copy dependency plugin resolves paths relative to the POM file)
SUPPORT_DIR:=$(shell pwd)/java_modules

$(SUPPORT_DIR):
	mkdir -p "$(SUPPORT_DIR)"
	mvn -f $(POM_FILE) \
		dependency:copy-dependencies \
		-DoutputDirectory="$(SUPPORT_DIR)"

.PHONY: test
test: $(SUPPORT_DIR) $(wildcard *.xsl)
	TEST_DIR=$(TEST_DIR) \
		XSPEC_COMMAND=$(XSPEC_COMMAND) \
		SAXON_CP="$(SUPPORT_DIR)/*" \
		./testing/test.sh

.PHONY: clean
clean:
	rm -fr $(SUPPORT_DIR)
	rm -fr $(TEST_DIR)
