---
title: Relations to Documentary Encoding Standards
description: Relations
permalink: /docs/relations/
layout: post
topnav: docs
sidenav: architecture
sticky_sidenav: true
---

Professionals working in the security domain are already familiar with numerous standards, specifications, guidelines and regulatory frameworks that define and describe practice in the systems security arena: NIST SP800-53, ISO 27001/2, FedRAMP, FISMA/FIPS, HIPAA and others. OSCAL's models are designed to capture the full range of these.

However, OSCAL is not the only text encoding technology available, and it is not always the most suitable, depending on the task at hand. Designed specifically to support operations related to security automation and assessment support, OSCAL may not be as optimal as other (standards-based, non-proprietary) formats for other applications including, notably, full text transcription, search and retrieval, or publication workflows. (OSCAL data may be shared among partners, even over networks including the Internet; but it is not necessarily suitable for publishing as such.)

More importantly, since OSCAL shares its technical foundations with other documentary encoding standards that serve other horizontal or neighboring vertical domains, it is important to recognize a *high degree of compatibility* with other XML-based formats. Investing in OSCAL and OSCAL-related tooling is a way of developing capability that applies to these other formats as well; likewise investing in these can have beneficial side effects related to OSCAL and related technologies.

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
      MS Word/Excel formats <code>.docx .xlsx</code> (word processor and spreadsheet)
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
      OpenOffice formats <code>.odt .ods</code> (word processor and spreadsheet formats)
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
