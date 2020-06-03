---
title: Profile Model
heading: "OSCAL Profile Layer: Profile Model"
description: XML and JSON format documentation for the OSCAL [Profile model](.), which is the sole model in the OSCAL [Profile](../) layer. These formats model a [profile](/documentation/schema/profile-layer/#profile).
weight: 40
aliases:
  - /docs/model/profile/
  - /documentation/schema/profile/
---

The OSCAL Profile model represents a baseline of selected controls from one or more control catalogs, which is referred to as a "[profile](/learnmore/architecture/profile/)" in OSCAL. The Profile model is the sole model in the OSCAL [Profile](../) layer.

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
| NIST SP 800-53 rev 4 | \[[XML](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/xml/)\] \[[JSON](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/json/)\] \[[YAML](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/yaml/)\]
| FedRAMP Baselines | \[[XML](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/xml/)\] \[[JSON](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/json/)\] \[[YAML](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/yaml/)\]

You will also find the "resolved" version of the profile. These files end with the suffix `-resolved-profile_catalog` to indicate that the profile [resolution process](/documentation/processing/profile-resolution/) has been performed to generate a catalog containing only the selected and tailored controls defined by the profile.

The following OSCAL profile model examples are provided by the above.

### NIST SP 800-53 Revision 4 Baselines

The NIST HIGH, MODERATE and LOW baselines for the SP800-53 rev4 catalog are available [in our GitHub repository](https://github.com/usnistgov/OSCAL/tree/master/content/nist.gov/SP800-53/rev4):

* [HIGH](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_HIGH-baseline_profile.xml)
* [MODERATE](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml)
* [LOW](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_LOW-baseline_profile.xml)

There are also [JSON](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/json) and [YAML](https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/yaml) versions of the NIST SP 800-53 rev4 profiles.

### FedRAMP Baselines

Also find examples representing the FedRAMP baselines (again for the HIGH, MODERATE and LOW impact levels) on [our web site](https://github.com/usnistgov/OSCAL/tree/master/content/fedramp.gov).

* [HIGH](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/xml/FedRAMP_HIGH-baseline_profile.xml)
* [MODERATE](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/xml/FedRAMP_MODERATE-baseline_profile.xml)
* [LOW](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/xml/FedRAMP_LOW-baseline_profile.xml)

There are also [JSON](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/json) and [YAML](https://github.com/usnistgov/OSCAL/blob/master/content/fedramp.gov/yaml) versions of the FedRAMP profiles.

