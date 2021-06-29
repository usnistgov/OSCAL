---
title: "OSCAL {{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} JSON Format Outline"
heading: "{{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} JSON Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 10
generateanchors: false
sidenav:
  title: JSON Outline
{{ if eq (getenv "HUGO_REF_REVISION") "latest" -}}
aliases:
{{- if eq (getenv "HUGO_MODEL_ID") "assessment-plan" }}
  - /documentation/schema/assessment-plan/json-model-map/
  - /documentation/schema/assessment-layer/assessment-plan/json-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "assessment-results" }}
  - /documentation/schema/assessment-results/json-model-map/
  - /documentation/schema/assessment-results-layer/assessment-results/json-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "catalog" }}
  - /docs/maps/oscal-catalog-json/
  - /documentation/schema/catalog/json-model-map/
  - /documentation/schema/catalog-layer/catalog/json-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "component-definition" }}
  - /docs/maps/oscal-component-json/
  - /documentation/schema/component/json-model-map/
  - /documentation/schema/implementation-layer/component/json-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "plan-of-action-and-milestones" }}
  - /documentation/schema/poam/json-model-map/
  - /documentation/schema/assessment-results-layer/poam/json-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "profile" }}
  - /docs/maps/oscal-profile-json/
  - /documentation/schema/profile/json-model-map/
  - /documentation/schema/profile-layer/profile/json-model-map/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "system-security-plan" }}
  - /docs/maps/oscal-ssp-json/
  - /documentation/schema/ssp/json-schema-map/
  - /documentation/schema/implementation-layer/ssp/json-model-map/
{{- end -}}
{{- end }}
---

The following outline is a representation of the [JSON format](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/json/schema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}_schema.json) for this [model]({{ getenv "HUGO_MODEL_CONCEPTS_URL" }}). For each property, the name links to the corresponding entry in the [JSON Format Reference](../json-reference/). The cardinality and data type are also provided for each property where appropriate.

<!-- DO NOT REMOVE. Generated text below -->
