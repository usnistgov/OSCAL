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
    <metadata> ... </metadata>
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

Pending release of Mapping Functionality. Planned for OSCAL 1.1 release.

## Merge Phase

The Merge Phase is the second major section of an OSCAL Profile. This section contains instructions on how to structure and format the Control Baseline, including handling of duplicated control IDs. While this section is optional, leaving out will result in a generated OSCAL Catalog that has no formatting.

### Setting a Combine Method

Lets take a took at the first half of the Merge Phase, handling duplicated control IDs. This section is optional, but is important to include and config if you are importing from multiple Catalogs whose controls may have overlapping IDs. This issue is better handled using the Mapping feature above, but is covered here for pre-OSCAL version 1.1 releases.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata> ... </metadata>
    <import> ... </import>
    <merge>
      <combine method="use-first"/>
    </merge>
</profile>
{{< /highlight >}}

Above we see the use of the `<merge>` element, which contains all of the instructions of the Merge Phase. The first child element is what we are covering in this section: `<combine>`.

`<combine>` will always have an attribute `method`, which can be set to one of two string values: `"use-first"` or `"keep"`. Depending on the value chosen, duplicated IDs will be handled in the follow ways:

- `"use-first"`: If a control with a duplicate ID is found, the control that is found early in the imported documents will take priority, and the newly discovered control will be discarded entirely. Using this method risks losing controls, but will prevent duplicate ID errors in the Baseline.

- `"keep"`: When a duplicate Control ID is found, simply import it into the Baseline and continue. Using this method will cause a fatal error whenever two controls with the same ID are imported, ensuring that no information is lost, but preventing the generation of the Baseline.

If the `<merge>` element is not provided, or the `<combine>` element is not provided, or the `"method"` attribute is incorrectly set (or not set at all), the default behavior will be identical to if `"keep"` was used.

{{% /tab %}}

{{% tab %}}
{{< highlight json "linenos=table" >}}
"profile": {
    "metadata": {},
    "imports": [],
    "merge": {
      "combine":
        "method":"use-first"
    }
}
{{< /highlight >}}

Above we see the use of the `"merge"` object, which contains all of the instructions of the Merge Phase. The first child object is what we are covering in this section: `"combine"`.

`"combine"` will always have an object `"method"`, which can be set to one of two string values: `"use-first"` or `"keep"`. Depending on the value chosen, duplicated IDs will be handled in the follow ways:

- `"use-first"`: If a control with a duplicate ID is found, the control that is found early in the imported documents will take priority, and the newly discovered control will be discarded entirely. Using this method risks losing controls, but will prevent duplicate ID errors in the Baseline.

- `"keep"`: When a duplicate Control ID is found, simply import it into the Baseline and continue. Using this method will cause a fatal error whenever two controls with the same ID are imported, ensuring that no information is lost, but preventing the generation of the Baseline.

If the `"merge"` object is not provided, or the `"combine"` object is not provided, or the `"method"` object is incorrectly set (or not set at all), the default behavior will be identical to if `"keep"` was used.


