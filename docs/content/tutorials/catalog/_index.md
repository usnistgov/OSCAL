---
title: Creating a Basic OSCAL Catalog
description: A tutorial on creating a basic OSCAL catalog.
weight: 5

---

## What is an OSCAL Catalog?

A [catalog][catalog-definition] is a collection of *security and privacy controls*, and related *control enhancements*.

An **OSCAL Control Catalog** is a machine-readable representation of a **catalog**, expressed using the OSCAL [Catalog model][catalog-docs], which includes contextualizing documentation and metadata.

The OSCAL Catalog model provides machine-readable formats in XML, JSON, and YAML, which support representing an equivalent set of catalog information. Examples in this tutorial are provided for XML, JSON, and YAML to show the equivalent representations.

This tutorial describes the formatting of such a catalog using the OSCAL Catalog model XML format.

For the purpose of this tutorial, an [example prose catalog][catalog-prose-sample] has been created.

## Creating an OSCAL Catalog

An OSCAL catalog (in XML or JSON) uses the respective schemas that describe the XML tag sets or the JSON data objects.
However, this tutorial is not focusing on the schemas themselves but rather on the formatting in OSCAL of the proprietary control catalog listed above. 
For more information on each schemas, the reader is referred to [XML Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-schema/) 
and [JSON Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/json-schema/), respectively.

The root of the Control Catalog format is `catalog`. 

In the example below, the contents of the `catalog` are provided as empty data items. These are included to illustrate the content model of `catalog`, and we will be covering their syntax later in this tutorial.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    id="uuid-ed364452-47f8-4e70-b3a4-ef54de5f46ef">
    <metadata/>
    <group/>
    <control/>
    <back-matter/>
</catalog>
{{< /highlight >}}

The `@id` attribute (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `catalog` contains:

- `metadata` (required) - Provides document metadata for the catalog.
- `group` (optional) - Allows for grouping of `control` and other `group` elements. Zero or more `group` elements may be used.
- `control` (optional) - Defines a given control in the catalog. Zero or more `control` elements may be used, and a `control` can be nested within another `control`.
- `back-matter` (optional) – Contains references used within the catalog.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "id": "uuid-ed364452-47f8-4e70-b3a4-ef54de5f46ef",
    "metadata": {},
    "groups": {},
    "controls": {},
    "back-matter": {}
  }
}
{{< /highlight >}}

