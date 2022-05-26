---
title: "{{ if eq (getenv "HUGO_REF_VERSION") "develop" }}Development Snapshot Reference{{ else }}OSCAL v{{ getenv "HUGO_REF_VERSION" }} Reference{{ end }}"
summary: "{{ if eq (getenv "HUGO_REF_REVISION") "develop" }}Development Snapshot{{ else if eq (getenv "HUGO_REF_REVISION") "latest" }}Latest Release (v{{ getenv "HUGO_REF_VERSION" }}){{ else }}{{ getenv "HUGO_REF_VERSION" }}{{ end }}"
layout: reference-release
weight: {{ if eq (getenv "HUGO_REF_REVISION") "develop" }}20{{ else if eq (getenv "HUGO_REF_REVISION") "latest" }}50{{ else }}70{{ end }}
sidenav:
  title: {{ if eq (getenv "HUGO_REF_REVISION") "develop" }}Development Snapshot{{ else if eq (getenv "HUGO_REF_REVISION") "latest" }}Latest Release (v{{ getenv "HUGO_REF_VERSION" }}){{ else }}{{ getenv "HUGO_REF_VERSION" }}{{ end }}
  focusrenderdepth: {{ if eq (getenv "HUGO_REF_REVISION") "latest" }}2{{ else }}1{{ end }}
  activerenderdepth: -1
  inactiverenderdepth: 1
  debug: false
oscal:
    type: "{{ getenv "HUGO_REF_TYPE" }}"
    remote: "{{ getenv "HUGO_REF_REMOTE" }}"
    branch: "{{ getenv "HUGO_REF_BRANCH" }}"
    revision: "{{ getenv "HUGO_REF_REVISION" }}"
    version: "{{ getenv "HUGO_REF_VERSION" }}"
---
