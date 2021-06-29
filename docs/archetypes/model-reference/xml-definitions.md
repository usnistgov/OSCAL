---
title: "OSCAL {{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Metaschema Reference"
heading: "{{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Metaschema Reference"
weight: 80
generateanchors: false
sidenav:
  title: XML Metaschema Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
---

The following is a reference for the XML element and attribute types derived from the [metaschema](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}//src/metaschema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_metaschema.xml) for this [model]({{ getenv "HUGO_MODEL_CONCEPTS_URL" }}).

<!-- DO NOT REMOVE. Generated text below -->