{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
profile:
    metadata: ~
    imports: ~
    merge:
      combine:
        method: "use-first"

{{< /highlight >}}

Above we see the use of the `merge` object, which contains all of the instructions of the Merge Phase. The first child object is what we are covering in this section: `combine`.

`combine` will always have an object `method`, which can be set to one of two string values: `"use-first"` or `"keep"`. Depending on the value chosen, duplicated IDs will be handled in the follow ways:

- `"use-first"`: If a control with a duplicate ID is found, the control that is found early in the imported documents will take priority, and the newly discovered control will be discarded entirely. Using this method risks losing controls, but will prevent duplicate ID errors in the Baseline.

- `"keep"`: When a duplicate Control ID is found, simply import it into the Baseline and continue. Using this method will cause a fatal error whenever two controls with the same ID are imported, ensuring that no information is lost, but preventing the generation of the Baseline.

If the `merge` object is not provided, or the `combine` object is not provided, or the `method` object is incorrectly set (or not set at all), the default behavior will be identical to if `"keep"` was used.

{{% /tab %}}
{{< /tabs >}}

### Structuring the Baseline

Now we will cover the second part of the Merge Phase, structuring the Baseline. There are several options for handling this, depending on how much control you as the author want to have over the resulting Baseline. We will cover the two most common uses first, then cover the last option afterwards. This final option, referred to as Custom Structuring, is signifigantly more complex, and is only needed for specialized use cases.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata> ... </metadata>
    <import> ... </import>
    <merge>
      <combine method="use-first"/>
      <flat/> OR <as-is> true </as-is>
    </merge>
</profile>
{{< /highlight >}}

We have combined the first two options into one example above. In a real profile only one of the choices referred to by the `OR` would appear on that line.

When you provide the `<flat/>` choice, the outputted Baseline will be stripped of ALL formatting. Any and all controls or groups that have been imported during the previous Import Phase will be output into a flat list, with no hierarchy or structure. This means that controls that are children of a parent control will appear alongside, or on the same level as, their parents in the baseline. This loss of information is typically not preferable, but can be useful when creating small baselines, or when creating a machine-readable baseline that does not care about control structuring.

When you provide the `<as-is> true </as-is>` choice, structuring information is extracted from the Source Catalog(s) and replicated in the output Baseline. This means that child controls will still appear as children of their parents, and grouped controls will still appear under their respective groups in the Baseline. This is the most typical choice when creating a Baseline that imports from a single source Catalog.

If no `<merge>` element is provided, or none of the three structuring directives are provided, the default behavior will be identical to if you provided `<flat/>`.


{{% /tab %}}

{{% tab %}}
{{< highlight json "linenos=table" >}}
"profile": {
    "metadata": {},
    "imports": [],
    "merge": {
      "combine":
        "method":"use-first"
      "flat": null OR "as-is": "true"
    }
}
{{< /highlight >}}

We have combined the first two options into one example above. In a real profile only one of the choices referred to by the `OR` would appear on that line.

When you provide the `"flat"` choice, the outputted Baseline will be stripped of ALL formatting. Any and all controls or groups that have been imported during the previous Import Phase will be output into a flat list, with no hierarchy or structure. This means that controls that are children of a parent control will appear alongside, or on the same level as, their parents in the baseline. This loss of information is typically not preferable, but can be useful when creating small baselines, or when creating a machine-readable baseline that does not care about control structuring.

When you provide the `"as-is": "true"` choice, structuring information is extracted from the Source Catalog(s) and replicated in the output Baseline. This means that child controls will still appear as children of their parents, and grouped controls will still appear under their respective groups in the Baseline. This is the most typical choice when creating a Baseline that imports from a single source Catalog.

If no `"merge"` object is provided, or none of the three structuring directives are provided, the default behavior will be identical to if you provided `"flat"`.


{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
profile:
    metadata: ~
    imports: ~
    merge:
      combine:
        method: "use-first"
      flat: ~ OR as-is: true

{{< /highlight >}}

We have combined the first two options into one example above. In a real profile only one of the choices referred to by the `OR` would appear on that line.

When you provide the `flat` choice, the outputted Baseline will be stripped of ALL formatting. Any and all controls or groups that have been imported during the previous Import Phase will be output into a flat list, with no hierarchy or structure. This means that controls that are children of a parent control will appear alongside, or on the same level as, their parents in the baseline. This loss of information is typically not preferable, but can be useful when creating small baselines, or when creating a machine-readable baseline that does not care about control structuring.

When you provide the `as-is: true` choice, structuring information is extracted from the Source Catalog(s) and replicated in the output Baseline. This means that child controls will still appear as children of their parents, and grouped controls will still appear under their respective groups in the Baseline. This is the most typical choice when creating a Baseline that imports from a single source Catalog.

If no `merge` object is provided, or none of the three structuring directives are provided, the default behavior will be identical to if you provided `flat`.

{{% /tab %}}
{{< /tabs >}}

### The Custom Structuring Directive

There is a third choice besides `flat` and `as-is`, which is `custom`. This allows for you as the author to fully control the exact structure of the output Baseline. `custom` is useful for when you have very specific needs for the structure of the output, but you want to define that structure in a format neutral way in the profile, such that it can be shared to other users.

As `custom` is both complex and only used in limited cases, it will not be covered in this tutorial. Please refer to the [Profile Resolution Specification](/concepts/processing/profile-resolution/) or the [Profile model][profile-docs] for more information.

## Modify Phase

The third and final part of an OSCAL Profile is the `modify` section. In this section fine-grained edits can be made to the output baseline. There is a great deal of in-depth functionality available to use in this section, but we will only cover the most common use case in this tutorial: setting parameter values.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata> ... </metadata>
    <import> ... </import>
    <merge> ... </merge>
    <modify>
      <set-parameter param-id="param1">
        <value>true</value>
      </set-parameter>
    </modify>
</profile>
{{< /highlight >}}

In the above example, we see the `<modify>` section with a single `<set-parameter>` child. The `<modify>` element is optional, and can contain any number of `<set-parameter>` children.

Each `<set-parameter>` can make changes to a single parameter that has been imported from the source Catalog. The mandatory attribute `param-id` would be set to the exact ID of the parameter you want to make changes to. In this example we are setting the `<value>` of the parameter with ID `param1` to be `true`.

There are many other changes that can applied to parameters using the `<set-parameter>` element, but those are out-of-scope of this tutorial.

{{% /tab %}}

{{% tab %}}
{{< highlight json "linenos=table" >}}
"profile": {
    "metadata": {},
    "imports": [],
    "merge": {},
    "modify":
      "set-parameters": [
        {
          "param-id": "param1"
          "value": "true"
        }
      ]
}
{{< /highlight >}}

In the above example, we see the `"modify"` section with a single `"set-parameter"` child. The `"modify"` object is optional, and can contain any number of `"set-parameter"` children.

Each `"set-parameter"` can make changes to a single parameter that has been imported from the source Catalog. The mandatory child `"param-id"` would be set to the exact ID of the parameter you want to make changes to. In this example we are setting the `"value"` of the parameter with ID `"param1"` to be `"true"`.

There are many other changes that can applied to parameters using the `"set-parameter"` object, but those are out-of-scope of this tutorial.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
profile:
    metadata: ~
    imports: ~
    merge: ~
    modify:
      set-parameters:
        - param-id: param1
          value: true

{{< /highlight >}}

In the above example, we see the `modify` section with a single `set-parameter` child. The `modify` object is optional, and can contain any number of `set-parameter` children.

Each `set-parameter` can make changes to a single parameter that has been imported from the source Catalog. The mandatory child `param-id` would be set to the exact ID of the parameter you want to make changes to. In this example we are setting the `value` of the parameter with ID `param1` to be `true`.

There are many other changes that can applied to parameters using the `set-parameter` object, but those are out-of-scope of this tutorial.
{{% /tab %}}
{{< /tabs >}}



## Summary

This concludes the tutorial. At this point you should be familiar with:

- The basic structure of a control baseline expressed in OSCAL.
- The use of the Import Section to select controls from a Source Catalog
- Using the Merge Section to structure the output Baseline
- The use of the Modify Section to set the values of parameters

For more information you can review the [OSCAL profile model documentation][profile-docs].

[profile-docs]: /concepts/layer/profile/
[baseline-definition]: /concepts/terminology/#baseline
[oscal-markup-line]: /reference/datatypes/#markup-line
[oscal-markup-multiline]: /reference/datatypes/#markup-multiline
