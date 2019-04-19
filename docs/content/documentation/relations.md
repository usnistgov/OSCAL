---
title: Relations to Industry Standards
description: Relations
permalink: /docs/relations/
layout: post
topnav: docs
sidenav: docs
sticky_sidenav: true
---

Professionals working in the security domain are already familiar with numerous standards, specifications, guidelines and regulatory frameworks that define and describe practice in the systems security arena: NIST SP800-53, ISO 27001/2, FedRAMP, FISMA/FIPS, HIPAA and others. OSCAL's models are designed to capture the full range of these.

However, there are other standard forms of document represention that might also be useful in certain contexts. Since OSCAL attempts not to replace any of these, but to complement them, developers of OSCAL-based systems may wish to be aware of them and of opportunities to take advantage of OSCAL in working with them.

## How OSCAL relates to other document encoding formats

<ul class="usa-accordion-bordered">
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="html">
      HTML (encoding for web pages)
    </button>
    <div id="html" class="usa-accordion-content">
{% include_relative oscal-and-html.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="docx">
      MS Word format <code>.docx</code> (word processor)
    </button>
    <div id="docx" class="usa-accordion-content">
{% include_relative oscal-and-docx.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="dita">
      DITA (XML encoding for technical documentation)
    </button>
    <div id="dita" class="usa-accordion-content">
{% include_relative oscal-and-dita.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="sts">
      NISO STS XML (encoding for standards documentation)
    </button>
    <div id="sts" class="usa-accordion-content">
{% include_relative oscal-and-sts.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="odt">
      OpenOffice format <code>.odt</code> (word processor format)
    </button>
    <div id="odt" class="usa-accordion-content">
{% include_relative oscal-and-odt.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="jats">
      NISO JATS / NLM BITS (XML encoding for publication of journals and books)
    </button>
    <div id="jats" class="usa-accordion-content">
{% include_relative oscal-and-jats.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="others">
      Other Industry Vertical Encoding Standards
    </button>
    <div id="others" class="usa-accordion-content">
{% include_relative oscal-and-others.html %}
    </div>
  </li>
</ul>
