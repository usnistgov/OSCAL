---
title: Profile Model
heading: "OSCAL Profile Layer: Profile Model"
description: XML and JSON format documentation for the OSCAL [Profile model](.), which is the sole model in the OSCAL [Profile](../) layer. These formats model a [profile](/documentation/schema/profile-layer/#profile).
weight: 40
aliases:
  - /docs/model/profile/
  - /documentation/schema/profile/
---

The OSCAL Profile model represents a baseline of selected controls from one or more control catalogs, which is referred to as a "[profile](/documentation/schema/profile-layer/#profile)" in OSCAL. The Profile model is the sole model in the OSCAL [Profile](../) layer.

OSCAL profiles define a set of operations that are to be performed on one or more control catalogs to suffeciently reduce and tailor the catalog for use as a system implementation baseline. As such, an OSCAL profile can be thought of as change lists or punch lists referencing one or more catalogs, defining any or all of the following:

* Which controls are *selected* from the catalog and thereby considered to be in scope for the application;
* How the control selection should be *organized* and represented, including whether and how competing control definitions are to be resolved and merged;
* Whether and where any controls are to be *configured* or modified; this includes setting parameter values for a catalog but also potentially amending the language given in controls to describe their application in the system.

See [examples](#content-examples) of OSCAL profiles.

These three functions are reflected in the organization of a profile document, which may contain (in addition to document metadata) any of three sections, `import`, `merge`, and `modify`:

* `import` (required) - indicates which controls to include or exclude from catalogs
* `merge` - what merge rules to follow and how to organize outputs
* `modify` - how to configure and/or modify parameters and control languages (statements, guidance etc.)

The figure below sketches how OSCAL relates profiles to catalogs. This example represents the NIST SP 800-53 low baseline. The profile indicates which controls from the NIST SP 800-53 catalog are required to for compliance with this baseline. Using OSCAL formats for these baselines makes the mappings between the control catalog and the profile explicit and machine readable. A single profile can reference controls in multiple catalogs. OSCAL permits profiles to use the same interoperable format irrespective of which catalogs are being used.

![profile-catalog-mapping](profile-catalog-mapping-trivial-example.png)

## Content Examples

Multiple examples of baselines expressed using the OSCAL profile model can be found in the OSCAL GitHub repository in multiple formats:

| Source | Formats |
|:---|:---|
| NIST SP 800-53 rev 4 | \[[XML](189:<p>The NIST SP 800-53 revision 4 and 5 control catalogs are provided as catalog model <a href="https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/">examples</a> in the OSCAL GitHub repository. These examples are provided in OSCAL XML, JSON, and YAML formats.</p>
193:    <strong>Note:</strong> Full versions of the NIST SP 800-53 revision 4 catalog are available in OSCAL <a href="https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml">XML</a>, <a href="https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/json/NIST_SP-800-53_rev4_catalog.json">JSON</a>, and <a href="https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/yaml/NIST_SP-800-53_rev4_catalog.yaml">YAML</a> formats in the OSCAL GitHub repository. These examples also include assessment and objective content from NIST SP 800-53A revision 4.
docs/public/documentation/schema/catalog-layer/catalog/index.html
184:<p>The NIST HIGH, MODERATE and LOW baselines for the SP800-53 rev4 catalog are available <a href="https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4">in our GitHub repository</a>:</p>
/nist.gov/SP800-53/rev4/xml/)\] \[[JSON](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/json/)\] \[[YAML](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/yaml/)\]
| FedRAMP Baselines | \[[XML](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/xml/)\] \[[JSON](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/json/)\] \[[YAML](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/yaml/)\]

You will also find the "resolved" version of the profile. These files end with the suffix `-resolved-profile_catalog` to indicate that the profile [resolution process](/documentation/processing/profile-resolution/) has been performed to generate a catalog containing only the selected and tailored controls defined by the profile.

The following OSCAL profile model examples are provided by the above.

### NIST SP 800-53 Revision 4 Baselines

The NIST HIGH, MODERATE and LOW baselines for the SP800-53 rev4 catalog are available [in our GitHub repository](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4):

* [HIGH](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_HIGH-baseline_profile.xml)
* [MODERATE](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml)
* [LOW](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_LOW-baseline_profile.xml)

There are also [JSON](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/json) and [YAML](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/yaml) versions of the NIST SP 800-53 rev4 profiles.

### FedRAMP Baselines

Also find examples representing the FedRAMP baselines (again for the HIGH, MODERATE and LOW impact levels) on [our web site](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov).

* [HIGH](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/xml/FedRAMP_HIGH-baseline_profile.xml)
* [MODERATE](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/xml/FedRAMP_MODERATE-baseline_profile.xml)
* [LOW](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/xml/FedRAMP_LOW-baseline_profile.xml)

There are also [JSON](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/json) and [YAML](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov/yaml) versions of the FedRAMP profiles.

