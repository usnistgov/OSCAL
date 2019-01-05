---
title: Relations to Industry Standards
description: Relations
permalink: /learnmore/relations/
layout: post
topnav: learnmore
sidenav: learnmore
sticky_sidenav: true
---

Professionals working in the security domain are already familiar with numerous standards, specifications, guidelines and regulatory frameworks that define and describe practice in the systems security arena: NIST SP800-53, ISO 27001/2, FedRAMP, FISMA/FIPS, HIPAA and others. Typically, these documents present us with complex and densely interconnected webs of information, which must be managed on multiple of levels of scale at once, using tools not designed for the job. We know this information should be machinable, but we have no way of expressing and managing it such that this machining can happen.

The approach OSCAL takes to the problem is to *enable* the machine-ready handling of these standards with a catalyst technology -- a set of lightweight models already tested and fit for use -- which will, over the longer term, enable industry to develop its own common toolkit for handling this proliferation of information, not excluding its continuing integration with the documentary encoding standards that constitute the infrastructure of today's and tomorrow's platforms.

## How OSCAL relates to other document encoding formats

<ul class="usa-accordion-bordered">
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="html">
      HTML
    </button>
    <div id="html" class="usa-accordion-content">
{% include_relative oscal-and-html.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="docx">
      MS Word format <code>.docx</code>
    </button>
    <div id="docx" class="usa-accordion-content">
{% include_relative oscal-and-docx.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="dita">
      DITA
    </button>
    <div id="dita" class="usa-accordion-content">
{% include_relative oscal-and-dita.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="sts">
      NISO STS XML
    </button>
    <div id="sts" class="usa-accordion-content">
{% include_relative oscal-and-sts.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="odt">
      OpenOffice format <code>.odt</code>
    </button>
    <div id="odt" class="usa-accordion-content">
{% include_relative oscal-and-odt.html %}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="jats">
      NISO JATS / NLM BITS
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
