---
title: "OSCAL {{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Outline"
heading: "{{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 50
generateanchors: false
sidenav:
  title: XML Outline
{{ if eq (getenv "HUGO_REF_REVISION") "latest" -}}
aliases:
{{- if eq (getenv "HUGO_MODEL_ID") "assessment-plan" }}
  - /documentation/schema/assessment-plan/xml-model-map/
  - /documentation/schema/assessment-layer/assessment-plan/xml-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "assessment-results" }}
  - /documentation/schema/assessment-results/xml-model-map/
  - /documentation/schema/assessment-results-layer/assessment-results/xml-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "catalog" }}
  - /docs/maps/oscal-catalog-xml/
  - /documentation/schema/catalog/xml-model-map/
  - /documentation/schema/catalog-layer/catalog/xml-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "component-definition" }}
  - /docs/maps/oscal-component-xml/
  - /documentation/schema/component/xml-model-map/
  - /documentation/schema/implementation-layer/component/xml-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "plan-of-action-and-milestones" }}
  - /documentation/schema/poam/xml-model-map/
  - /documentation/schema/assessment-results-layer/poam/xml-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "profile" }}
  - /docs/maps/oscal-profile-xml/
  - /documentation/schema/profile/xml-model-map/
  - /documentation/schema/profile-layer/profile/xml-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "system-security-plan" }}
  - /docs/maps/oscal-ssp-xml/
  - /documentation/schema/ssp/xml-model-map/
  - /documentation/schema/implementation-layer/ssp/xml-model-map/
{{- end -}}
{{- end }}
---

The following outline is a representation of the [XML format](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/xml/schema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_schema.xsd) for this [model]({{ getenv "HUGO_MODEL_CONCEPTS_URL" }}). For each element or attribute, the name links to the corresponding entry in the [XML Format Reference](../xml-reference/). The cardinality and data type are also provided for each element or attribute where appropriate.

<!-- DO NOT REMOVE. Generated text below -->