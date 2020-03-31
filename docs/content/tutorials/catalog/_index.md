---
title: Creating a Basic OSCAL Catalog
description: A tutorial on creating a basic OSCAL catalog.
weight: 5
---

## What is an OSCAL Catalog?

A [catalog][catalog-definition] is a collection of *security and privacy controls*, and related *control enhancements*.

An OSCAL Control Catalog is a machine-readable representation of a catalog, expressed using the OSCAL [Catalog model][catalog-docs], which includes contextualizing documentation and metadata.

The OSCAL Catalog model provides machine-readable formats in XML, JSON, and YAML, which support representing an equivalent set of catalog information.

This tutorial describes the formatting of such a catalog using the OSCAL Catalog model XML format.

##	Use of an Example Catalog 

For the purpose of this tutorial, an [example prose catalog][catalog-prose-sample] has been created.

##	Control Catalog Model

An OSCAL catalog (in XML or JSON) uses the respective schemas that describe the XML tag sets or the JSON data objects.
However, this tutorial is not focusing on the schemas themselves but rather on the formatting in OSCAL of the proprietary control catalog listed above. 
For more information on each schemas, the reader is referred to [XML Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-schema/) 
and [JSON Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/catalog/json-schema/), respectively.

The root of the Control Catalog format is `catalog`. 

In the example below, the contents of the `catalog` are provided as empty data items. These are included to illustrate the content model of `catalog`, and we will be covering their syntax later in this tutorial.

{{< tabs XML JSON >}}
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

- `metadata` (required) - Provides docoment metadata for the catalog.
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

- `metadata` (required) - Provides docoment metadata for the catalog.
- `groups` (optional) - Allows for grouping of `controls` and other `groups` properties. Contains one or more group objects.
- `controls` (optional) - Contains one or more control objects, which can nest other control objects.
- `back-matter` (optional) – Contains references used within the catalog.
{{% /tab %}}
{{< /tabs >}}

Let's discuss each of these elements in the following sections and identify which ones can be used to represent our catalog.

#### Catalog's Metadata

The `metadata` has identical structure for all OSCAL files. 

This tutorial focuses only on the mandatory elements for `metadata`.  A separate tutorial will focus on the full `metadata` syntax.

The `metadata` must ainclude:

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

{{< tabs XML JSON >}}
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
{{% /tab %}}
{{< /tabs >}}

The document's title `Sample Security Catalog` is provided using `title`. The document's title is a mandatory field for an OSCAL Catalog.

The date when the document was published `2020-02-02T11:01:04.736-04:00` is provided using `published`. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The published date is not a mandatory field for an OSCAL Catalog.

The date when the document was last modified `2020-10-02T11:01:04.736-04:00` is provided using `last-modified`. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The last modified date is a mandatory field for an OSCAL Catalog.

The version of the document `1.0` is provided using `version`. This can be a numeric version, commit hash, or any other suitable version identifer. The document version is a mandatory field for an OSCAL Catalog.

Finally, the OSCAL version is provided using `oscal-version`, which represents the revision of the OSCAL Catalog model for which the catalog was created under. The current OSCAL version is `1.0.0-milestone3`.

#### Formatting the Body of the Control Catalog in OSCAL

Analyzing the body of the [Catalog Sample][catalog-prose-sample], we observe that the catalog has two sections:
1 and 2, each section contains subsections 1.1 and 2.1, which have an *Objective* and group together *Controls* that meet the same *Objective*. 

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

The above formatting of the document will be represented using nested `groups` for Section 1, with the nested Subsection 1.1, and for Section 2, with the nested Subsection 2.1.

A `group` tag `<group>` has an `id` and a `class`. 

Each `group` must contain a `title` identified by the tag `<title></title>` and may have none or many of the following elements:

```    
    * `parameters` identified by the tags <param></param>
    * `properties` identified by the tags <prop></prop>, and
    * `parts` identified by the tags <part></part>.
```

It is important to note here that the `id` of a `group` is expected to be a string. 

The Sections of the original document have numbers, and therefore, we define the `id` for each `group` to be 
the number of the Section and the Subsection respectively, with a leading character such as *s* in front.

We also represent the numerical value of the Section and of the Subsection as a `property` named *label*.

The structure of the Section 1 and the Subsection 1.1:

```
1 Organization of Information Security
  1.1 Internal Organization 
  [...]
```
 
could be represented as follows:

```
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <prop name="label">1</prop>    
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      [...]
    </group>
  </group>
```  
  
Let us put together the high-level information for both Sections' and their Subsections':
 
```
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <prop name="label">1</prop>    
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      [...]
    </group>
  </group> 
  <group class="section" id="s2">
    <title>Access control</title>
    <prop name="label">2</prop>    
    <group class="ssc-iso-sc27" id="s2.1">
      <title>Business requirements of access control</title>
      <prop name="label">2.1</prop>
      [...]
    </group>
  </group> 
```

To represent the information of each Subsection, we need to identify the appropriate OSCAL elements for the *Objective* and the `Controls`.
An *Objective* can be represented as a `part` named *item*. 
This `part` will also have an unique-to-the-document string `id` which can be used to reference the *Objective*.

An original *Objective* statement like the one below:

```
Objective: To establish a management framework [...] within the organization.
```
is represented as follows:

```
     <part id="s1.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To establish a management framework [...] within the organization.</p>
     </part>
```

Integrating the *Objective* into the above structure of the *Sample Security Catalog*, we get:

```
  <group class="section" id="s1">
    <title>Organization of Information Security</title>
    <prop name="label">1</prop>    
    <group class="ssc-iso-sc27" id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
        <part id="s1.1_smt" name="item">
        <prop name="label">Objective:</prop>
          <p>To establish a management framework [...] within the organization.</p>
        </part>      
        [...]
    </group>
  </group>   
```

Following the *Objective*, the *Sample Security Catalog* describes the related *Controls*, their *Implementation guidance* and often
some additional information titled *Other information*. 

The structure of the first control, *1.1.1 Information security roles* is represented below:

```
    1.1.1 Information security roles 
    Control 
        All information security [...].  
    Implementation guidance
        Allocation of information security [...]
    Other information
        Many organizations appoint an [...]
```

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

[catalog-docs]: /documentation/schema/catalog/
[catalog-definition]: /learnmore/concepts/catalog/
[catalog-prose-sample]: catalog-sample/
