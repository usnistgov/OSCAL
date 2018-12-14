---
title: catalog
schema: catalog
properties:
  - name: title
    description: title element description
    cardinality: required
  - name: declarations
    description: declarations element description
    cardinality: zero or more
  - name: section
    description: section element description
    cardinality: zero or more
  - name: group
    description: group element description
    cardinality: zero or more
  - name: references
    description: references element description
    cardinality: optional
snippets:
  xml: |2-
    <catalog>
      <title>My Catalog Title</title>
      <declarations/>
      <section/>
      <group/>
      <references/>
    </catalog>
  json: |2-
    {
      "title": "My Catalog Title",
      "Declarations": [{}],
      "Sections": [{}],
      "Groups": [{}],
      "References": {}
    }
  yaml: |2-
    title: My Catalog Title
    Declarations: [{}]
    Sections: [{}]
    Groups: [{}]
    References: {}
---

Top-level element

Catalog element description
