---
title: Creating an OSCAL Profile
description: A tutorial on creating an OSCAL Profile.
weight: 10
---

This tutorial covers creating a basic OSCAL profile using three different methods.

Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/) formats.
- Read the OSCAL catalog layer [overview](/documentation/schema/catalog-layer/).

## What is an OSCAL Profile?

The term **profile** in OSCAL is also called a *baseline* in the NIST SP 800-53 catalog or in FedRAMP's documentation.  Additionally, the term *profile* in OSCAL covers the *overlay* concept defined in the NIST SP 800-53 revision 4.

A profile in OSCAL is a data file expressed using the OSCAL [profile model](/documentation/schema/profile-layer/profile/). An OSCAL profile provides a mechanism for selecting and customizing a specific set of security control requirements from one or more control catalogs expressed using the OSCAL [catalog model](/documentation/schema/catalog-layer/catalog). An OSCAL profile also provides mechanisms for further tailoring of controls, modification of the requirements, customization, interpretation and parameter values assignment.

This tutorial uses the [sample control catalog](/tutorials/catalog/catalog-sample/) we created during the [creating a basic OSCAL control catalog](/tutorials/catalog/) tutorial.

This tutorial illustrates how to create an OSCAL profile using the OSCAL XML, JSON, and YAML formats, which each implement the OSCAL [profile model](/documentation/schema/profile-layer/profile/). The OSCAL project provides an [XML Schema and documentation](/documentation/schema/profile-layer/profile/xml-schema/), which is useful for validating an XML catalog, and a [JSON Schema and documentation](/documentation/schema/profile-layer/profile/json-schema/), which is useful for validating JSON and YAML profiles. However, this tutorial is not focusing on the schemas themselves, but rather on the formatting the sample control catalog listed above in OSCAL.

## Creating an OSCAL Profile

The root of the OSCAL control catalog model is `profile`.

In the example below, the contents of the `profile` are provided as empty data items. These are included to illustrate the content model of `profile`, and we will be covering their syntax later in this tutorial.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    id="uuid-ed364452-47f8-4e70-b3a4-ef54de5f46ef">
    <metadata/>
    <import/>
    <merge/>
    <modify/>
    <back-matter/>
</catalog>
{{< /highlight >}}