The `id` property (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `catalog` contains:

- `metadata` (required) - Provides document metadata for the catalog.
- `groups` (optional) - Allows for grouping of `controls` and other `groups` properties. Contains one or more group objects.
- `controls` (optional) - Contains one or more control objects, which can nest other control objects.
- `back-matter` (optional) – Contains references used within the catalog.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
catalog:
  id: uuid-956c32af-8a15-4732-a4d9-f976a1149c4b
  metadata:
  groups:
  controls:
  back-matter:
{{< /highlight >}}

The `id` property (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `catalog` contains:

- `metadata` (required) - Provides document metadata for the catalog.
- `groups` (optional) - Allows for grouping of `controls` and other `groups` properties. Contains one or more group objects.
- `controls` (optional) - Contains one or more control objects, which can nest other control objects.
- `back-matter` (optional) – Contains references used within the catalog.
{{% /tab %}}
{{< /tabs >}}

Let's discuss each of these elements in the following sections and identify which ones can be used to represent our catalog.

## Defining the Catalog's Metadata

The `metadata` has identical structure for all OSCAL files. 

This tutorial focuses only on the mandatory elements for `metadata`.  A separate tutorial will focus on the full `metadata` syntax.

The `metadata` must include:

- the title of the catalog
- the time the catalog was last modified
- the version of OSCAL used

The following additional data items from the [sample security catalog][catalog-prose-sample] also need to be defined in the OSCAL catalog.

```text
Version: 1.0
Published: 02.02.2020
Last Modified: 02.10.2020
```

All of these data items can be represented as follows:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<metadata>
  <title>Sample Security Catalog</title>
  <published>2020-02-02T11:01:04.736-04:00</published>
  <last-modified>2020-10-02T11:01:04.736-04:00</last-modified>
  <version>1.0</version>
  <oscal-version>1.0.0-milestone3</oscal-version>
</metadata>
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 1: The `<metadata>` [element](/documentation/schema/catalog/xml-schema/#oscal-catalog-xml_metadata), which contains the document's metadata.
- Line 2: The document's title `Sample Security Catalog` is provided using `<title>` element. The document's title is a mandatory field for an OSCAL Catalog.
- Line 3: The date when the document was published `2020-02-02T11:01:04.736-04:00` is provided using `<published>` element. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The published date is not a mandatory field for an OSCAL Catalog.
- Line 4: The date when the document was last modified `2020-10-02T11:01:04.736-04:00` is provided using `<last-modified>` element. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The last modified date is a mandatory field for an OSCAL Catalog.
- Line 5: The version of the document `1.0` is provided using the `<version>` element. This can be a numeric version, commit hash, or any other suitable version identifier. The document version is a mandatory field for an OSCAL Catalog.
- Line 6: Finally, the OSCAL version is provided using the `<oscal-version>` element, which represents the revision of the OSCAL Catalog model for which the catalog was created under. The current OSCAL version is `1.0.0-milestone3`.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "metadata": {
    "title": "Sample Security Catalog",
    "published": "2020-02-02T11:01:04.736-04:00",
    "last-modified": "2020-10-02T11:01:04.736-04:00",
    "version": "1.0",
    "oscal-version": "1.0.0-milestone3"
  }
}
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 2: The `metadata` [property](/documentation/schema/catalog/json-schema/#oscal-catalog-json_metadata), who's value is a metadata object which contains the document's metadata.
- Line 3: The document's title `Sample Security Catalog` is provided using `title` property. The document's title is a mandatory field for an OSCAL Catalog.
- Line 4: The date when the document was published `2020-02-02T11:01:04.736-04:00` is provided using the `published` property. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The published date is not a mandatory field for an OSCAL Catalog.
- Line 5: The date when the document was last modified `2020-10-02T11:01:04.736-04:00` is provided using the `last-modified` property. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The last modified date is a mandatory field for an OSCAL Catalog.
- Line 6: The version of the document `1.0` is provided using the `version` property. This can be a numeric version, commit hash, or any other suitable version identifier. The document version is a mandatory field for an OSCAL Catalog.
- Line 7: Finally, the OSCAL version is provided using the `oscal-version` property, which represents the revision of the OSCAL Catalog model for which the catalog was created under. The current OSCAL version is `1.0.0-milestone3`.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
metadata:
  title: Sample Security Catalog
  published: '2020-02-02T11:01:04.736-04:00'
  last-modified: '2020-02-10T11:01:04.736-04:00'
  version: '1.0'
  oscal-version: 1.0.0
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 1: The `metadata` [block](/documentation/schema/catalog/json-schema/#oscal-catalog-json_metadata), who's value is a metadata object which contains the document's metadata.
- Line 2: The document's title `Sample Security Catalog` is provided using `title` key. The document's title is a mandatory field for an OSCAL Catalog.
- Line 3: The date when the document was published `2020-02-02T11:01:04.736-04:00` is provided using the `published` key. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The published date is not a mandatory field for an OSCAL Catalog.
- Line 4: The date when the document was last modified `2020-10-02T11:01:04.736-04:00` is provided using the `last-modified` key. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The last modified date is a mandatory field for an OSCAL Catalog.
- Line 5: The version of the document `1.0` is provided using the `version` key. This can be a numeric version, commit hash, or any other suitable version identifier. The document version is a mandatory field for an OSCAL Catalog.
- Line 6: Finally, the OSCAL version is provided using the `oscal-version` key, which represents the revision of the OSCAL Catalog model for which the catalog was created under. The current OSCAL version is `1.0.0-milestone3`.
{{% /tab %}}
{{< /tabs >}}

## Using Groups in a Catalog

An OSCAL catalog allows for the organization of related controls using groups. A catalog group can represent families of controls or other organizational structures, such as sections in a control catalog.

Analyzing the body of the [Catalog Sample][catalog-prose-sample], we observe that the catalog has multiple sections and sub-sections as follows:

```text
1 Organization of Information Security
  1.1 Internal Organization
      Objective: [...]
      1.1.1 Information security roles and responsibilities
            [...]      
      1.1.2 Segregation of duties
            [...]
2 Access Control
  2.1 Business Requirements of Access Control
      Objective: [...]
      2.1.1 Access control policy
            [...]
      2.1.2 Access to networks and network services
            [...]     
```

In the above, controls are organized into two top-level groups: 1 *Organization of Information Security* and 2 *Access Control*. Each of these top-level groups have sub-sections that define an *Objective*, and these sub-sections then define a series of controls.

The first top-level section can be represented in an OSCAL Catalog as follows:

{{< tabs XML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<group class="section" id="s1">
  <title>Organization of Information Security</title>
  <prop name="label">1</prop>
  <group id="s1.1">
    <title>Internal Organization</title>
    <prop name="label">1.1</prop>
    <part id="s1.1_smt" name="objective">
      <p>To establish a management framework to initiate and control the implementation and
        operation of information security within the organization.</p>
    </part>
    <!-- controls go here -->
  </group>
</group>
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 1 declares a new group using the `<group>` element. The `@id` attribute defines the group's required unique identifier `s1`. A group's unique identifier must be unique within the document. An identifier in OSCAL is a string that may not contain spaces or colons.
- Line 2 provides the group's title using the `<title>` element. A title can be simple text or can include [html markup](http://localhost:1313/OSCAL/documentation/schema/datatypes/#markup-line).
- Line 3 defines a property of the group using the `<prop>` element. This property element has a `@name="label`, which defines the name of the property (i.e. `label`), and textual content `1`, which defines the property's value. A property with the name `label` provides the text label that can be prepended to the title when formatting the content for human readability.  

    Properties are a commonly used constructs within OSCAL content that allow for arbitrary name/value data to be defined. This name/value data helps to describe the containing element. Most major elements within OSCAL allow for properties to be defined. Names, like identifiers, are strings that may not contain spaces or colons.

- Lines 4 thru 6 declare a new child group of the group defined on line 1, and is nested/indented within the context of the parent group to indicate it is a child. This child group represents the sub-section `1.1 Internal Organization`, along with its title (line 5) and label (line 6). Notice that the title and label are declared in the same way as the parent section, using `<title>` and `<prop>` elements.
- Lines 7 thru 10 define the sub-section's objective using a `<part>` element and child content. A part requires:
  - a unique identifier specified by the `@id` attribute, which identifies the part. 
  - a name specified by the `@name` attribute, which identifies the type of the part. The name `objective` is used to indicate that the part represents an objective.
  - A sequence of child HTML [prose block elements](/documentation/schema/datatypes/#markup-multiline). In this example, the `<p>` element is used to represent a paragraph of text. The prose model allows for other [structural markup](/documentation/schema/datatypes/#markup-line) to be included within each block, to indicate emphasis (italics), importance (bold), etc.

  While not shown here, a `<part>` element can also include child parts.
{{% /tab %}}
{{< /tabs >}}

The Sections of the original document have numbers, and therefore, we base the identifier values for each group on the heading numbers of the sections and the subsections, with a leading character such as *s* in front as a way to avoid any potential id conflicts.

Section 2 follows suit, resulting in the following representation of both sections:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<group class="section" id="s1">
  <title>Organization of Information Security</title>
  <prop name="label">1</prop>
  <group id="s1.1">
    <title>Internal Organization</title>
    <prop name="label">1.1</prop>
    <part id="s1.1_smt" name="objective">
      <p>To establish a management framework to initiate and control the implementation and
        operation of information security within the organization.</p>
    </part>
    <!-- controls go here -->
  </group>
</group>
<group id="s2">
  <title>Access control</title>
  <prop name="label">2</prop>
  <group id="s2.1">
    <title>Business requirements of access control</title>
    <prop name="label">2.1</prop>
    <part id="s2.1_smt" name="objective">
      <p>To limit access to information and information processing facilities.</p>
    </part>
    <!-- controls go here -->
  </group>
</group>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "groups" : [ {
    "id" : "s1",
    "class" : "section",
    "title" : "Organization of Information Security",
    "properties" : {
      "label" : "1"
    },
    "groups" : {
      "id" : "s1.1",
      "title" : "Internal Organization",
      "properties" : {
        "label" : "1.1"
      },
      "parts" : {
        "id" : "s1.1_smt",
        "name" : "objective",
        "prose" : "To establish a management framework to initiate and control the implementation and\noperation of information security within the organization."
      },
      "controls" : [
      ]
    }
  }, {
    "id" : "s2",
    "class" : "section",
    "title" : "Access control",
    "properties" : {
      "label" : "2"
    },
    "groups" : {
      "id" : "s2.1",
      "title" : "Business requirements of access control",
      "properties" : {
        "label" : "2.1"
      },
      "parts" : {
        "id" : "s2.1_smt",
        "name" : "objective",
        "prose" : "To limit access to information and information processing facilities."
      },
      "controls" : [
      ]
    }
  } ]
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
  groups:
    - id: s1
      class: section
      title: Organization of Information Security
      properties:
        label: '1'
      groups:
        id: s1.1
        title: Internal Organization
        properties:
          label: '1.1'
        parts:
          id: s1.1_smt
          name: objective
          prose: >-
            To establish a management framework to initiate and control the implementation and operation of information security within the organization.
        controls:
    - id: s2
      class: section
      title: Access control
      properties:
        label: '2'
      groups:
        id: s2.1
        title: Business requirements of access control
        properties:
          label: '2.1'
        parts:
          id: s2.1_smt
          name: objective
          prose: >-
            To limit access to information and information processing facilities.
        controls:
{{< /highlight >}}
{{% /tab %}}
{{< /tabs >}}

## Representing Control Information

Controls are defined in the [catalog sample][catalog-prose-sample] following the **Objective** in each section. Each control in the sample provides a **control statement** expressing the control's requirement, **Implementation Guidance**, and often
some additional information titled **Other information**. 

The structure of the first control, `1.1.1 Information security roles` is represented below:

>  **1.1.1 Information security roles and responsibilities**

>  **Control**

>  All information security responsibilities should be defined and allocated.  

>  **Implementation Guidance**

>  Allocation of information security responsibilities should ...

>  **Other information**

>  Many organizations appoint an information security manager ...

Note: The text of the above example has been elided to condense the example.

To represent a *Control* and its content, the OSCAL element `control` identified by the tag `<control></control>` is used. 
The element `control` must have a `<title></title>`, and it may have none or many of the following elements:
 
```   
    * `parameter` identified by the tags <param></param>,
    * `property` identified by the tags <prop></prop>,
    * `annotation` identified by the tags <annotation></annotation>,
    * `link` identified by the tags <link</link>, and
    * `part` identified by the tags <part></part>.
```

Using the OSCAL elements in the same manner as for the `group`, the first *Control* in the *Sample Security Catalog* can be 
represented as below:

```
      <control class="ssc-iso-sc27" id="s1.1.1">
        <title>Information security roles and responsibilities</title>
        <prop name="label">1.1.1</prop>
        <prop name="sort-id">c01</prop>
        <part id="s1.1.1_stm" name="statement">
          <prop name="label">Control</prop>
            <p>All information security [...].</p>
        </part>
        <part id="s1.1.1_gdn" name="guidance">
          <prop name="label">Implementation guidance</prop>
          <part id="s1.1.1_gdn.1" name="guidance">
            <p>Allocation of information security [...]</p>
          </part>
          [...]
        </part>
        <part id="s1.1.1_inf" name="information">
          <prop name="lable">Other information</prop>
          <p>Many organizations appoint an [...]</p>
        </part>
      </control>
```

A similar approach of expressing the data is used to reformat the rest of all the `Controls` (1.1.2, 2.1.1 and 2.2.1)

#### Formatting a Back-matter

Often documents have references, links to other documents, diagrams/images, citations, remarks. 
OSCAL defines elements that can be used to represent such information.

Back-matters are optional elements and therefore often the OSCAL Catalogs will not contain any.

A back-matter element is identified by the tag `<back-matter></back-matter>`. 
This element may have `resources` which are identified with the tag `<resources></resources>`.     

Each `resource` may have:

```
    * `title` identified by the tags <title></title>
    * `description` identified by the tags <desc></desc>
    * `property` identified by the tags <prop></prop>
    * `document id` identified by the tags <doc-id></doc-id>
    * `citation` identified by the tags <citation></citation>
    * `link` identified by the tags <rlink></rlink>
    * `base64-binary-data` identified by the tags <base64></base64>
    * `remarks` identified by the tags <remarks></remarks>
```
Our catalog does not contain any back-matter, but additional information about the available 
elements and their fields, can be found [here](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-model-map/)

### The Final Catalog

Assembling all the elements described above, we obtain the arching structure of the *Sample Security Catalog*: 

```
<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
         id="uuid-ed364452-47f8-4e70-b3a4-ef54de5f46ef">
  <metadata>
      <title>Sample Security Catalog</title>
      <published>2020-02-02T11:01:04.736-04:00</published>
      <last-modified>2020-10-02T11:01:04.736-04:00</last-modified>
      <version>1.0</version>
      <oscal-version>1.0.0</oscal-version>
      <prop name="keywords">Assurance, computer security, FISM, security controls, security requirements</prop>
      <role id="creator">
         <title>Document creator</title>
      </role>
      <role id="contact">
         <title>Contact</title>
      </role>
      <party id="NIST">
         <org>
            <org-name>National Institute ofStandards and Technology</org-name>
            <email>oscal@nist.gov</email>
            <url>https://www.nist.gov/oscal</url>
         </org>
      </party>
      <responsible-party role-id="creator">
         <party-id>NIST</party-id>
      </responsible-party>
      <responsible-party role-id="contact">
         <party-id>NIST</party-id>
      </responsible-party>
   </metadata>
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      <part id="s1.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To establish a management framework to initiate and control the implementation and operation of information security within the organization.</p>
      </part>
      <control class="ssc-iso-sc27" id="s1.1.1">
        <title>Information security roles and responsibilities</title>
        <prop name="label">1.1.1</prop>
        <prop name="sort-id">c01</prop>
        <part id="s1.1.1_stm" name="statement">
          <prop name="lable">Control</prop>
            <p>All information security responsibilities should be defined and
            allocated.</p>
        </part>
        <part id="s1.1.1_gdn" name="guidance">
          <prop name="lable">Implementation guidance</prop>
          <part id="s1.1.1_gdn.1" name="guidance">
            <p>Allocation of information security [...]</p>
          </part>
          <part id="s1.1.1_gdn.2" name="guidance">
            <p>Individuals with allocated information [...].</p>
          </part>
          <part id="s1.1.1_gdn.2" name="guidance">
            <p>Areas for which individuals are [...]</p>
              [...]
          </part> 
        </part>
        <part id="s1.1.1_inf" name="information">
          <prop name="lable">Other information</prop>
          <p>Many organizations [...].</p>
          
        </part>
      </control>
      <control class="ssc-iso-sc27" id="s1.1.2">
        <title>Segregation of duties</title>
        <prop name="label">1.1.2</prop>
        <prop name="sort-id">c02</prop>
        <part id="s1.1.2_stm" name="statement">
          <prop name="lable">Control</prop>
            <p>Conflicting duties [...]</p>
        </part>
        <part id="s1.1.2_gdn" name="guidance">
          <prop name="lable">Implementation guidance</prop>
          <part id="s1.1.2_gdn.1" name="guidance">
            <p>Care should be taken [...].</p>
          </part>
          <part id="s1.1.2_gdn.2" name="guidance">
            <p>Small organizations may [...].</p>
          </part>
        </part>
        <part id="s1.1.2_inf" name="information">
          <prop name="lable">Other information</prop>
          <p>Segregation of duties is [...].</p>
        </part>
      </control>
    </group>
  </group>
  <group class="section" id="s2">
    <title>Access control</title>
    <group class="ssc-iso-sc27" id="s2.1">
      <title>Business requirements of access control</title>
      <prop name="label">2.1</prop>
      <part id="s2.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To limit access to information and information processing facilities.</p>
      </part>
      <control class="ssc-iso-sc27" id="s2.1.1">
      <title>Access control policy</title>
        <prop name="label">2.1.1</prop>
        <prop name="sort-id">c03</prop>
        <part id="s2.1.1_stm" name="statement">
        <prop name="lable">Control</prop>
          <p>An access control policy should [...].</p>
        </part>
        <part id="s2.1.1_gdn" name="guidance">
          <prop name="lable">Implementation guidance</prop>
          <part id="s2.1.1_gdn.1" name="guidance">
            <p>Asset owners should determine [...].</p>
          </part>
          <part id="s2.1.1_gdn.2" name="guidance">
            <p>Access controls are both logical and physical [...].</p>
          </part>
          <part id="s2.1.1_gdn.3" name="guidance">
            <p>Users and service providers should [...].</p>
          </part>
          <part id="s2.1.1_gdn.4" name="guidance">
            <p>The policy should take account of the following:</p>
            [...]
          </part>
        </part>
        <part id="s2.1.1_stm" name="information">
          <prop name="lable">Other information</prop>
          <part id="s2.1.1_stm.1" name="information">
            <p>Care should be taken [...]</p>
            [...]
          </part>
          <part id="s2.1.1_stm.2" name="information">
            <p>Access control rules should [...].</p>
          </part>
          <part id="s2.1.1_stm.3" name="information">
            <p>Role based access control is [...].</p>
          </part>
          <part id="s2.1.1_stm.4" name="information">
            <p>Two of the frequent principles [...]:</p>
            [...]
          </part>
        </part>
      </control>
      <control class="ssc-iso-sc27" id="s2.1.2">
        <title>Access to networks and network services</title>
        <prop name="label">2.1.2</prop>
        <prop name="sort-id">c04</prop>
        <part id="s2.1.2_stm" name="statement">
          <prop name="lable">Control</prop>
          <p>Users should only be provided [...].</p>
        </part>
        <part id="s2.1.2_gdn" name="guidance">
          <prop name="label">Implementation guidance</prop>
          <part id="s2.1.2_gdn.1" name="guidance">
            <p>A policy should be [...]</p>
            [...]
          </part>
          <part id="s2.1.2_gdn.2" name="guidance">
            <p>The policy on the use of network [...]</p>
          </part>
        </part>      
      </control>
    </group>
  </group>
  <back-matter>
  </back-matter>
</catalog>
```

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
{{< /highlight >}}
{{% /tab %}}
{{< /tabs >}}

[catalog-docs]: /documentation/schema/catalog/
[catalog-definition]: /learnmore/concepts/catalog/
[catalog-prose-sample]: catalog-sample/
[oscal-markup-line]: /documentation/schema/datatypes/#markup-line
[oscal-markup-multiline]: /documentation/schema/datatypes/#markup-multiline
