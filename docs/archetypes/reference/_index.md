---
title: "{{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot Reference{{ else }}OSCAL v{{ getenv "HUGO_REF_VERSION" }} Reference{{ end }}"
layout: reference-index
sidenav:
  focusrenderdepth: 2
  activerenderdepth: 2
  inactiverenderdepth: 1
  debug: false
oscal:
    type: "{{ getenv "HUGO_REF_TYPE" }}"
    branch: "{{ getenv "HUGO_REF_BRANCH" }}"
    revision: "{{ getenv "HUGO_REF_REVISION" }}"
    version: "{{ getenv "HUGO_REF_VERSION" }}"
---
