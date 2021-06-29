---
title: "OSCAL {{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} JSON Format Reference"
heading: "{{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} JSON Format Reference"
weight: 20
generateanchors: false
sidenav:
  title: JSON Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
{{ if eq (getenv "HUGO_REF_REVISION") "latest" -}}
aliases:
{{ if eq (getenv "HUGO_MODEL_ID") "assessment-plan" }}
  - /documentation/schema/assessment-plan/json-schema/
  - /documentation/schema/assessment-layer/assessment-plan/json-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "assessment-results" }}
  - /documentation/schema/assessment-results/json-schema/
  - /documentation/schema/assessment-results-layer/assessment-results/json-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "catalog" }}
  - /docs/schemas/oscal-catalog-json/
  - /documentation/schema/catalog/json-schema/
  - /documentation/schema/catalog-layer/catalog/json-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "component-definition" }}
  - /docs/schemas/oscal-component-json/
  - /documentation/schema/component/json-schema/
  - /documentation/schema/implementation-layer/component/json-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "plan-of-action-and-milestones" }}
  - /documentation/schema/poam/json-schema/
  - /documentation/schema/assessment-results-layer/poam/json-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "profile" }}
  - /docs/schemas/oscal-profile-json/
  - /documentation/schema/profile/json-schema/
  - /documentation/schema/profile-layer/profile/json-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "system-security-plan" }}
  - /docs/schemas/oscal-ssp-json/
  - /documentation/schema/ssp/json-schema/
  - /documentation/schema/implementation-layer/ssp/json-schema/
{{- end -}}
{{- end }}
---

The following is the JSON format reference for this [model]({{ getenv "HUGO_MODEL_CONCEPTS_URL" }}), which is organized hierarchically. Each entry represents the corresponding JSON property in the model's JSON format, and provides details about the semantics and use of the property. The [JSON Format Outline](../json-outline/) provides a streamlined, hierarchical representation of this model's JSON format which can be used along with this reference to better understand the JSON representation of this model.

<!-- DO NOT REMOVE. Generated text below -->
