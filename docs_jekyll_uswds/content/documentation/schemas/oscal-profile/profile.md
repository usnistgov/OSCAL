---
title: profile
schema: profile
properties:
  - name: id
    description: id attribute description
    cardinality: required
  - name: title
    description: title element description
    cardinality: required
  - name: import
    description: import element description
    cardinality: one or more
  - name: merge
    description: merge element description
    cardinality: optional
  - name: modify
    description: optional element description
    cardinality: optional
snippets:
  xml: |2-
    <profile id="myProfileId">
      <title>My Profile Title</title>
      <import/>
      <merge/>
      <modify/>
    </profile>
  json: |2-
    {
      "id": "myProfileId",
      "title": "My Profile Title",
      "import": [{}],
      "merge": {},
      "modify": {}
    }
  yaml: |2-
    id: myProfileId
    Title: My Profile Title
    Import: [{}]
    Merge: {}
    Modify: {}
---

Top-level element

Profile element description