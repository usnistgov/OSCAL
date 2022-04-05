---
title: Creating a Baseline
description: A tutorial on creating a Baseline using an OSCAL Profile.
weight: 5
suppresstopiclist: true
toc:
  enabled: true
aliases:
  - /tutorials/profile/
---

This tutorial covers creating a basic baseline using an OSCAL profile. Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Read the OSCAL control layer [overview](/concepts/layer/control/) and the definition of a [baseline](/concepts/terminology/#baseline).
- Review the OSCAL [profile model overview](/concepts/layer/control/profile/).

## What is an OSCAL Profile?

A [baseline][baseline-definition], or overlay in other terminology, defines a specific set of selected security control requirements from one or more control catalogs for use in managing risks in an information system.

In the most basic sense, a baseline is simply another catalog, and could be represented using the OSCAL Catalog Model. However, baselines are fundementally based on and rooted in whichever source catalog(s) they use as a foundation. With this in mind, OSCAL uses a different model to represent baselines that identifies the source catalog(s),which controls it will "select" or "import", and any changes made to those controls. An **OSCAL Profile** is a machine-readable representation of a **baseline**, expressed using the OSCAL [Profile model][profile-docs], which includes contextualizing documentation and metadata.

OSCAL Profiles are created within the context of the [Profile Resolution Specification](/concepts/processing/profile-resolution/), which defines exactly how tools can programmatically understand OSCAL Profiles. 

This tutorial illustrates how to create an OSCAL profile using the OSCAL XML, JSON, and YAML formats, which each implement the OSCAL [profile model](/concepts/layer/control/profile/). The OSCAL project provides an [XML Schema and documentation](/concepts/layer/control/profile/), which is useful for validating an XML profile, and a [JSON Schema and documentation](/concepts/layer/control/profile/), which is useful for validating JSON and YAML profiles.

## Creating an OSCAL Profile

The examples below illustrate the top-level structure of the OSCAL profile model.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata/>
    <import/>
    <merge/>
    <modify/>
    <back-matter/>
</profile>
{{< /highlight >}}

The root of the OSCAL profile model is [`<profile>`](/reference/latest/profile/xml-reference/#/profile).

In the example above, the contents of the `<profile>` element is provided as empty data items. These are included to illustrate the content model of an OSCAL profile, and we will be covering each element's syntax later in this tutorial.

The `@id` attribute (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `<profile>` contains:
- `<metadata>` (required) - Provides document metadata for the profile. As OSCAL Metadata sections use a shared structure across all models, refer to the metadata tutorial section of the Catalog tutorial for more information.
- `<import>` (required) - This is explored below in the [import phase](#import-phase) section of this tutorial.
- `<merge>` (optional) - This is explored below in the [merge phase](#merge-phase) section of this tutorial.
- `<modify>` (optional) - This is explored below in the [modify phase](#modify-phase) section of this tutorial.
- `<back-matter>` (optional) – Contains references used within the profile. Use of `<back-matter>` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}

{{< /highlight >}}

The root of the OSCAL profile model is [`profile`](/reference/latest/profile/xml-reference/#/profile).

In the example above, the contents of the `profile` element is provided as empty data items. These are included to illustrate the content model of an OSCAL profile, and we will be covering each element's syntax later in this tutorial.

The `id` attribute (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `profile` contains:

- `metadata` (required) - Provides document metadata for the profile. As OSCAL Metadata sections use a shared structure across all models, refer to the metadata tutorial section of the Catalog tutorial for more information.
- `import` (required) - This is explored below in the [import phase](#import-phase) section of this tutorial.
- `merge` (optional) - This is explored below in the [merge phase](#merge-phase) section of this tutorial.
- `modify` (optional) - This is explored below in the [modify phase](#modify-phase) section of this tutorial.
- `back-matter` (optional) – Contains references used within the profile. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}

{{< /highlight >}}

The root of the OSCAL profile model is [`profile`](/reference/latest/profile/xml-reference/#/profile).

In the example above, the contents of the `profile` element is provided as empty data items. These are included to illustrate the content model of an OSCAL profile, and we will be covering each element's syntax later in this tutorial.

The `id` attribute (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `profile` contains:

- `metadata` (required) - Provides document metadata for the profile. As OSCAL Metadata sections use a shared structure across all models, refer to the metadata tutorial section of the Catalog tutorial for more information.
- `import` (required) - This is explored below in the [import phase](#import-phase) section of this tutorial.
- `merge` (optional) - This is explored below in the [merge phase](#merge-phase) section of this tutorial.
- `modify` (optional) - This is explored below in the [modify phase](#modify-phase) section of this tutorial.
- `back-matter` (optional) – Contains references used within the profile. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{< /tabs >}}

We will now discuss each of these data structures in the following sections and identify how they each can be used to represent our baseline.

## The Three Sections (or Phases) of Profiles

OSCAL Profiles are broken up into three main sections, each representing a "phase" of operations to be applied to the source Catalog(s). 
 
They are:
- Import: Selects which controls from the source catalog(s) are to be used in the baseline
- Merge: Defines how to merge objects when importing from multiple catalogs, and defines the structure of the baseline
- Modify: Defines a list of modifications to make to the imported controls, such as setting parameters or changing values

As this is a basic tutorial, and many baselines are simply a subset of controls pulled from a larger catalog, we will be focusing mainly on the "Import" section, which covers many of the core use cases of OSCAL Profiles. 

## Import Section

"Import" is the first major section of an OSCAL Profile. In this section, the source catalog(s) are identified, and the subset of controls to be extracted are defined.
There will be one "Import" object per catalog referenced, so in the simple case of building a baseline from a single catalog, there will be a single "import" object. Lets look at a basic example:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata/>
    <import href="NIST_SP-800-53_rev5_catalog.xml">
        <include-controls>
            <with-id>ac-1</with-id>
        </include-controls>
    </import>
</profile>
{{< /highlight >}}

Here we can see the `<import>` element inside an example OSCAL Profile. The metadata section has been elided for length, but this is otherwise a valid profile.

{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
"profile": {
    "metadata": {},
    "imports": [
        {"href": "NIST_SP-800-53_rev5_catalog.xml",
         "include-controls": {
            "with-ids": ["ac-1"],
            }
    ]
}
{{< /highlight >}}

Here we can see the `import` object inside an example OSCAL Profile. The metadata section has been elided for length, but this is otherwise a valid profile.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
profile:
    metadata: ~
    imports:
        - href: NIST_SP-800-53_rev5_catalog.xml
          include-controls:
            - with-id: ac-1
{{< /highlight >}}

Here we can see the `import` object inside an example OSCAL Profile. The metadata section has been elided for length, but this is otherwise a valid profile.

{{% /tab %}}
{{< /tabs >}}

Now that we've seen a basic example, lets take a quick walkthrough of some of the basic functions of this section and how to use them.

### Including Controls from a Catalog

{{< tabs XML JSON YAML >}}
{{% tab %}}

The first step to create an import is to provide a valid `@href` attribute that provides a resolvable link to an OSCAL catalog. This can an absolute path, such as a file on a website, or a relative path, such as a local filesystem path. Either way, this link points to the OSCAL Catalog that we are going to be selecting controls from.

If we stop here, that is, we leave the `<import>` element empty, the default behavior is to include all the controls in the linked catalog (the same as if we had used `<include-all>`, see below).

But we presumably want a more fine-tuned selection of controls, so we will need to use the child element `<include-controls>`. Inside of this element we can use any number and any combination of the following two child elements:

- `<with-id>`: Provides a single ID value to be included from the linked source catalog.
- `<matching>`: Provides a string-matching pattern that includes any control it matches.

Lets look at a quick example of these methods of inclusions:

{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata/>
    <import href="NIST_SP-800-53_rev5_catalog.xml">
        <include-controls>
            <with-id>ac-1</with-id>
            <with-id>ac-2</with-id>
            <matching>
                <pattern>ac-3*</pattern>
            </matching>
        </include-controls>
    </import>
</profile>
{{< /highlight >}}

In this example, controls with the IDs of `ac-1` and `ac-2` will be included in the baseline due to our two `<with-id>` elements. Furthermore, any control whose ID starts with `ac-3` will be included by the `<matching>` element, such as `ac-3`, `ac-3.1`, and `ac-3.2`.

{{% /tab %}}
{{% tab %}}

The first step to create an import is to provide a valid `href` value that provides a resolvable link to an OSCAL catalog. This can an absolute path, such as a file on a website, or a relative path, such as a local filesystem path. Either way, this link points to the OSCAL Catalog that we are going to be selecting controls from.

If we stop here, that is, we leave the `import` object empty, the default behavior is to include all the controls in the linked catalog (the same as if we had used `include-all`, see below).

But we presumably want a more fine-tuned selection of controls, so we will need to use the child object `include-controls`. Inside of this object we can use any number and any combination of the following two child objects:

- `with-ids`: Provides a list of single ID values to be included from the linked source catalog.
- `matching`: Provides a string-matching pattern that includes any control it matches.

Lets look at a quick example of these methods of inclusions:

{{< highlight json "linenos=table" >}}
"profile": {
    "metadata": {},
    "imports": [
        {"href": "NIST_SP-800-53_rev5_catalog.xml",
         "include-controls": {
            "with-ids": ["ac-1","ac-2"],
            "matching":"ac-3*"
            }
    ]
}
{{< /highlight >}}

In this example, controls with the IDs of `ac-1` and `ac-2` will be included in the baseline due the two values inside `with-ids`. Furthermore, any control whose ID starts with `ac-3` will be included by the `matching` object, such as `ac-3`, `ac-3.1`, and `ac-3.2`.

{{% /tab %}}
{{% tab %}}

The first step to create an import is to provide a valid `href` value that provides a resolvable link to an OSCAL catalog. This can an absolute path, such as a file on a website, or a relative path, such as a local filesystem path. Either way, this link points to the OSCAL Catalog that we are going to be selecting controls from.

If we stop here, that is, we leave the `import` object empty, the default behavior is to include all the controls in the linked catalog (the same as if we had used `include-all`, see below).

But we presumably want a more fine-tuned selection of controls, so we will need to use the child object `include-controls`. Inside of this object we can use any number and any combination of the following two child objects:

- `with-ids`: Provides a list of single ID values to be included from the linked source catalog.
- `matching`: Provides a string-matching pattern that includes any control it matches.

Lets look at a quick example of these methods of inclusions:

{{< highlight yaml "linenos=table" >}}
profile:
  metadata: ~
  imports:
    - href: NIST_SP-800-53_rev5_catalog.xml
      include-controls:
        - with-ids:
          - ac-1
          - ac-2
        - matching:
            pattern: ac-3*

{{< /highlight >}}

In this example, controls with the IDs of `ac-1` and `ac-2` will be included in the baseline due the two values inside `with-ids`. Furthermore, any control whose ID starts with `ac-3` will be included by the `matching` object, such as `ac-3`, `ac-3.1`, and `ac-3.2`.

{{% /tab %}}
{{< /tabs >}}

### Excluding Controls from a Catalog

There are cases where manually listing each control to be included would be tedious, but using string matching or include-all would include controls we don't want in the baseline. When this happens, you can use control exclusion to better control which controls end up in the baseline. In the below example, we will include all of the controls from the linked catalog, then exclude a few of them.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata/>
    <import href="NIST_SP-800-53_rev5_catalog.xml">
        <include-all/>
        <exclude-controls>
          <with-id>ac-1</with-id>
          <with-id>ac-2</with-id>
        </exclude-controls>
    </import>
</profile>
{{< /highlight >}}

In this example, the baseline would be all controls in the linked catalog, except for the control with ID `ac-1`. Note the use of `<include-all>`, which simply includes all controls in the catalog, and is the default behaviour with an empty `<import>`.

{{% /tab %}}

{{% tab %}}
{{< highlight json "linenos=table" >}}
"profile": {
    "metadata": {},
    "imports": [
        {"href": "NIST_SP-800-53_rev5_catalog.xml",
         "include-all": {},
         "exclude-controls": {
           "with-ids": ["ac-1"]
          }
        }  
    ]
}
{{< /highlight >}}

In this example, the baseline would be all controls in the linked catalog, except for the control with ID `ac-1`. Note the use of `include-all`, which simply includes all controls in the catalog, and is the default behaviour with an empty `import`.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
profile:
    metadata: ~
    imports:
        - href: NIST_SP-800-53_rev5_catalog.xml
          include-all: ~
          exclude-controls:
            - with-ids:
              - ac-1
{{< /highlight >}}

In this example, the baseline would be all controls in the linked catalog, except for the control with ID `ac-1`. Note the use of `include-all`, which simply includes all controls in the catalog, and is the default behaviour with an empty `import`.

{{% /tab %}}
{{< /tabs >}}

### Mapping

TODO

## Merge Phase

TODO

## Modify Phase

TODO

## Summary

This concludes the tutorial. At this point you should be familiar with:

- The basic structure of a control baseline expressed in OSCAL.
- How to provide the basic metadata required to be included in an OSCAL profile.

For more information you can review the [OSCAL profile model documentation][profile-docs].

[profile-docs]: /concepts/layer/profile/
[baseline-definition]: /concepts/terminology/#baseline
[oscal-markup-line]: /reference/datatypes/#markup-line
[oscal-markup-multiline]: /reference/datatypes/#markup-multiline
