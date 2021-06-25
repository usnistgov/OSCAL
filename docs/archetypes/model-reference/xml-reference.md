---
title: "OSCAL {{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Reference"
heading: "{{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} XML Format Reference"
weight: 60
generateanchors: false
sidenav:
  title: XML Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
{{ if eq (getenv "HUGO_REF_REVISION") "latest" -}}
aliases:
{{- if eq (getenv "HUGO_MODEL_ID") "assessment-plan" }}
  - /documentation/schema/assessment-plan/xml-schema/
  - /documentation/schema/assessment-layer/assessment-plan/xml-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "assessment-results" }}
  - /documentation/schema/assessment-results/xml-schema/
  - /documentation/schema/assessment-results-layer/assessment-results/xml-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "catalog" }}
  - /docs/schemas/oscal-catalog-xml/
  - /documentation/schema/catalog/xml-schema/
  - /documentation/schema/catalog-layer/catalog/xml-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "component-definition" }}
  - /docs/schemas/oscal-component-xml/
  - /documentation/schema/component/xml-schema/
  - /documentation/schema/implementation-layer/component/xml-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "plan-of-action-and-milestones" }}
  - /documentation/schema/poam/xml-schema/
  - /documentation/schema/assessment-results-layer/poam/xml-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "profile" }}
  - /docs/schemas/oscal-profile-xml/
  - /documentation/schema/profile/xml-schema/
  - /documentation/schema/profile-layer/profile/xml-schema/
{{- end -}}
{{- if eq (getenv "HUGO_MODEL_ID") "system-security-plan" }}
  - /docs/schemas/oscal-ssp-xml/
  - /documentation/schema/ssp/xml-schema/
  - /documentation/schema/implementation-layer/ssp/xml-schema/
{{- end -}}
{{- end }}
---

The following is the XML format reference for this [model]({{ getenv "HUGO_MODEL_CONCEPTS_URL" }}), which is organized hierarchically. Each entry represents the corresponding XML element or attribute in the model's XML format, and provides details about the semantics and use of the element or attribute. The [XML Format Outline](../xml-outline/) provides a streamlined, hierarchical representation of this model's XML format which can be used along with this reference to better understand the XML representation of this model.

<!-- DO NOT REMOVE. Generated text below -->
