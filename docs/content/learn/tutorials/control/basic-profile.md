---
title: Creating a Profile
description: A tutorial on creating a Baseline using an OSCAL Profile.
weight: 20
suppresstopiclist: true
toc:
  enabled: true
aliases:
  - /tutorials/profile/
  - /learn/tutorials/profile/
---

This tutorial covers creating a basic baseline using an OSCAL profile. Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Read the OSCAL control layer [overview](/concepts/layer/control/).
- Review the OSCAL [catalog](/concepts/layer/control/catalog/) and [profile](/concepts/layer/control/profile/) model overview pages.
- Review the tutorial on [Creating a Control Catalog](/learn/tutorials/catalog/).

## What is an OSCAL Profile?

A [baseline][baseline-definition], or overlay in other terminology, defines a specific set of selected security control requirements from one or more control catalogs for use in managing risks in an information system.

In the most basic sense, a baseline is simply another catalog, and could be represented using the OSCAL Catalog Model. However, baselines are fundementally based on and rooted in whichever source catalog(s) they use as a foundation. With this in mind, OSCAL uses a different model to represent baselines that identifies the source catalog(s),which controls it will "select" or "import", and any changes made to those controls. An **OSCAL Profile** is a machine-readable representation of a **baseline**, expressed using the OSCAL [Profile model][profile-docs], which includes contextualizing documentation and metadata.

OSCAL Profiles are created within the context of the [Profile Resolution Specification](/concepts/processing/profile-resolution/), which defines exactly how tools can programmatically understand OSCAL Profiles. 

This tutorial illustrates how to create an OSCAL profile using the OSCAL XML, JSON, and YAML formats, which each implement the OSCAL [profile model](/concepts/layer/control/profile/). The OSCAL project provides an [XML Schema and documentation](/concepts/layer/control/profile/), which is useful for validating an XML profile, and a [JSON Schema and documentation](/concepts/layer/control/profile/), which is useful for validating JSON and YAML profiles.

## Creating an OSCAL Profile

The examples below illustrate the top-level structure of the OSCAL profile model.

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="9510e179-7744-4afa-a9d3-92beadffd85f">
    <!-- To be filled in: -->
    <metadata/>
    <import/>
    <merge/>
    <modify/>
    <back-matter/>
</profile>
```

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
```json {linenos=table}
{
  "profile": {
    "uuid": "9510e179-7744-4afa-a9d3-92beadffd85f",
    // To be filled in:
    "metadata": {},
    "import": {},
    "merge": {},
    "modify": {},
    "back-matter": {}
  }
}
```

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
```yaml {linenos=table}
profile:
  uuid: "9510e179-7744-4afa-a9d3-92beadffd85f",
  # To be filled in:
  metadata: ~
  import: ~
  merge: ~
  modify: ~
  back-matter: ~
```

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

## Import Section **TODO**

"Import" is the first major section of an OSCAL Profile. In this section, the source catalog(s) are identified, and the subset of controls to be extracted are defined.
There will be one "Import" object per catalog referenced, so in the simple case of building a baseline from a single catalog, there will be a single "import" object. Lets look at a basic example.

For the rest of this tutorial, we'll be using the catalog we [created during the last tutorial](https://pages.nist.gov/OSCAL/learn/tutorials/control/basic-catalog/#the-final-catalog).

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
<import href="https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/xml/basic-catalog.xml">
    <include-controls>
        <with-id>s1.1.1</with-id>
    </include-controls>
</import>
```

Here we can see the `<import>` element inside an example OSCAL Profile.

{{% /tab %}}
{{% tab %}}
```json {linenos=table}
{
    "imports": [
        {"href": "https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/xml/basic-catalog.xml",
         "include-controls": {
            "with-ids": ["s1.1.1"],
            }
    ]
}
```

