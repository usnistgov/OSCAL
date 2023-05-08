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

This tutorial covers creating and modifying a subset of controls from a catalog in OSCAL by using the OSCAL profile model. Such a subset of controls is often referred to as a "control baseline".

Before reading this tutorial you should:
- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Review the OSCAL control layer [overview](/concepts/layer/control/).
- Review the OSCAL [catalog](/concepts/layer/control/catalog/) and [profile](/concepts/layer/control/profile/) model overview pages.
- Review the tutorial on [Creating a Control Catalog](/learn/tutorials/catalog/).

## What is an OSCAL Profile?

An OSCAL profile is a specific set of security controls selected and modified when needed from one or more control catalogs for use in managing risks in an information system. Such a profile is also known as [baseline][baseline-definition], or overlay in the NIST SP 800-37 rev2, [Risk Management Framework for Information Systems and Organizations: A System Life Cycle Approach for Security and Privacy](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf).

An OSCAL profile is a machine-readable representation of a baseline, expressed using the OSCAL [profile model][profile-docs], which includes contextualizing documentation and metadata.
In the most basic sense, an OSCAL profile is a collection of "pointers" to other catalog(s)'s controls, along with instructions to tailor the controls and change how the controls are grouped.

An OSCAL profile can be transformed into an OSCAL catalog through a process named *profile resolution*, which is described in the [Profile Resolution Specification](/concepts/processing/profile-resolution/).
The output *resolved* catalog contains the controls selected, tailored, and grouped by the profile.

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
- `<metadata>` (required) - Provides document metadata for the profile. As OSCAL Metadata sections use a shared structure across all models, refer to the [metadata tutorial](metadata-tutorial) for more information.
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

In the example above, the contents of the `profile` object are provided as empty data items. These are included to illustrate the content model of an OSCAL profile, and we will be covering each element's syntax later in this tutorial.

