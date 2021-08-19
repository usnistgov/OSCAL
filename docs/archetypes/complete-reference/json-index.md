---
title: "OSCAL Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} JSON Format Index"
heading: "Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} JSON Format Index"
weight: 30
generateanchors: false
sidenav:
  title: JSON Index
toc:
  enabled: true
  headingselectors: "h1.toc1"
---

The following is an index of each JSON property used in the [JSON format](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/json/schema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_schema.json), which represents the combination of all OSCAL models. Each entry in the index lists all uses of the given property in the format, which is linked to the corresponding entry in the [JSON Format Reference](../json-reference/). Each entry also lists the formal name for the definition which is linked to the corresponding JSON definition in the [JSON Format Metaschema Reference](../json-definitions/).

<!-- DO NOT REMOVE. Generated text below -->
