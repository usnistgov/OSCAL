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

This example shows the first portion of how the **AC1** control from NIST SP 800-53 can be rendered in OSCAL via XML within a `<control>` element.

```xml
{% include examples/catalog.xml %}
```

### Walkthrough

- The control class is "SP800-53". TBD: explain what this means, or skip it?
- The control id is "ac.1". This is not the "AC-1" identifier specified in NIST SP 800-53; instead, this is an OSCAL-internal identifier. TBD: is that correct? do the class and id work together so that the identifier is unique within the class?
- The `<param>` elements define values (parameters) for the control that OSCAL users can specify. For example, the first parameter, "ac-1_a", is for specifying "organization-defined personnel or roles". The `<param>` elements are referenced by statements (explained below).
- The `<prop>` elements specify properties, in this case the control name ("AC-1"), priority ("P1"), and baseline impact ("LOW", "MODERATE", and "HIGH").
- The `<part>` element defines a statement. The statement is the control text itself. As the example shows, the statement is defined in several pieces, with each discrete piece of the statement handled separately and assigned its own identifier. Some pieces reference parameter IDs (param-id) to bring in those user-defined values, while others simply contain chunks of the control's text. This modular approach to defining the control text enables granular treatment of each part of the control. For example, an auditor would find it easy to indicate which portions of the control an organization has implemented and which portions it has not.

The following snippet from the example above contains the supplemental guidance.

```xml
<part class="guidance">
  <p>This control addresses the establishment of policy and procedures for the effective implementation of selected security controls and control enhancements in the AC family. Policy and procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards, and guidance. Security program policies and procedures at the organization level may make the need for system-specific policies and procedures unnecessary. The policy can be included as part of the general information security policy for organizations or conversely, can be represented by multiple policies reflecting the complex nature of certain organizations. The procedures can be established for the security program in general and for particular information systems, if needed. The organizational risk management strategy is a key factor in establishing policy and procedures.</p>
  <link href="#pm.9" />
</part>
```

Note that unlike the control text, which had a highly structured OSCAL XML representation, the supplemental guidance is a simple paragraph. There is no need to structure it because it is meant as background information for a person to read and would not be part of automation.

The following snippet from the example contains the references.

```xml
  <references>
    <ref>
      <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-12">NIST Special Publication 800-12</citation>
    </ref>
    <ref>
      <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-100">NIST Special Publication 800-100</citation>
    </ref>
  </references>
</control>
```

These contain hyperlinks to additional sources of information for the control.