The `id` property (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `profile` contains:

- `metadata` (required) - Provides document metadata for the profile. As OSCAL Metadata sections use a shared structure across all models, refer to the [metadata tutorial](metadata-tutorial) for more information.
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

In the example above, the contents of the `profile` object are provided as empty data items. These are included to illustrate the content model of an OSCAL profile, and we will be covering each element's syntax later in this tutorial.

The `id` property (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `profile` contains:

- `metadata` (required) - Provides document metadata for the profile. As OSCAL Metadata sections use a shared structure across all models, refer to the [metadata tutorial](metadata-tutorial) for more information.
- `import` (required) - This is explored below in the [import phase](#import-phase) section of this tutorial.
- `merge` (optional) - This is explored below in the [merge phase](#merge-phase) section of this tutorial.
- `modify` (optional) - This is explored below in the [modify phase](#modify-phase) section of this tutorial.
- `back-matter` (optional) – Contains references used within the profile. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{< /tabs >}}

We will now discuss each of these data structures in the following sections and identify how they each can be used to represent our baseline.

## The Three Sections (or Phases) of Profiles

OSCAL profiles are broken up into three main sections, each representing a "phase" of operations to be applied to the source catalog(s). 
 
They are:
- Import: Selects which controls from the source catalog(s) are to be used in the baseline
- Merge: Defines how to merge objects when importing from multiple catalogs, and defines the structure of the baseline
- Modify: Defines a list of modifications to make to the imported controls, such as setting parameters or changing values

As this is a basic tutorial, and many baselines are simply a subset of controls pulled from a larger catalog, we will be focusing mainly on the "Import" section, which covers many of the core use cases of OSCAL profiles. 

## Import Phase

The first major part of an OSCAL profile is the `import` section. In this section, the source catalog(s) are identified, and the subset of controls to be extracted are defined.

There will be one *import* object per catalog referenced, so in the simple case of building a baseline from a single catalog, there will be a single import object. Let's look at a basic example.

For the rest of this tutorial, we'll be using the catalog we [created during the last tutorial](https://pages.nist.gov/OSCAL/learn/tutorials/control/basic-catalog/#the-final-catalog).

{{< tabs XML JSON YAML >}}
{{% tab %}}

```xml {linenos=table}
<import href="https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json">
    <include-controls>
      <matching pattern="s1.1.*"/>
    </include-controls>
    <include-controls>
      <with-id>s2.1.2</with-id>
    </include-controls>
  </import>
```

Here we can see the `<import>` element inside an example OSCAL profile.

{{% /tab %}}
{{% tab %}}

```json {linenos=table}
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
```

Here we can see the `import` object inside an example OSCAL profile.
{{% /tab %}}
{{% tab %}}

```yaml {linenos=table}
 imports:
    - href: https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json
      include-controls:
        - matching:
            - pattern: s1.1.*
        - with-ids:
            - s2.1.2
```

Here we can see the `import` object inside an example OSCAL profile.
{{% /tab %}}
{{< /tabs >}}

Notice that for all three examples, we import a catalog defined in XML. The profile resolution specification allows us to import multiple documents irrespective of the input format (as long as it is valid OSCAL).

Now that we've seen a basic example, let's take a quick walkthrough of some of the basic functions of this section and how to use them.

### Including Controls from a Catalog

Each `import` object contains directives on which catalog will be included and present in the outcome.

Controls can be included based on pattern matching:

{{< tabs XML JSON YAML >}}
{{% tab %}}

```xml {linenos=table}
<import href="https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json">
    <include-controls>
      <matching pattern="s1.1.*"/>
    </include-controls>
</import>
```

{{% /tab %}}
{{% tab %}}
```json {linenos=table}
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
```

{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
  imports:
    - href: https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json
      include-controls:
        - matching:
            - pattern: s1.1.*
```

{{% /tab %}}
{{< /tabs >}}

Controls can also be included based on id matching:

{{< tabs XML JSON YAML >}}
{{% tab %}}

```xml {linenos=table}
<import href="https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json">
    <include-controls>
      <with-id>s2.1.2</with-id>
    </include-controls>
</import>
```

{{% /tab %}}
{{% tab %}}
```json {linenos=table}
 "imports": [
      {
        "href": "https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json",
        "include-controls": [
          {
            "with-ids": [
              "s2.1.2"
            ]
          }
        ]
      }
    ],

```


{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
imports:
    - href: https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json
      include-controls:
        - with-ids:
            - s2.1.2
```

{{% /tab %}}
{{< /tabs >}}

### Excluding Controls from a Catalog

It is possible to exclude controls from a catalog. Exclusions work the same way as inclusions; except in this case the indicated control(s) do  not appear in the target catalog.
The OSCAL profile Resolution Specification Draft contains a more detailed explanation of [excluding controls](https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/#d2e589-head).

{{< tabs XML JSON YAML >}}
{{% tab %}}

```xml {linenos=table}
<import href="https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json">
    <exclude-controls>
    </exclude-controls>
</import>
```
{{% /tab %}}
{{% tab %}}
```json {linenos=table}
"imports": [
      {
        "href": "https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json",
        "exclude-controls": [
          {
          }
        ]
      }
    ],
```

{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
imports:
    - href: https://raw.githubusercontent.com/usnistgov/oscal-content/main/examples/catalog/json/basic-catalog.json
      exclude-controls:
```
{{% /tab %}}
{{< /tabs >}}


## Merge Phase

The second part of an OSCAL profile represents the *merge* phase. In this section, the profile describes how the set of included objects from the import phase are to be combined.

The `merge` section provides directives as to how controls should be organized. It also provides directives for resolving conflicts where two or more variations of a control are imported as a result of multiple import statements. The three optional [structuring directives](https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/#d2e786-head) are `flat`, `as-is`, and `custom`. 

Profiles with the flat merge directive must be resolved as unstructured catalogs, with no groupings or nesting of controls. The flat directive was used in the profile as follows:

{{< tabs XML JSON YAML >}}
{{% tab %}}

```xml {linenos=table}
<merge>
    <flat/>
</merge>
```

{{% /tab %}}
{{% tab %}}

```json {linenos=table}
"merge": {
    "flat": {}
},
```

{{% /tab %}}
{{% tab %}}
```yaml {linenos=table}
merge:
    flat: {}
```
{{% /tab %}}
{{< /tabs >}}

The *flat* merge directive will produce an unstructured catalog with the following requirements:
All included controls are output to the target as a flat list directly under `catalog`.
- Any included "[*loose parameters*](https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/#d2e622-head) are output to the target as a flat list directly under `catalog`.
- Any groups are discarded.

An [`as-is`](https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/#d2e854-head) directive is used to reproduce the structure of the source documents in the target catalog.

A [`custom`](https://https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/#d2e887-head) directive provides the target catalog with a custom structure.

## Modify Phase

The third and final part of an OSCAL profile is the `modify` section.
In this section fine-grained edits can be made to the output resolved catalog.

These edits can be used to tailor controls to match an organization's needs, such as adding specific guidance, removing extraneous details, or even changing the meaning of a control.
This section offers a great deal of in-depth functionality; here we cover only the most useful basics.

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

Note that the `alter` statement cannot add subcontrols to, or remove them from, a target control, as that would conflict semantically with the `include` directive.

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

* `removes` is an array of objects that can remove some content from a control as selected by the `by-class`, `by-id`, `by-item-name`, `by-name`, or `by-ns` fields.
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

* `removes` is an array of objects that can remove some content from a control as selected by the `by-class`, `by-id`, `by-item-name`, `by-name`, or `by-ns` fields.
{{% /tab %}}
{{< /tabs >}}

## The Final Profile

After applying all of the techniques discussed in this tutorial, we obtain an OSCAL profile with the following structure:

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

The [profile resolution specification](/concepts/processing/profile-resolution/) describes how to use an input profile to generate a new *resolved* catalog that captures the selection, arrangement and changes made to the controls listed in the profile. The profile resolution specification has multiple NIST implementations, and is open to third party implementations maintained by the community.

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
- The use of the "Import" section to select controls from a source catalog.
- Using the "Merge" section to structure the output baseline.
- The use of the "Modify" section to set the values of parameters.

For more information you can review the [OSCAL profile model documentation][profile-docs].

[metadata-tutorial]: /learn/tutorials/general/metadata/
[profile-docs]: /concepts/layer/profile/
[baseline-definition]: /concepts/terminology/#baseline
[oscal-markup-line]: /reference/datatypes/#markup-line
[oscal-markup-multiline]: /reference/datatypes/#markup-multiline
