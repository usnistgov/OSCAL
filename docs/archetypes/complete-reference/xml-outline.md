---
title: "OSCAL Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Outline"
heading: "Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 50
generateanchors: false
sidenav:
  title: XML Outline
---

The following outline is a representation of the [XML format](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/xml/schema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_schema.xsd) for the combination of all OSCAL models. For each element or attribute, the name links to the corresponding entry in the [XML Format Reference](../xml-reference/). The cardinality and data type are also provided for each element or attribute where appropriate.

<!-- DO NOT REMOVE. Generated text below -->