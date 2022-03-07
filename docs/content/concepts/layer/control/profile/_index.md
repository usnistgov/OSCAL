---
title: OSCAL Profile Model
heading: "OSCAL Control Layer: Profile Model"
weight: 40
sidenav:
  title: Profile Model
toc:
  enabled: true
aliases:
  - /docs/model/profile/
  - /documentation/schema/profile/
  - /documentation/schema/profile-layer/profile/
---

| Profile Schema | Profile Converters | Reference |
|:--- |:--- |:--- |
| [JSON Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_profile_schema.json) | [XML to JSON Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/convert/oscal_profile_xml-to-json-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/json#converting-oscal-xml-content-to-json)) | [Outline](/reference/latest/profile/json-outline/)<br />[Reference](/reference/latest/profile/json-reference/)<br />[Index](/reference/latest/profile/json-index/) |
| [XML Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_profile_schema.xsd) | [JSON to XML Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/convert/oscal_profile_json-to-xml-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/xml#converting-oscal-json-content-to-xml)) | [Outline](/reference/latest/profile/xml-outline/)<br />[Reference](/reference/latest/profile/xml-reference/)<br />[Index](/reference/latest/profile/xml-index/) |

## Purpose

The OSCAL Profile model represents a [baseline](/concepts/terminology/#baseline) of selected [controls](/concepts/terminology/#control) from one or more control [catalogs](/concepts/terminology/#catalog), which is referred to as a "profile" in OSCAL. The Profile model is the sole model in the OSCAL [Control](../) layer.

## Authors and Consumers

### Profile Authors

{{<callout>}}Control Baseline Authors, Authorizing Officials, and System Owners{{</callout>}}

Profiles are authored by an organization that defines or governs control baselines, such as the High, Moderate, and Low baselines defined for NIST's Special Publication (SP) 800-53 controls.

Organizations may also author a profiles when they need to define or tailor a set of controls applicable to their organization.

Finally, system owners or authorizing officials may author profiles to establish a baseline of tailored controls applicable to a specific system.

### Profile Consumers

{{<callout>}}System Security Plan Authors and Consumers, Auditors, Authorizing Officials and Component Definition Authors and Consumers{{</callout>}}

Profiles are consumed by system owners and authorizing officials as the basis for the [System Security Plan](../../implementation/ssp/) (SSP).

An auditor uses a profile to assess a system in the context of its control baseline.

[Component definition](../../implementation/component-definition/) authors may use profiles to establish context for how a component could satisfy a control requirement.

## Model Overview

{{% usa-grid-container class="padding-x-0" %}}
{{% usa-grid-row %}}
{{% usa-grid-column class="grid-col-fill" %}}
An OSCAL profile is organized as follows:

- **Metadata**: Metadata syntax is identical and required in all OSCAL models. It includes information such as the file's title, publication version, publication date, and OSCAL version. Metadata is also used to define roles, parties (people, teams and organizations), and locations.
- **Import**: Identifies an OSCAL [catalog](../catalog/) or other profile from which controls are to be imported. A control must be imported to be included in a baseline. All parameters and back-matter resources cited by an imported control are also imported.
- **Merge**: Provides directives as to how controls should be organized. It also provides directives for resolving conflicts where two or more variations of a control are imported as a result of multiple import statements.
- **Modify**: Provides the ability to tailor imported controls, including their parameters, control requirement definitions, references, control objectives, and assessment actions.
- **Back Matter**: Back matter syntax is identical in all OSCAL models. It is used for attachments, citations, and embedded content such as graphics.
{{% /usa-grid-column %}}
{{% usa-grid-column class="grid-col-auto" %}}
{{<figure src="profile-model.svg" alt="A diagram depicting the profile model. As described in the text, within the larger profile model box, it shows a metadata at the top, followed by an import box, merge box, modify box, and finally a back matter box." class="maxw-full margin-top-0">}}
{{% /usa-grid-column %}}
{{% /usa-grid-row %}}
{{% /usa-grid-container %}}

## Key Concepts

OSCAL profiles define a set of operations that are to be performed on one or more control catalogs to sufficiently reduce and tailor the catalog for use as a system implementation baseline. As such, an OSCAL profile can be thought of as change lists or punch lists referencing one or more catalogs, defining any or all of the following:

* Which controls are *selected* from the catalog and thereby considered to be in scope for the application;
* How the control selection should be *organized* and represented, including whether and how competing control definitions are to be resolved and merged;
* Whether and where any controls are to be *configured* or modified; this includes setting parameter values for a catalog but also potentially amending the language given in controls to describe their application in the system.

See [examples](#content-examples) of OSCAL profiles.

These three functions are reflected in the organization of a profile document, which may contain (in addition to document metadata) any of three sections, `import`, `merge`, and `modify`:

* `import` (required) - indicates which controls to include or exclude from catalogs
* `merge` - what merge rules to follow and how to organize outputs
* `modify` - how to configure and/or modify parameters and control languages (statements, guidance etc.)

The figure below expresses represents the portion of the OSCAL stack as it relates to an OSCAL profile.
![A diagram representing the OSCAL stack from a profile's perspective.](OSCAL-stack-profile.svg)

{{<partialCached "note-to-developers-uuid.html" >}}

## Content Examples

Multiple examples of baselines expressed using the OSCAL profile model can be found in the OSCAL GitHub repository in multiple formats:

| Source | Formats |
|:---|:---|
| NIST SP 800-53 rev 5 | \[[XML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev5/xml/)\] \[[JSON]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev5/json/)\] \[[YAML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev5/yaml/)\]
| NIST SP 800-53 rev 4 | \[[XML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev4/xml/)\] \[[JSON]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev4/json/)\] \[[YAML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev4/yaml/)\]
| FedRAMP Baselines | \[[XML](https://github.com/GSA/fedramp-automation/tree/master/dist/content/baselines/rev4/xml)\] \[[JSON](https://github.com/GSA/fedramp-automation/tree/master/dist/content/baselines/rev4/json)\] \[[YAML](https://github.com/GSA/fedramp-automation/tree/master/dist/content/baselines/rev4/yaml/)\]

You will also find the "resolved" version of each profile. These files end with the suffix `-resolved-profile_catalog` to indicate that the profile [resolution process](/concepts/processing/profile-resolution/) has been performed to generate a catalog containing only the selected and tailored controls defined by the profile.
