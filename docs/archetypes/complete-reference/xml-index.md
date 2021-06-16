---
title: "OSCAL Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Index"
heading: "Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Index"
weight: 70
generateanchors: false
sidenav:
  title: XML Index
toc:
  enabled: true
  headingselectors: "h1.toc1"
---

The following is an index of each XML element and attribute used in the [XML format](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/xml/schema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_schema.xsd) for this model. Each entry in the index lists all uses of the given element or attribute in the format, which is linked to the corresponding entry in the [XML Format Reference](../xml-reference/). Each entry also lists the formal name for the given element or attribute which is linked to the corresponding XML type in the [XML Format Metaschema Reference](../xml-definitions/).

<!-- DO NOT REMOVE. Generated text below -->
