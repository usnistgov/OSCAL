---
title: Catalogs
description: OSCAL Catalog Examples
permalink: /resources/examples/catalogs/

layout: post
topnav: resources
sidenav: resources
subnav:
  - text: Catalogs
    href: /resources/examples/catalogs/
    current: true
  - text: Profiles
    href: /resources/examples/profiles/
---

## NIST 800-53

A complete representation of [NIST 800-53 encoded in OSCAL](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_catalog.xml) including materials from Appendix A (Assessments and Objectives), is available on the OSCAL web site.

Here is a (non-normative, partial) copy showing how control **AC1** from NIST SP800-53 can be rendered in OSCAL in XML with a `<control>` element. A short walkthrough follows.

```xml
{% include examples/catalog.xml %}
```

### Walkthrough

- The control class is "SP800-53". This serves as an indicator to a downstream processor of how it can expect this control to be
structured.
- The control ID is "ac.1". All `id` values are unique within the document and serve for addressing and linking. In the case of controls and subcontrols, the lexical form of the `id` is designed to be consistent with its formal name or label, which is **also** encoded within the control (in this case, "AC-1"). A discrepancy between these values indicates degradation in the data.
- `<param>` elements define parameter values for the control that permit (and may require) setting in context. Typically, a catalog will expose parameters where profiling applications are expected either to provide values themselves (appropriate to each profile) or to permit setting at higher levels of implementation. These values are available for assignment wherever indicated in the language of the control, using corresponding `<insert/>` elements.
- `<prop>` elements specify properties appropriate to this control. Here only a `label` property is given, for the control's canonical label. For other catalogs, other properties may assign values to controls according to any system of labels or associations.
- `<part>` elements indicate larger articulated structures. Here the part provides the *statement* for the control (as shown by its class). In SP800-53, control statements give the text (formal prose definition and description) of the control. As the example shows, statements can also be articulated into subparts, with each discrete piece of the statement handled separately and assigned its own identifier.
- `<insert>` elements reference parameters (`param-id` referencing parameter IDs) to bring in user-defined values.

The following snippet from the example above contains supplemental guidance given with the control (line breaks added for readability).

```xml
<part class="guidance" id="ac-1_gdn">
  <p>This control addresses the establishment of policy and procedures for the effective 
  implementation of selected security controls and control enhancements in the AC family. 
  Policy and procedures reflect applicable federal laws, Executive Orders, directives, 
  regulations, policies, standards, and guidance. Security program policies and 
  procedures at the organization level may make the need for system-specific policies and 
  procedures unnecessary. The policy can be included as part of the general information 
  security policy for organizations or conversely, can be represented by multiple 
  policies reflecting the complex nature of certain organizations. The procedures can be 
  established for the security program in general and for particular information systems, 
  if needed. The organizational risk management strategy is a key factor in establishing 
  policy and procedures.</p>
  <link rel="related" href="#pm-9">PM-9</link>
</part>
```

Note that unlike the control statement, which has a structure whose parts are labelled and addressable, the supplemental guidance is a simple paragraph. Where catalogs do not provide structure, OSCAL does not impose any.

Finally, the control description gives references for the control:

``` xml
<references>
  <link href="#ref050" rel="reference">NIST Special Publication 800-12</link>
  <link href="#ref044" rel="reference">NIST Special Publication 800-100</link>
</references>
```

These can be resolved to elements elsewhere in the catalog, as for example here (a citation from this catalog to another NIST publication):

```xml
<ref id="ref050">
  <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-12">NIST Special
  Publication 800-12</citation>
</ref>
```      
