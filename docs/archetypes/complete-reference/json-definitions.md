---
title: "OSCAL Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} JSON Format Metaschema Reference"
heading: "Complete {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} Model JSON Metaschema Reference"
weight: 40
generateanchors: false
sidenav:
  title: JSON Metaschema Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
---

The following is a reference for the JSON object definitions derived from this model's [metaschema](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/src/metaschema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_metaschema.xml), which imports the metaschemas for all of the OSCAL models.

<!-- DO NOT REMOVE. Generated text below -->
