---
title: "{{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot Reference{{ else }}OSCAL v{{ getenv "HUGO_REF_VERSION" }} Reference{{ end }}"
summary: "{{ if eq (getenv "HUGO_REF_REVISION") "develop" }}Development Snapshot{{ else if eq (getenv "HUGO_REF_REVISION") "latest" }}Latest Release{{ else }}{{ getenv "HUGO_REF_VERSION" }}{{ end }}"
layout: reference-release
weight: {{ if eq (getenv "HUGO_REF_REVISION") "develop" }}5{{ else if eq (getenv "HUGO_REF_REVISION") "latest" }}10{{ else }}20{{ end }}
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