The `@id` attribute (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `<profile>` contains:

- `metadata` (required) - Provides document metadata for the catalog.
- `import` (optional) - Allows for grouping of `control` and other `group` elements. Zero or more `group` elements may be used.
- `merge` (optional) - Defines
= `modify`
 a given control in the catalog. Zero or more `control` elements may be used, and a `control` can be nested within another `control`.
- `back-matter` (optional) – Contains references used within the catalog. Use of `<back-matter>` is not covered in this tutorial.
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

Let's discuss each of these elements in the following sections and identify they can be used to represent our catalog.

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

###	Profile Catalog Model

An `OSCAL Profile` (in XML or JSON) uses the respective schemas that describe the XML tag sets or the JSON data objects.
However, this tutorial is not focusing on the schemas themselves but rather on the formatting in OSCAL of the *profile* described above. 
For more information on each *profile* schemas, the reader is referred to [XML Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/profile/xml-schema/) 
and [JSON Schema Reference](https://pages.nist.gov/OSCAL/documentation/schema/profile/json-schema/), respectively.

The root of the Profile format is `profile`. 
The tag also captures the document's *universally unique identifier* (`uuid`), a unique 128-bit number made of hexadecimal digits displayed as 32 characters with four hyphens in between.

```xml
       <?xml version="1.0" encoding="UTF-8"?>
        <profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
        id="uuid-956c32af-8a15-4732-a4d9-f976a1149c4b">
```

A `profile` contains:

- `metadata`    – it is mandatory to have one metadata
- `imports`     – may have none, or as many as necessary
- `merge`       – may have none, or as many as necessary
- `modify`      - may have none, or as many as necessary
- `back-matter` – may have none, or as many as necessary 

Let's discuss each of these elements in the following sections and identify which ones can be used to represent our catalog.

#### Profile's Metadata

The `metadata` has identical structure for all OSCAL files. 

A separate tutorial focuses on the elements of the `metadata`. 
Current tutorial will only illustrate next the mandatory elements used to represent the information available in the [Sample Security Catalog](./Catalog%20Sample.md)

```
# Sample Security Profile

## Case 1: Sellect All Controls 

            Version 1.0
            Published: 03.24.2020
            Last Modified: 03.24.2020
```
The `metadata` must include the `title` of the *profile* using the `<title></title>` tag.

```xml
      <title>Sample Security Profile - Select All Controls</title>
```

To represent the date when the document was published we use the tag `<published></published>`. 
The date needs to include the time zone. The published date is not a mandatory field for the `OSCAL Profile`

```xml
      <published>2020-03-24T11:01:04.736-04:00</published>
```

The `OSCAL Profile Model` requires the file to contain in the `metadata` the date and time with the timezone of the last modification of the file. 
This information is represented using the tag `<last-modified></last-modified>`

```xml
       <last-modified>2020-03-24T11:01:04.736-04:00</last-modified>
```

Another mandatory field for the `metadata` is the `version` of the file which must be included using the tag `<version>/<version>`.

```xml
      <version>1.0</version>
```
Even though we finished representing the information available in the header of the file, the `metadata` has one other field that is mandatory - the OSCAL version. 
Current OSCAL version is 1.0.0 and the tag `<oscal-version></oscal-version>` is used to represent it.

```xml
      <oscal-version>1.0.0</oscal-version>
```
When necessary, revision history can be also documented. See additional information [here](https://pages.nist.gov/OSCAL/documentation/schema/profile/xml-model-map/)


The `metadata` is also designed to accommodate the representation of other information related to the content of the *profile* and the entity (individual or organization) that created it in OSCAL. 
For example, we can select and represent *keywords* using the property tag `<prop></prop>`, for which we define the `name` of the property as being *keywords*. 
The *keywords* will be a `string` comprised of a comma-separated list of significant words, in alphabetical order.

The information will look as follows:
```xml
       <prop name="keywords">Assurance, computer security, FISMA, Privacy Act, Risk Management Framework, security controls, security requirements</prop>
```

To do so, one can use the tags `<role></role>` and `<party></party>`, each instance with a distinct `id`, and the tag `<responsible-party></responsible-party>` with the field `role-id` that identifies the id of the pointed role and the tag `<party-id></party-id>` that points to the `id` of the defined <party>.
In this example the `<party>` is an organization (NIST) for which the name is provided using the tag `<org-name></org-name>`, an email address is listed using the tag `<email></email>` and the URL using the tag `<url>`. 
Below is all this information assembled in OSCAL.

```xml
      <role id="creator">
         <title>Document creator</title>
      </role>
      <role id="contact">
         <title>Contact</title>
      </role>
      <party id="NIST">
         <org>
            <org-name>National Institute of Standards and Technology</org-name>
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
```
We managed so far to complete the `metadata` of the [OSCAL Profile-SelectAll Sample](./Profile-SelectAll%20Sample.md). 

Putting together all the `metadata` information, we get:

```xml
   <metadata>
        <title>Sample Security Profile - Select All Controls</title>
        <published>2020-03-24T11:01:04.736-04:00</published>
        <last-modified>2020-03-24T11:01:04.736-04:00</last-modified>
        <version>1.0</version>
        <oscal-version>1.0.0</oscal-version>
        <prop name="keywords">Assurance, computer security, FISMA, security controls, security requirements</prop>
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
```

#### Formatting the Body of the OSCAL Profile

We discussed earlier that this [OSCAL Profile Sample](./Profile-SelectAll%20Sample.md) selects all the controls from the catalog.
The `OSCAL Profile` model defines the `<import></import>` element that designates the catalog, profile or resources from where the controls are selected.
The <import> element has the following content:
- `href`    - a required field that provides the URL of the referred resource
- `include` - used to specify the controls included, and can be used as many times as needed or not used at all
- `exclude` - used to specify de-select controls, and can be used as many times as needed or not used at all
Since an `include/all` (that is, all controls will be included by default) is assumed in the `OSCAL Profile` model when no `<include>` 
is given, we will use this default feature to generate our profile. 
Also, because our `Catalog` does not have nested `controls`, we will not need to explicitly `import/all` 
controls and explicitly set the `with-child-controls` flag.

The selection of all controls from the catalog can be simply represented as follows:

```xml
    <import href="../catalog/Catalog%20Sample.xml">
    </import>
```
In general, after selecting the controls, it is important to be able to merge them in resolution.
For this purpose, OSCAL has the `<merge></merge>` element that can be used to `combine` the controls and structure them the
 same way they are structured in the `Catalog`, by using the flag `as-is`, or provide a `custom` structure.   
 
 In our case, we will structure the controls the same way they were structured in the `Catalog`.
 
 ```xml
     <merge>
        <as-is>true</as-is>
    </merge>
``` 

As owners of the profile, we identified that the `Control` **1.1.1** with the `id=s1.1.1` requires modifications or tayloring.
To specify the changes we need to make to the control, we will use the `<modify>` element which allows us
to `<set-parameters>` and `<alter>` statements of the control. Our controls do not have parameters.

We will use the `<alter>` element and specify the `control-id` to indicate the control that is being modified.

```xml
        <alter control-id="s1.1.1">
            [...]
        </alter>
```

The element `<alter>` allows to:
- `remove`  - by using the tag `<remove></remove>` 
- `add`     - by using the tag `<add></add>`

In our case, we are not removing any statement form the control, but would like to add information at the end of the existing paragraph.
The first statement we want to add will be appended to the **Implementation guidance** of the `Control` with ID `control-id=s1.1.1` 

```xml
            <add position="ending" id-ref="s1.1.1_gdn">
                [...]
            </add>
```            

The second statement we want to add will be appended to the **Other information** section of the `Control` with ID `control-id=s1.1.1`

```xml
            <add position="ending" id-ref="s1.1.1_inf">
                [...]
            </add>            
```
Putting together the formationg discussed so far for altering or tailoring a control, we obtain:

```xml
        <alter control-id="s1.1.1">
            <add position="ending" id-ref="s1.1.1_gdn">
                [...]
            </add>
            <add position="ending" id-ref="s1.1.1_inf">
                [...]
            </add>            
        </alter>
```

The statement appended to the **Implementation guidance** reads: *The organizations should identify critical information system assets supporting essential missions and business functions.*
This statement will be introduced using the element `<part>` which has been previously introduced in the Catalog tutorial.

The element's description is available [here](https://pages.nist.gov/OSCAL/documentation/schema/profile/xml-schema/#part)

Through this element, we will provide the required `id` and `name` for the statement, 
a `<title>` for the modification and the added statement itself itself as a nested `<part>`, as follows:

```xml
                <part id="s1.1.1_smp_gnd" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_gnd.1" name="item" ns="sample">
                        <prop name="label">Implementation Guidance:</prop>
                        <p>The organizations should identify critical information system assets supporting essential missions and business functions.</p>    
                    </part>
                </part>
```

In a similar way is also represented the statement appended to the **Other Information** that
reads: *The appointed owners of the assets must report the results of assets' security verification to the information security manager.*

```xml
                <part id="s1.1.1_smp_inf" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_inf.1" name="item" ns="sample">
                        <prop name="label">Other Information:</prop>
                        <p>The appointed owners of the assets must report the results of assets' security verification
                            to the information security manager.</p>    
                    </part>
                </part>
``` 
Putting gother the 2 added statements, the tailoring of the `Control` **1.1.1** looks like:

```xml
       <alter control-id="s1.1.1">
            <add position="ending" id-ref="s1.1.1_gdn"> 
                <part id="s1.1.1_smp_gnd" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_gnd.1" name="item" ns="sample">
                        <prop name="label">Implementation Guidance:</prop>
                        <p>The organizations should identify critical information system assets supporting essential missions and business functions.</p>    
                    </part>
                </part>
            </add>
            <add position="ending" id-ref="s1.1.1_inf"> 
                <part id="s1.1.1_smp_inf" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_inf.1" name="item" ns="sample">
                        <prop name="label">Other Information:</prop>
                        <p>The appointed owners of the assets must report the results of assets' security verification
                            to the information security manager.</p>    
                    </part>
                </part>
            </add>
        </alter>
```        

#### Formatting a Back-matter

Often documents have references, links to other documents, diagrams/images, citations, remarks. 
OSCAL defines elements that can be used to represent such information.

Back-matters are optional elements and therefore often the OSCAL Catalogs will not contain any.

A back-matter element is identified by the tag <back-matter></back-matter>. 
This element may have `resources` which are identified with the tag <resources></resources>.     

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
Additional information about the available 
elements and their fields, can be found [here](https://pages.nist.gov/OSCAL/documentation/schema/catalog/xml-model-map/)

In our case, the `Profile` does not have specific information for the back-matter, but we can observe that the information
of the `Catalog` can be included in the back-matter as follows:

```xml
   <back-matter>
        <resource id="catalog">
            <desc>Catalog Sample (Derived from ISO/IEC 27002)</desc>
            <rlink href="../catalog/Catalog%20Sample.xml" media-type="application/oscal.catalog+xml"/>
        </resource>
    </back-matter>
```
With the `Catalog` defined here, the catalog id can be used as `uri` in the `<import></import>` elemet.

```xml
<import href="#catalog">
    </import>
```

### The Final Profile

Assembling all the elements described above, we obtain the arching structure of the *Profile SelectAll Sample*: 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
    id="uuid-956c32af-8a15-4732-a4d9-f976a1149c4b">
    <metadata>
        <title>Sample Security Profile - Select All Controls</title>
        <published>2020-03-24T11:01:04.736-04:00</published>
        <last-modified>2020-03-24T11:01:04.736-04:00</last-modified>
        <version>1.0</version>
        <oscal-version>1.0.0</oscal-version>
        <prop name="keywords">Assurance, computer security, FISMA, security controls, security requirements</prop>
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
    <import href="#catalog">
    </import>
    <merge>
        <as-is>true</as-is>
    </merge>
    <modify>
        <!-- - - - - ALTER CONTROL - - - - - -->
        <!-- - - ISO-SC27 1.1.1 - -  -->
        <alter control-id="s1.1.1">
            <add position="ending" id-ref="s1.1.1_gdn"> 
                <part id="s1.1.1_smp_gnd" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_gnd.1" name="item" ns="sample">
                        <prop name="label">Implementation Guidance:</prop>
                        <p>The organizations should identify critical information system assets supporting essential missions and business functions.</p>    
                    </part>
                </part>
            </add>
            <add position="ending" id-ref="s1.1.1_inf"> 
                <part id="s1.1.1_smp_inf" name="item" ns="sample">
                    <title>1.1.1 Additional Sample Profile Requirements and Guidance</title>
                    <part id="s1.1.1_smp_inf.1" name="item" ns="sample">
                        <prop name="label">Other Information:</prop>
                        <p>The appointed owners of the assets must report the results of assets' security verification
                            to the information security manager.</p>    
                    </part>
                </part>
            </add>
        </alter>
        <!-- - - ISO-SC27 1.1.2 - -  -->
        <!-- - - ISO-SC27 2.1.1 - -  -->
        <!-- - - ISO-SC27 2.1.2 - -  -->  
    </modify>
    <back-matter>
        <resource id="catalog">
            <desc>Catalog Sample (Derived from ISO/IEC 27002)</desc>
            <rlink href="../catalog/Catalog%20Sample.xml" media-type="application/oscal.catalog+xml"/>
        </resource>
    </back-matter>
</profile>
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
