---
title: Schema Reference - OSCAL Prose Model
description: OSCAL Profile Model XML Schema Reference
permalink: /docs/schemas/oscal-prose/
layout: post
topnav: schemareference
sidenav: schemas
sticky_sidenav: true
---

## HTML compatibility

Prose in OSCAL is designed to map cleanly to an HTML subset. Note that this element set is not maintained in the HTML namespace. It is intended not to be treated directly as HTML, but to be readily and transparently converted to HTML (or other presentational formats) as needed.

OSCAL prose supports paragraphs (`p`), headers (`h1`-`h6`), tables (`table`), preformatted text (`pre`), and ordered and unordered lists (`ul` and `ol`).

Within paragraphs or text content (inline) the following elements are permitted: `a`, `strong`, `em`, `b`, `i`, `sup`, `sub`.

In particular, note that elements such as `div`, `blockquote`, `section` or `aside`, used in HTML to provide structure, are *not permitted in OSCAL*. Structures in OSCAL should be represented using OSCAL elements (or objects in JSON) such as `part`, which can include prose.

In addition, there are contexts in OSCAL where prose usage may be further constrained. For example, at a higher level (outside the base schema) an OSCAL application could forbid the use of prose headers `h1-h6` in favor of nested OSCAL `part` elements with their own titles.

## Markdown compatibility

OSCAL also maintains a mapping from its HTML-like tagging for prose into a Markdown syntax. Since markdown (as an array of string objects) is our syntax of choice for representing unstructured prose in JSON, transparent and lossless bidirectional mapping between the OSCAL markup (tag) representation, into its Markdown equivalent, is a requirement.

When in doubt, we look to CommonMark for guidance on syntax, largely because it is more rigorously tested than many others.

