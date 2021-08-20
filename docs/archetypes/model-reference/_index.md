---
title: "{{ getenv "HUGO_MODEL_NAME" }} Model {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot{{ else }}v{{ getenv "HUGO_REF_VERSION" }}{{ end }} Reference"
summary: "{{ getenv "HUGO_MODEL_NAME" }} Model"
weight: 20
suppresstopiclist: true
sidenav:
  title: {{ getenv "HUGO_MODEL_NAME" }} Model
  focusrenderdepth: 1
  activerenderdepth: -1
  inactiverenderdepth: 1
---

<p><span class="usa-tag">Release Version</span> {{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Latest Development Snapshot{{ else }}OSCAL v{{ getenv "HUGO_REF_VERSION" }}{{ end }}</p>
<p><span class="usa-tag">Github</span> <a href="https://github.com/usnistgov/OSCAL">usnistgov/OSCAL</a> <span class="usa-tag">{{ if eq (getenv "HUGO_REF_TYPE") "tag" }}Tag{{ else }}Branch{{end}}</span> <a href="https://github.com/usnistgov/OSCAL/tree/{{ getenv "HUGO_REF_BRANCH" }}">{{ getenv "HUGO_REF_BRANCH" }}</a></p>

The following reference documentation is available for the OSCAL {{ getenv "HUGO_MODEL_NAME" }} model.

- **[Conceptual Overview]({{ getenv "HUGO_MODEL_CONCEPTS_URL" }}):** Provides a high-level overview of the model's intended purpose and role in the [OSCAL architecture](/concepts/layer/). Describes the model's purpose, target audience, and key concepts.
- **Outline ([JSON/YAML](json-outline/), [XML](xml-outline/)):** Provides a brief listing of the model's information items organized hierarchically. Useful for understanding the structure and basic syntax of the model in a given format.
- **Reference ([JSON/YAML](json-reference/), [XML](xml-reference/)):** Provides a detailed description of the structure and syntax for the model's information items organized hierarchically. Useful for understanding how to use information items within the model in the given format. 
- **Index ([JSON/YAML](json-index/), [XML](xml-index/)):** Provides a listing of the model's information items organized by where they are used.
- **Definitions ([JSON/YAML](json-definitions/), [XML](xml-definitions/)):** Provides a reference for the XML Schema types and JSON Schema definitions derived from this model's [metaschema](https://github.com/usnistgov/OSCAL/blob/{{ getenv "HUGO_REF_BRANCH" }}/src/metaschema/oscal_{{ getenv "HUGO_SCHEMA_ID" }}). A metaschema is used to [express the model](/concepts/layer/overview/#modeling-approach) in a format agnostic way, that is then used to generate the XML and JSON Schema, XML <-> JSON content converters, and this reference documentation.