Here we can see the `import` object inside an example OSCAL Profile.
{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
imports:
    - href: https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/xml/basic-catalog.xml
      include-controls:
        - with-id: s1.1.1
```

Here we can see the `import` object inside an example OSCAL Profile.
{{% /tab %}}
{{< /tabs >}}

Notice that for all 3 examples, we import a catalog defined in XML. The profile resolution specification allows us to import multiple documents irrespective of the input format (as long as it is valid OSCAL).

Now that we've seen a basic example, lets take a quick walkthrough of some of the basic functions of this section and how to use them.

### Including Controls from a Catalog **TODO**

{{< tabs XML JSON YAML >}}
{{% tab %}}

The first step to create an import is to provide a valid `@href` attribute that provides a resolvable link to an OSCAL catalog. This can an absolute path, such as a file on a website, or a relative path, such as a local filesystem path. Either way, this link points to the OSCAL Catalog that we are going to be selecting controls from.

If we stop here, that is, we leave the `<import>` element empty, the default behavior is to include all the controls in the linked catalog (the same as if we had used `<include-all>`, see below).

But we presumably want a more fine-tuned selection of controls, so we will need to use the child element `<include-controls>`. Inside of this element we can use any number and any combination of the following two child elements:

- `<with-id>`: Provides a single ID value to be included from the linked source catalog.
- `<matching>`: Provides a string-matching pattern that includes any control it matches.

Lets look at a quick example of these methods of inclusions:

```xml {linenos=table}
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
```

In this example, controls with the IDs of `ac-1` and `ac-2` will be included in the baseline due to our two `<with-id>` elements. Furthermore, any control whose ID starts with `ac-3` will be included by the `<matching>` element, such as `ac-3`, `ac-3.1`, and `ac-3.2`.

{{% /tab %}}
{{% tab %}}

The first step to create an import is to provide a valid `href` value that provides a resolvable link to an OSCAL catalog. This can an absolute path, such as a file on a website, or a relative path, such as a local filesystem path. Either way, this link points to the OSCAL Catalog that we are going to be selecting controls from.

If we stop here, that is, we leave the `import` object empty, the default behavior is to include all the controls in the linked catalog (the same as if we had used `include-all`, see below).

But we presumably want a more fine-tuned selection of controls, so we will need to use the child object `include-controls`. Inside of this object we can use any number and any combination of the following two child objects:

- `with-ids`: Provides a list of single ID values to be included from the linked source catalog.
- `matching`: Provides a string-matching pattern that includes any control it matches.

Lets look at a quick example of these methods of inclusions:

```json {linenos=table}
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
```

In this example, controls with the IDs of `ac-1` and `ac-2` will be included in the baseline due the two values inside `with-ids`. Furthermore, any control whose ID starts with `ac-3` will be included by the `matching` object, such as `ac-3`, `ac-3.1`, and `ac-3.2`.

{{% /tab %}}
{{% tab %}}

The first step to create an import is to provide a valid `href` value that provides a resolvable link to an OSCAL catalog. This can an absolute path, such as a file on a website, or a relative path, such as a local filesystem path. Either way, this link points to the OSCAL Catalog that we are going to be selecting controls from.

If we stop here, that is, we leave the `import` object empty, the default behavior is to include all the controls in the linked catalog (the same as if we had used `include-all`, see below).

But we presumably want a more fine-tuned selection of controls, so we will need to use the child object `include-controls`. Inside of this object we can use any number and any combination of the following two child objects:

- `with-ids`: Provides a list of single ID values to be included from the linked source catalog.
- `matching`: Provides a string-matching pattern that includes any control it matches.

Lets look at a quick example of these methods of inclusions:

```yaml {linenos=table}
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

```

In this example, controls with the IDs of `ac-1` and `ac-2` will be included in the baseline due the two values inside `with-ids`. Furthermore, any control whose ID starts with `ac-3` will be included by the `matching` object, such as `ac-3`, `ac-3.1`, and `ac-3.2`.

{{% /tab %}}
{{< /tabs >}}

### Excluding Controls from a Catalog **TODO**

There are cases where manually listing each control to be included would be tedious, but using string matching or include-all would include controls we don't want in the baseline. When this happens, you can use control exclusion to better control which controls end up in the baseline. In the below example, we will include all of the controls from the linked catalog, then exclude a few of them.

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
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
```

In this example, the baseline would be all controls in the linked catalog, except for the control with ID `ac-1`. Note the use of `<include-all>`, which simply includes all controls in the catalog, and is the default behaviour with an empty `<import>`.

{{% /tab %}}

{{% tab %}}
```json {linenos=table}
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
```

In this example, the baseline would be all controls in the linked catalog, except for the control with ID `ac-1`. Note the use of `include-all`, which simply includes all controls in the catalog, and is the default behaviour with an empty `import`.

{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
profile:
    metadata: ~
    imports:
        - href: NIST_SP-800-53_rev5_catalog.xml
          include-all: ~
          exclude-controls:
            - with-ids:
              - ac-1
```

In this example, the baseline would be all controls in the linked catalog, except for the control with ID `ac-1`. Note the use of `include-all`, which simply includes all controls in the catalog, and is the default behaviour with an empty `import`.

{{% /tab %}}
{{< /tabs >}}

### Merge Phase **TODO**



## Modify Phase **TODO**

The Merge Phase is the second major section of an OSCAL Profile. This section contains instructions on how to structure and format the Control Baseline, including handling of duplicated control IDs. While this section is optional, leaving out will result in a generated OSCAL Catalog that has no formatting.

### Setting a Combine Method **TODO**

Lets take a took at the first half of the Merge Phase, handling duplicated control IDs. This section is optional, but is important to include and config if you are importing from multiple Catalogs whose controls may have overlapping IDs. This issue is better handled using the Mapping feature above, but is covered here for pre-OSCAL version 1.1 releases.

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="bad4b7fe-4c0a-4aaa-94de-1468d7dab38f">
    <metadata> ... </metadata>
    <import> ... </import>
    <merge>
      <combine method="use-first"/>
    </merge>
</profile>
```

Above we see the use of the `<merge>` element, which contains all of the instructions of the Merge Phase. The first child element is what we are covering in this section: `<combine>`.

`<combine>` will always have an attribute `method`, which can be set to one of two string values: `"use-first"` or `"keep"`. Depending on the value chosen, duplicated IDs will be handled in the follow ways:

- `"use-first"`: If a control with a duplicate ID is found, the control that is found early in the imported documents will take priority, and the newly discovered control will be discarded entirely. Using this method risks losing controls, but will prevent duplicate ID errors in the Baseline.

- `"keep"`: When a duplicate Control ID is found, simply import it into the Baseline and continue. Using this method will cause a fatal error whenever two controls with the same ID are imported, ensuring that no information is lost, but preventing the generation of the Baseline.

If the `<merge>` element is not provided, or the `<combine>` element is not provided, or the `"method"` attribute is incorrectly set (or not set at all), the default behavior will be identical to if `"keep"` was used.

{{% /tab %}}

{{% tab %}}
```json {linenos=table}
"profile": {
    "metadata": {},
    "imports": [],
    "merge": {
      "combine":
        "method":"use-first"
    }
}
```

Above we see the use of the `"merge"` object, which contains all of the instructions of the Merge Phase. The first child object is what we are covering in this section: `"combine"`.

`"combine"` will always have an object `"method"`, which can be set to one of two string values: `"use-first"` or `"keep"`. Depending on the value chosen, duplicated IDs will be handled in the follow ways:

- `"use-first"`: If a control with a duplicate ID is found, the control that is found early in the imported documents will take priority, and the newly discovered control will be discarded entirely. Using this method risks losing controls, but will prevent duplicate ID errors in the Baseline.

- `"keep"`: When a duplicate Control ID is found, simply import it into the Baseline and continue. Using this method will cause a fatal error whenever two controls with the same ID are imported, ensuring that no information is lost, but preventing the generation of the Baseline.

If the `"merge"` object is not provided, or the `"combine"` object is not provided, or the `"method"` object is incorrectly set (or not set at all), the default behavior will be identical to if `"keep"` was used.


{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
profile:
    metadata: ~
    imports: ~
    merge:
      combine:
        method: "use-first"

```

Above we see the use of the `merge` object, which contains all of the instructions of the Merge Phase. The first child object is what we are covering in this section: `combine`.

`combine` will always have an object `method`, which can be set to one of two string values: `"use-first"` or `"keep"`. Depending on the value chosen, duplicated IDs will be handled in the follow ways:

- `"use-first"`: If a control with a duplicate ID is found, the control that is found early in the imported documents will take priority, and the newly discovered control will be discarded entirely. Using this method risks losing controls, but will prevent duplicate ID errors in the Baseline.

- `"keep"`: When a duplicate Control ID is found, simply import it into the Baseline and continue. Using this method will cause a fatal error whenever two controls with the same ID are imported, ensuring that no information is lost, but preventing the generation of the Baseline.

If the `merge` object is not provided, or the `combine` object is not provided, or the `method` object is incorrectly set (or not set at all), the default behavior will be identical to if `"keep"` was used.

{{% /tab %}}
{{< /tabs >}}

### Structuring the Baseline **TODO**

Now we will cover the second part of the Merge Phase, structuring the Baseline. There are several options for handling this, depending on how much control you as the author want to have over the resulting Baseline. We will cover the two most common uses first, then cover the last option afterwards. This final option, referred to as Custom Structuring, is signifigantly more complex, and is only needed for specialized use cases.

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
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
```

We have combined the first two options into one example above. In a real profile only one of the choices referred to by the `OR` would appear on that line.

When you provide the `<flat/>` choice, the outputted Baseline will be stripped of ALL formatting. Any and all controls or groups that have been imported during the previous Import Phase will be output into a flat list, with no hierarchy or structure. This means that controls that are children of a parent control will appear alongside, or on the same level as, their parents in the baseline. This loss of information is typically not preferable, but can be useful when creating small baselines, or when creating a machine-readable baseline that does not care about control structuring.

When you provide the `<as-is> true </as-is>` choice, structuring information is extracted from the Source Catalog(s) and replicated in the output Baseline. This means that child controls will still appear as children of their parents, and grouped controls will still appear under their respective groups in the Baseline. This is the most typical choice when creating a Baseline that imports from a single source Catalog.

If no `<merge>` element is provided, or none of the three structuring directives are provided, the default behavior will be identical to if you provided `<flat/>`.


{{% /tab %}}

{{% tab %}}
```json {linenos=table}
"profile": {
    "metadata": {},
    "imports": [],
    "merge": {
      "combine":
        "method":"use-first"
      "flat": null OR "as-is": "true"
    }
}
```

We have combined the first two options into one example above. In a real profile only one of the choices referred to by the `OR` would appear on that line.

When you provide the `"flat"` choice, the outputted Baseline will be stripped of ALL formatting. Any and all controls or groups that have been imported during the previous Import Phase will be output into a flat list, with no hierarchy or structure. This means that controls that are children of a parent control will appear alongside, or on the same level as, their parents in the baseline. This loss of information is typically not preferable, but can be useful when creating small baselines, or when creating a machine-readable baseline that does not care about control structuring.

When you provide the `"as-is": "true"` choice, structuring information is extracted from the Source Catalog(s) and replicated in the output Baseline. This means that child controls will still appear as children of their parents, and grouped controls will still appear under their respective groups in the Baseline. This is the most typical choice when creating a Baseline that imports from a single source Catalog.

If no `"merge"` object is provided, or none of the three structuring directives are provided, the default behavior will be identical to if you provided `"flat"`.


{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
profile:
    metadata: ~
    imports: ~
    merge:
      combine:
        method: "use-first"
      flat: ~ OR as-is: true

```

We have combined the first two options into one example above. In a real profile only one of the choices referred to by the `OR` would appear on that line.

When you provide the `flat` choice, the outputted Baseline will be stripped of ALL formatting. Any and all controls or groups that have been imported during the previous Import Phase will be output into a flat list, with no hierarchy or structure. This means that controls that are children of a parent control will appear alongside, or on the same level as, their parents in the baseline. This loss of information is typically not preferable, but can be useful when creating small baselines, or when creating a machine-readable baseline that does not care about control structuring.

When you provide the `as-is: true` choice, structuring information is extracted from the Source Catalog(s) and replicated in the output Baseline. This means that child controls will still appear as children of their parents, and grouped controls will still appear under their respective groups in the Baseline. This is the most typical choice when creating a Baseline that imports from a single source Catalog.

If no `merge` object is provided, or none of the three structuring directives are provided, the default behavior will be identical to if you provided `flat`.

{{% /tab %}}
{{< /tabs >}}

### The Custom Structuring Directive **TODO**

There is a third choice besides `flat` and `as-is`, which is `custom`. This allows for you as the author to fully control the exact structure of the output Baseline. `custom` is useful for when you have very specific needs for the structure of the output, but you want to define that structure in a format neutral way in the profile, such that it can be shared to other users.

As `custom` is both complex and only used in limited cases, it will not be covered in this tutorial. Please refer to the [Profile Resolution Specification](/concepts/processing/profile-resolution/) or the [Profile model][profile-docs] for more information.

## Modify Phase

The third and final part of an OSCAL Profile is the `modify` section.
In this section fine-grained edits can be made to the output resolved catalog.
These edits can be used to tailor controls to match an organization's needs, such as adding specific guidance, removing extraneous details, or even changing the meaning of a control.
There is a great deal of in-depth functionality available to use in this section, but we will only be covering a decent starting point.

### Setting Parameters

The `set-parameters` directive can be used to modify all aspects of a [parameter](https://pages.nist.gov/OSCAL/reference/latest/catalog/json-reference/#/catalog/controls/params).

Let's say in our profile we wanted to change the label on the parameter `s1.1.1-prm_2` from our example catalog:

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
<param id="s1.1.1-prm_2">
    <label>a duration</label>
</param>
```

As profile authors, let's say we'd like to modify the parameter's label to be more specific:

```xml {linenos=table}
<set-parameter param-id="s1.1.1-prm_2">
  <label>a duration (maximum 30 minutes)</label>
</set-parameter>
```

The `<modify>` element can have any number of `<set-parameter>` elements within it.
`<set-parameter>` selects a parameter via the mandatory `@param-id` attribute and modifies the child items of the parameter (`label`, `class`, `usage`, etc.).
{{% /tab %}}
{{% tab %}}
```json {linenos=table}
{
  "params": [
    {
      "id": "s1.1.1-prm_2",
      "label": "a duration"
    }
  ]
}
```

As profile authors, let's say we'd like to modify the parameter's label to be more specific:

```json {linenos=table}
{
  "set-parameters": [
    {
      "param-id": "s1.1.1-prm_2",
      "label": "a duration (maximum 30 minutes)"
    }
  ],
}
```

The `modify` contains an optional array `set-parameters` within it.
`set-parameters` selects a parameter via the mandatory `param-id` field and modifies the child items of the parameter (`label`, `class`, `usage`, etc.).
{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
params:
  - id: s1.1.1-prm_2
    label: a duration
```

As profile authors, let's say we'd like to modify the parameter's label to be more specific:

```yaml {linenos=table}
set-parameters:
    param-id: s1.1.1-prm_2
    label: a duration (maximum 30 minutes)
```

The `modify` contains an optional array `set-parameters` within it.
`set-parameters` selects a parameter via the mandatory `param-id` field and modifies the child items of the parameter (`label`, `class`, `usage`, etc.).
{{% /tab %}}
{{% /tabs %}}
### Altering 

The `alter` directive is extremely powerful, and allows us to:

* Add content (`links`, `params`, `props`, and `parts`) to a given control at any position.
* Remove content from a control.

Note that the alter statement cannot add or remove sub-controls to a target control, as that would conflict semantically with the `include` directive.

For our example profile, let's say we wanted to add some supplemental guidance to control `s1.1.1` "Information security roles and responsibilities" from our example catalog:

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
<control id="s1.1.1">
  <title>Information security roles and responsibilities</title>
  <!-- Omitting non-relevant params, props, and parts for brevity -->
  <part id="s1.1.1_gdn" name="guidance">
      <part id="s1.1.1_gdn.1" name="item">
        <p>Allocation of information security responsibilities should be done in accordance with the information security policies. Responsibilities for the protection of individual assets and for carrying out specific information security processes should be identified. Responsibilities for information security risk management activities and in particular for acceptance of residual risks should be defined. These responsibilities should be supplemented, where necessary, with more detailed guidance for specific sites and information processing facilities. Local responsibilities for the protection of assets and for carrying out specific security processes should be defined.</p>
      </part>
      <part id="s1.1.1_gdn.2" name="item">
        <p>Individuals with allocated information security responsibilities may delegate security tasks to others. Nevertheless they remain accountable and should determine that any delegated tasks have been correctly performed.</p>
      </part>
      <part id="s1.1.1_gdn.3" name="item">
        <p>Areas for which individuals are responsible should be stated. In particular the following should take place:</p>
        <ol>
            <li>the assets and information security processes should be identified and defined;</li>
            <li>the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;</li>
            <li>authorization levels should be defined and documented;</li>
            <li>to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;</li>
            <li>coordination and oversight of information security aspects of supplier relationships should be identified and documented.</li>
        </ol>
      </part>
  </part>
</control>
```

As profile authors, let's say we'd like to insert a new `part` after `s.1.1.1_gdn.3` with additional guidance on setting an automatic lock on a specific platform:

```xml {linenos=table}
<alter control-id="s1.1.1">
  <add position="after" by-id="s1.1.1_gdn.3">
    <!-- new part to be inserted within s1.1.1 after s1.1.1_gdn.3 -->
    <part id="s1.1.1_gdn.4" name="item">
      <p>Users of devices running Gnome can adjust the inactivity timeout using the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en</p>
    </part>
  </add>
</alter>
```

A `<modify>` element can have any number of `<alter>` elements inside of it.
`<alter>` selects a single control through the mandatory `@control-id` attribute and modifies them with the following sub-elements:
* `<add>` elements can add some content to a control at a position specified by `@position`, which can be "before", "after", "starting", and "ending".
  If `@position` is set to "before" or "after", an object must be selected via the `@by-id` attribute.

* `<remove>` elements can remove some content from a control as selected by the `@by-class`, `@by-id`, `@by-item-name`, `@by-name`, or `@by-ns` attributes.

A single `<alter>` element can have multiple `<add>` and `<remove>` sub-elements.
{{% /tab %}}
{{% tab %}}
```json {linenos=table}
{
  "id": "s1.1.1",
  "title": "Information security roles and responsibilities",
  // Omitting non-relevant params, props, and parts for brevity
  "parts": [
    {
      "id": "s1.1.1_gdn",
      "name": "guidance",
      "parts": [
        {
          "id": "s1.1.1_gdn.1",
          "name": "item",
          "prose": "Allocation of information security responsibilities should be done in accordance with the information security policies. Responsibilities for the protection of individual assets and for carrying out specific information security processes should be identified. Responsibilities for information security risk management activities and in particular for acceptance of residual risks should be defined. These responsibilities should be supplemented, where necessary, with more detailed guidance for specific sites and information processing facilities. Local responsibilities for the protection of assets and for carrying out specific security processes should be defined."
        },
        {
          "id": "s1.1.1_gdn.2",
          "name": "item",
          "prose": "Individuals with allocated information security responsibilities may delegate security tasks to others. Nevertheless they remain accountable and should determine that any delegated tasks have been correctly performed."
        },
        {
          "id": "s1.1.1_gdn.3",
          "name": "item",
          "prose": "Areas for which individuals are responsible should be stated. In particular the following should take place:\n\n1. the assets and information security processes should be identified and defined;\n1. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;\n1. authorization levels should be defined and documented;\n1. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;\n1. coordination and oversight of information security aspects of supplier relationships should be identified and documented.\n"
        }
      ]
    }
  ]
}
```

As profile authors, let's say we'd like to insert a new `part` after `s.1.1.1_gdn.3` with additional guidance on setting an automatic lock on a specific platform:

```json {linenos=table}
{
  "alters": [
    {
      "control-id": "s1.1.1",
      "adds": [
        {
          "by-id": "s1.1.1_gdn.3",
          "position": "after",
          "parts": [
            {
              "id": "s1.1.1_gdn.4",
              "name": "item",
              "prose": "Users of devices running Gnome can adjust the inactivity timeout using the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en"
            }
          ]
        }
      ]
    }
  ]
}
```

A `modify` object has an optional array of `alters` objects.
`alters` objects select a single control through the mandatory `control-id` field and modifies them with the following sub-objects:
* `adds` is an array of objects can add some content to a control at a position specified by the `position` field, which can be "before", "after", "starting", and "ending".
  If `position` is set to "before" or "after", an object must be selected via the `by-id` field.

* `remove` is an array of objects that can remove some content from a control as selected by the `by-class`, `by-id`, `by-item-name`, `by-name`, or `by-ns` fields.
{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
---
id: s1.1.1
title: Information security roles and responsibilities
parts:
- id: s1.1.1_gdn
  name: guidance
  parts:
  - id: s1.1.1_gdn.1
    name: item
    prose: Allocation of information security responsibilities should be done in accordance
      with the information security policies. Responsibilities for the protection
      of individual assets and for carrying out specific information security processes
      should be identified. Responsibilities for information security risk management
      activities and in particular for acceptance of residual risks should be defined.
      These responsibilities should be supplemented, where necessary, with more detailed
      guidance for specific sites and information processing facilities. Local responsibilities
      for the protection of assets and for carrying out specific security processes
      should be defined.
  - id: s1.1.1_gdn.2
    name: item
    prose: Individuals with allocated information security responsibilities may delegate
      security tasks to others. Nevertheless they remain accountable and should determine
      that any delegated tasks have been correctly performed.
  - id: s1.1.1_gdn.3
    name: item
    prose: |
      Areas for which individuals are responsible should be stated. In particular the following should take place:

      1. the assets and information security processes should be identified and defined;
      1. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;
      1. authorization levels should be defined and documented;
      1. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;
      1. coordination and oversight of information security aspects of supplier relationships should be identified and documented.
```

As profile authors, let's say we'd like to insert a new `part` after `s.1.1.1_gdn.3` with additional guidance on setting an automatic lock on a specific platform:

```yaml {linenos=table}
---
alters:
- control-id: s1.1.1
  adds:
  - by-id: s1.1.1_gdn.3
    position: after
    parts:
    - id: s1.1.1_gdn.4
      name: item
      prose: 'Users of devices running Gnome can adjust the inactivity timeout using
        the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en'
```

A `modify` object has an optional array of `alters` objects.
`alters` objects select a single control through the mandatory `control-id` field and modifies them with the following sub-objects:
* `adds` is an array of objects can add some content to a control at a position specified by the `position` field, which can be "before", "after", "starting", and "ending".
  If `position` is set to "before" or "after", an object must be selected via the `by-id` field.

* `remove` is an array of objects that can remove some content from a control as selected by the `by-class`, `by-id`, `by-item-name`, `by-name`, or `by-ns` fields.
{{% /tab %}}
{{< /tabs >}}

## The Final Profile

After applying all of the techniques discussed in this tutorial, we obtain an OSCAL Profile with the following structure:

{{< tabs XML JSON YAML >}}
{{% tab %}}
```xml {linenos=table}
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" uuid="c0dc468c-934e-4fe9-b5bf-9fc63f5a2915">
  <metadata>
    <title>Sample Security Profile 
      <em>for Demonstration</em> and Testing
    </title>
    <last-modified>2023-04-10T10:31:28.355446-04:00</last-modified>
    <version>1.0</version>
    <oscal-version>1.04</oscal-version>
    <revisions/>
    <remarks>
      <p>The following document is used in the OSCAL Profile Tutorial and builds on the catalog created for the OSCAL Catalog Tutorial</p>
    </remarks>
  </metadata>
  <import href="https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json">
    <include-controls>
      <matching pattern="s1.1.*"/>
    </include-controls>
    <include-controls>
      <with-id>s2.1.2</with-id>
    </include-controls>
  </import>
  <merge>
    <flat/>
  </merge>
  <modify>
    <set-parameter param-id="s1.1.1-prm_2">
      <label>a duration (maximum 30 minutes)</label>
    </set-parameter>
    <alter control-id="s1.1.1">
      <add position="after" by-id="s1.1.1_gdn.3">
        <part id="s1.1.1_gdn.4" name="item">
          <p>Users of devices running Gnome can adjust the inactivity timeout using the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en</p>
        </part>
      </add>
    </alter>
  </modify>
</profile>
```
{{% /tab %}}
{{% tab %}}
```json {linenos=table}
{
  "profile": {
    "uuid": "c0dc468c-934e-4fe9-b5bf-9fc63f5a2915",
    "metadata": {
      "title": "Sample Security Profile *for Demonstration* and Testing",
      "last-modified": "2023-04-10T10:31:28.355446-04:00",
      "version": "1.0",
      "oscal-version": "1.04",
      "remarks": "The following document is used in the OSCAL Profile Tutorial and builds on the catalog created for the OSCAL Catalog Tutorial"
    },
    "imports": [
      {
        "href": "https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json",
        "include-controls": [
          {
            "matching": [
              {
                "pattern": "s1.1.*"
              }
            ]
          },
          {
            "with-ids": [
              "s2.1.2"
            ]
          }
        ]
      }
    ],
    "merge": {
      "flat": {}
    },
    "modify": {
      "set-parameters": [
        {
          "param-id": "s1.1.1-prm_2",
          "label": "a duration (maximum 30 minutes)"
        }
      ],
      "alters": [
        {
          "control-id": "s1.1.1",
          "adds": [
            {
              "by-id": "s1.1.1_gdn.3",
              "position": "after",
              "parts": [
                {
                  "id": "s1.1.1_gdn.4",
                  "name": "item",
                  "prose": "Users of devices running Gnome can adjust the inactivity timeout using the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en"
                }
              ]
            }
          ]
        }
      ]
    }
  }
}
```
{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
---
profile:
  uuid: c0dc468c-934e-4fe9-b5bf-9fc63f5a2915
  metadata:
    title: Sample Security Profile *for Demonstration* and Testing
    last-modified: "2023-04-10T10:31:28.355446-04:00"
    version: "1.0"
    oscal-version: "1.04"
    remarks:
      The following document is used in the OSCAL Profile Tutorial and builds
      on the catalog created for the OSCAL Catalog Tutorial
  imports:
    - href: https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json
      include-controls:
        - matching:
            - pattern: s1.1.*
        - with-ids:
            - s2.1.2
  merge:
    flat: {}
  modify:
    set-parameters:
      - param-id: s1.1.1-prm_2
        label: a duration (maximum 30 minutes)
    alters:
      - control-id: s1.1.1
        adds:
          - by-id: s1.1.1_gdn.3
            position: after
            parts:
              - id: s1.1.1_gdn.4
                name: item
                prose:
                  "Users of devices running Gnome can adjust the inactivity timeout
                  using the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en"

```
{{% /tab %}}
{{< /tabs >}}

### Obtaining a Resolved Catalog

The [profile resolution specification](/concepts/processing/profile-resolution/) describes how to use an input profile to generate a new "resolved" catalog that captures the transformations made to the controls listed in the profile. The profile resolution specitication has multiple NIST implementations, and is open to third party implementations maintained by the community.

For this example, let's use the NIST-maintained [OSCAL Command Line Interface (CLI)](https://github.com/usnistgov/oscal-cli). Upon installation, a user can perform profile resolution with the OSCAL-CLI as follows:

{{< tabs XML JSON YAML >}}
{{% tab %}}
```bash
# Resolve input profile saved to "profile.xml"
$ oscal-cli profile resolve profile.xml
```

Notice, that the OSCAL CLI automatically detects the file type of the profile and produces the following output catalog:

```xml {linenos=table}
<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0" uuid="9510e179-7744-4afa-a9d3-92beadffd85f">
  <metadata>
    <title>Sample Security Profile 
      <em>for Demonstration</em> and Testing
    </title>
    <last-modified>2023-04-10T19:13:52.867888591Z</last-modified>
    <version>1.0</version>
    <oscal-version>1.04</oscal-version>
    <revisions/>
  </metadata>
  <control id="s1.1.1">
    <title>Information security roles and responsibilities</title>
    <param id="s1.1.1-prm1">
      <label>a choice from a selection</label>
      <select how-many="one-or-more">
        <choice>initiating a device lock after 
          <insert type="param" id-ref="s1.1.1-prm_2"/> of inactivity
        </choice>
        <choice>requiring the user to initiate a device lock before leaving the system unattended</choice>
      </select>
    </param>
    <param id="s1.1.1-prm_2">
      <label>a duration (maximum 30 minutes)</label>
    </param>
    <prop name="label" value="1.1.1"/>
    <part id="s1.1.1_stm" name="statement">
      <p>All information security responsibilities should be defined and allocated.</p>
      <p>A value has been assigned to 
        <insert type="param" id-ref="s1.1.1-prm1"/>.
      </p>
      <p>A cross link has been established with a choppy syntax: 
        <a href="#s1.2">(choppy)</a>.
      </p>
    </part>
    <part id="s1.1.1_gdn" name="guidance">
      <part id="s1.1.1_gdn.1" name="item">
        <p>Allocation of information security responsibilities should be done in accordance with the information security policies. Responsibilities for the protection of individual assets and for carrying out specific information security processes should be identified. Responsibilities for information security risk management activities and in particular for acceptance of residual risks should be defined. These responsibilities should be supplemented, where necessary, with more detailed guidance for specific sites and information processing facilities. Local responsibilities for the protection of assets and for carrying out specific security processes should be defined.</p>
      </part>
      <part id="s1.1.1_gdn.2" name="item">
        <p>Individuals with allocated information security responsibilities may delegate security tasks to others. Nevertheless they remain accountable and should determine that any delegated tasks have been correctly performed.</p>
      </part>
      <part id="s1.1.1_gdn.3" name="item">
        <p>Areas for which individuals are responsible should be stated. In particular the following should take place:</p>
        <ol>
          <li>
            <p>the assets and information security processes should be identified and defined;</p>
          </li>
          <li>
            <p>the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;</p>
          </li>
          <li>
            <p>authorization levels should be defined and documented;</p>
          </li>
          <li>
            <p>to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;</p>
          </li>
          <li>
            <p>coordination and oversight of information security aspects of supplier relationships should be identified and documented.</p>
          </li>
        </ol>
      </part>
      <part id="s1.1.1_gdn.4" name="item">
        <p>Users of devices running Gnome can adjust the inactivity timeout using the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en</p>
      </part>
    </part>
    <part id="s1.1.1_inf" name="information">
      <prop name="label" value="Other information"/>
      <p>Many organizations appoint an information security manager to take overall responsibility for the development and implementation of information security and to support the identification of controls.</p>
      <p>However, responsibility for resourcing and implementing the controls will often remain with individual managers. One common practice is to appoint an owner for each asset who then becomes responsible for its day-to-day protection.</p>
    </part>
  </control>
  <control id="s1.1.2">
    <title>Segregation of duties</title>
    <prop name="label" value="1.1.2"/>
    <part id="s1.1.2_stm" name="statement">
      <p>Conflicting duties and areas of responsibility should be segregated to reduce opportunities for unauthorized or unintentional modification or misuse of the organization’s assets.</p>
    </part>
    <part id="s1.1.2_gdn" name="guidance">
      <part id="s1.1.2_gdn.1" name="item">
        <p>Care should be taken that no single person can access, modify or use assets without authorization or detection. The initiation of an event should be separated from its authorization. The possibility of collusion should be considered in designing the controls.</p>
      </part>
      <part id="s1.1.2_gdn.2" name="item">
        <p>Small organizations may find segregation of duties difficult to achieve, but the principle should be applied as far as is possible and practicable. Whenever it is difficult to segregate, other controls such as monitoring of activities, audit trails and management supervision should be considered.</p>
      </part>
    </part>
    <part id="s1.1.2_inf" name="information">
      <p>Segregation of duties is a method for reducing the risk of accidental or deliberate misuse of an organization’s assets.</p>
    </part>
  </control>
  <control id="s2.1.2">
    <title>Access to networks and network services</title>
    <prop name="label" value="2.1.2"/>
    <part id="s2.1.2_stm" name="statement">
      <p>Users should only be provided with access to the network and network services that they have been specifically authorized to use.</p>
    </part>
    <part id="s2.1.2_gdn" name="guidance">
      <part id="s2.1.2_gdn.1" name="item">
        <p>A policy should be formulated concerning the use of networks and network services. This policy should cover:</p>
        <ol>
          <li>
            <p>the networks and network services which are allowed to be accessed;</p>
          </li>
          <li>
            <p>authorization procedures for determining who is allowed to access which networks and networked services;</p>
          </li>
          <li>
            <p>management controls and procedures to protect access to network connections and network services;</p>
          </li>
          <li>
            <p>the means used to access networks and network services (e.g. use of VPN or wireless network);</p>
          </li>
          <li>
            <p>user authentication requirements for accessing various network services;</p>
          </li>
          <li>
            <p>monitoring of the use of network service</p>
          </li>
        </ol>
      </part>
      <part id="s2.1.2_gdn.2" name="item">
        <p>The policy on the use of network services should be consistent with the organization’s access control policy</p>
      </part>
    </part>
  </control>
</catalog>
```

{{% /tab %}}
{{% tab %}}
```bash
# Resolve input profile saved to "profile.json"
$ oscal-cli profile resolve profile.json
```

Notice, that the OSCAL CLI automatically detects the file type of the profile and produces the following output catalog:

```json {linenos=table}
{
  "catalog": {
    "uuid": "9510e179-7744-4afa-a9d3-92beadffd85f",
    "metadata": {
      "title": "Sample Security Profile *for Demonstration* and Testing",
      "last-modified": "2023-04-10T19:13:52.867888591Z",
      "version": "1.0",
      "oscal-version": "1.04"
    },
    "controls": [
      {
        "id": "s1.1.1",
        "title": "Information security roles and responsibilities",
        "params": [
          {
            "id": "s1.1.1-prm1",
            "label": "a choice from a selection",
            "select": {
              "how-many": "one-or-more",
              "choice": [
                "initiating a device lock after {{ insert: param, s1.1.1-prm_2 }} of inactivity",
                "requiring the user to initiate a device lock before leaving the system unattended"
              ]
            }
          },
          {
            "id": "s1.1.1-prm_2",
            "label": "a duration (maximum 30 minutes)"
          }
        ],
        "props": [
          {
            "name": "label",
            "value": "1.1.1"
          }
        ],
        "parts": [
          {
            "id": "s1.1.1_stm",
            "name": "statement",
            "prose": "All information security responsibilities should be defined and allocated.\n\nA value has been assigned to {{ insert: param, s1.1.1-prm1 }}.\n\nA cross link has been established with a choppy syntax: [(choppy)](#s1.2)."
          },
          {
            "id": "s1.1.1_gdn",
            "name": "guidance",
            "parts": [
              {
                "id": "s1.1.1_gdn.1",
                "name": "item",
                "prose": "Allocation of information security responsibilities should be done in accordance with the information security policies. Responsibilities for the protection of individual assets and for carrying out specific information security processes should be identified. Responsibilities for information security risk management activities and in particular for acceptance of residual risks should be defined. These responsibilities should be supplemented, where necessary, with more detailed guidance for specific sites and information processing facilities. Local responsibilities for the protection of assets and for carrying out specific security processes should be defined."
              },
              {
                "id": "s1.1.1_gdn.2",
                "name": "item",
                "prose": "Individuals with allocated information security responsibilities may delegate security tasks to others. Nevertheless they remain accountable and should determine that any delegated tasks have been correctly performed."
              },
              {
                "id": "s1.1.1_gdn.3",
                "name": "item",
                "prose": "Areas for which individuals are responsible should be stated. In particular the following should take place:\n\n1. the assets and information security processes should be identified and defined;\n2. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;\n3. authorization levels should be defined and documented;\n4. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;\n5. coordination and oversight of information security aspects of supplier relationships should be identified and documented."
              },
              {
                "id": "s1.1.1_gdn.4",
                "name": "item",
                "prose": "Users of devices running Gnome can adjust the inactivity timeout using the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en"
              }
            ]
          },
          {
            "id": "s1.1.1_inf",
            "name": "information",
            "props": [
              {
                "name": "label",
                "value": "Other information"
              }
            ],
            "prose": "Many organizations appoint an information security manager to take overall responsibility for the development and implementation of information security and to support the identification of controls.\n\nHowever, responsibility for resourcing and implementing the controls will often remain with individual managers. One common practice is to appoint an owner for each asset who then becomes responsible for its day-to-day protection."
          }
        ]
      },
      {
        "id": "s1.1.2",
        "title": "Segregation of duties",
        "props": [
          {
            "name": "label",
            "value": "1.1.2"
          }
        ],
        "parts": [
          {
            "id": "s1.1.2_stm",
            "name": "statement",
            "prose": "Conflicting duties and areas of responsibility should be segregated to reduce opportunities for unauthorized or unintentional modification or misuse of the organization’s assets."
          },
          {
            "id": "s1.1.2_gdn",
            "name": "guidance",
            "parts": [
              {
                "id": "s1.1.2_gdn.1",
                "name": "item",
                "prose": "Care should be taken that no single person can access, modify or use assets without authorization or detection. The initiation of an event should be separated from its authorization. The possibility of collusion should be considered in designing the controls."
              },
              {
                "id": "s1.1.2_gdn.2",
                "name": "item",
                "prose": "Small organizations may find segregation of duties difficult to achieve, but the principle should be applied as far as is possible and practicable. Whenever it is difficult to segregate, other controls such as monitoring of activities, audit trails and management supervision should be considered."
              }
            ]
          },
          {
            "id": "s1.1.2_inf",
            "name": "information",
            "prose": "Segregation of duties is a method for reducing the risk of accidental or deliberate misuse of an organization’s assets."
          }
        ]
      },
      {
        "id": "s2.1.2",
        "title": "Access to networks and network services",
        "props": [
          {
            "name": "label",
            "value": "2.1.2"
          }
        ],
        "parts": [
          {
            "id": "s2.1.2_stm",
            "name": "statement",
            "prose": "Users should only be provided with access to the network and network services that they have been specifically authorized to use."
          },
          {
            "id": "s2.1.2_gdn",
            "name": "guidance",
            "parts": [
              {
                "id": "s2.1.2_gdn.1",
                "name": "item",
                "prose": "A policy should be formulated concerning the use of networks and network services. This policy should cover:\n\n1. the networks and network services which are allowed to be accessed;\n2. authorization procedures for determining who is allowed to access which networks and networked services;\n3. management controls and procedures to protect access to network connections and network services;\n4. the means used to access networks and network services (e.g. use of VPN or wireless network);\n5. user authentication requirements for accessing various network services;\n6. monitoring of the use of network service"
              },
              {
                "id": "s2.1.2_gdn.2",
                "name": "item",
                "prose": "The policy on the use of network services should be consistent with the organization’s access control policy"
              }
            ]
          }
        ]
      }
    ]
  }
}
```    

{{% /tab %}}
{{% tab %}}
```bash
# Resolve input profile saved to "profile.yaml"
$ oscal-cli profile resolve profile.yaml
```

Notice, that the OSCAL CLI automatically detects the file type of the profile and produces the following output catalog:

```yaml {linenos=table}
---
catalog:
  uuid: 9510e179-7744-4afa-a9d3-92beadffd85f
  metadata:
    title: Sample Security Profile *for Demonstration* and Testing
    last-modified: "2023-04-10T19:13:52.867888591Z"
    version: "1.0"
    oscal-version: "1.04"
  controls:
    - id: s1.1.1
      title: Information security roles and responsibilities
      params:
        - id: s1.1.1-prm1
          label: a choice from a selection
          select:
            how-many: one-or-more
            choice:
              - "initiating a device lock after {{ insert: param, s1.1.1-prm_2 }} of inactivity"
              - requiring the user to initiate a device lock before leaving the system unattended
        - id: s1.1.1-prm_2
          label: a duration (maximum 30 minutes)
      props:
        - name: label
          value: 1.1.1
      parts:
        - id: s1.1.1_stm
          name: statement
          prose: |-
            All information security responsibilities should be defined and allocated.

            A value has been assigned to {{ insert: param, s1.1.1-prm1 }}.

            A cross link has been established with a choppy syntax: [(choppy)](#s1.2).
        - id: s1.1.1_gdn
          name: guidance
          parts:
            - id: s1.1.1_gdn.1
              name: item
              prose:
                Allocation of information security responsibilities should be done
                in accordance with the information security policies. Responsibilities for
                the protection of individual assets and for carrying out specific information
                security processes should be identified. Responsibilities for information
                security risk management activities and in particular for acceptance of
                residual risks should be defined. These responsibilities should be supplemented,
                where necessary, with more detailed guidance for specific sites and information
                processing facilities. Local responsibilities for the protection of assets
                and for carrying out specific security processes should be defined.
            - id: s1.1.1_gdn.2
              name: item
              prose:
                Individuals with allocated information security responsibilities may
                delegate security tasks to others. Nevertheless they remain accountable
                and should determine that any delegated tasks have been correctly performed.
            - id: s1.1.1_gdn.3
              name: item
              prose: |-
                Areas for which individuals are responsible should be stated. In particular the following should take place:

                1. the assets and information security processes should be identified and defined;
                2. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;
                3. authorization levels should be defined and documented;
                4. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;
                5. coordination and oversight of information security aspects of supplier relationships should be identified and documented.
            - id: s1.1.1_gdn.4
              name: item
              prose:
                "Users of devices running Gnome can adjust the inactivity timeout using
                the following link: https://help.gnome.org/admin/system-admin-guide/stable/desktop-lockscreen.html.en"
        - id: s1.1.1_inf
          name: information
          props:
            - name: label
              value: Other information
          prose: |-
            Many organizations appoint an information security manager to take overall responsibility for the development and implementation of information security and to support the identification of controls.

            However, responsibility for resourcing and implementing the controls will often remain with individual managers. One common practice is to appoint an owner for each asset who then becomes responsible for its day-to-day protection.
    - id: s1.1.2
      title: Segregation of duties
      props:
        - name: label
          value: 1.1.2
      parts:
        - id: s1.1.2_stm
          name: statement
          prose:
            Conflicting duties and areas of responsibility should be segregated to
            reduce opportunities for unauthorized or unintentional modification or misuse
            of the organization’s assets.
        - id: s1.1.2_gdn
          name: guidance
          parts:
            - id: s1.1.2_gdn.1
              name: item
              prose:
                Care should be taken that no single person can access, modify or use
                assets without authorization or detection. The initiation of an event should
                be separated from its authorization. The possibility of collusion should
                be considered in designing the controls.
            - id: s1.1.2_gdn.2
              name: item
              prose:
                Small organizations may find segregation of duties difficult to achieve,
                but the principle should be applied as far as is possible and practicable.
                Whenever it is difficult to segregate, other controls such as monitoring
                of activities, audit trails and management supervision should be considered.
        - id: s1.1.2_inf
          name: information
          prose:
            Segregation of duties is a method for reducing the risk of accidental
            or deliberate misuse of an organization’s assets.
    - id: s2.1.2
      title: Access to networks and network services
      props:
        - name: label
          value: 2.1.2
      parts:
        - id: s2.1.2_stm
          name: statement
          prose:
            Users should only be provided with access to the network and network
            services that they have been specifically authorized to use.
        - id: s2.1.2_gdn
          name: guidance
          parts:
            - id: s2.1.2_gdn.1
              name: item
              prose: |-
                A policy should be formulated concerning the use of networks and network services. This policy should cover:

                1. the networks and network services which are allowed to be accessed;
                2. authorization procedures for determining who is allowed to access which networks and networked services;
                3. management controls and procedures to protect access to network connections and network services;
                4. the means used to access networks and network services (e.g. use of VPN or wireless network);
                5. user authentication requirements for accessing various network services;
                6. monitoring of the use of network service
            - id: s2.1.2_gdn.2
              name: item
              prose:
                The policy on the use of network services should be consistent with
                the organization’s access control policy
```

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
