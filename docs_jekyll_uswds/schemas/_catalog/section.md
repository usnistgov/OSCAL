---
title: section
schema: catalog
properties:
  - name: id
    description: id attribute description
    cardinality: optional
  - name: class
    description: class attribute description
    cardinality: optional
  - name: title
    description: title element description
    cardinality: required
  - name: p
    description: p element description
    cardinality: zero or more
  - name: ul
    description: ul element description
    cardinality: zero or more
  - name: ol
    description: ol element description
    cardinality: zero or more
  - name: pre
    description: pre element description
    cardinality: zero or more
  - name: section
    description: section element description
    cardinality: zero or more
  - name: references
    description: references element description
    cardinality: optional
snippets:
  xml: |2-
    <section id="mySectionId" class="myClassId">
      <title>My Section Title</title>
      <p/>
      <ul/>
      <ol/>
      <pre/>
      <section/>
      <references/>
    </catalog>
  json: |2-
    {
      "id": "mySectionId",
      "class": "myClassId",
      "title": "My Section Title",
      "p": [""],
      "ul": [""],
      "ol": [""],
      "pre": [""],
      "section": [{}],
      "references": {}
    }
  yaml: |2-
    id: mySectionId
    class: myClassId
    title: My Section Title
    p: []
    ul: []
    ol: []
    pre: []
    section: [{}]
    references: {}
---

Top-level element

Catalog element description
