---
title: Creating Extensions with Props and Links
description: A tutorial on creating OSCAL extensions using props and links.
weight: 5
suppresstopiclist: true
toc:
  enabled: true
---

This tutorial describes the mechanisms for creating basic OSCAL extensions. Before reading this tutorial, you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Review the [OSCAL Layers and Models](/concepts/layer/) documentation.
- Review the latest [OSCAL Reference](/reference/latest/complete/).

## What are the OSCAL Extension Mechanisms?

OSCAL is designed with the goal of simultaneously supporting multiple cybersecurity frameworks. The core OSCAL syntax achieves this goal by focusing on properties that are universal or have applicability across various frameworks.

In creating OSCAL, NIST anticipated the possibility of divergent or unique requirements when organizations implement their security compliance programs. It was important to establish extension mechanisms from the onset, to allow organizations (and other stakeholders) to tailor OSCAL for their specific needs.

Thus, OSCAL is designed with extensibility as one of its key principles, allowing the OSCAL models to be extended wherever there are prop or link properties in the core models. This tutorial describes both extension mechanisms, explaining when to utilize them and illustrating their proper use.

## Props

The `prop` property in OSCAL is used to extend core models when 1) there is a need to capture information that is not in the core OSCAL model or 2) there is a need to accommodate for property values that are not in core OSCAL.

To extend a core OSCAL model with additional information, one must specify the `name`, namespace `ns`, and `value` attributes of the `prop` property. The name can be locally defined or through a label / descriptor that is tied to a classification marking system. The `name` should be a [token](/reference/datatypes/#token) data type.

Organizations and other stakeholders have the ability to extend OSCAL with their own properties, which could lead to name collisions. OSCAL accounted for this with the `ns` namespace attribute of the `prop` property. Organizations need to establish unique namespaces when extending OSCAL models with their own properties. By including the `ns` namespace, OSCAL can qualify names separately, thus properties (created by different organizations) that have the same `name` can be supported. The `ns` should be a [universal resource identifier (URI)](/reference/datatypes/#uri) formatted according to RFC3986.

Finally, `prop` properties must have a `value` specified. The value should be used to express the information that is not within the core OSCAL model. This attribute expects a [string](/reference/datatypes/#string) datatype.

### Creating a New Prop

The example below demonstrates how a software vendor may extend their component definition(s) by using the `prop` property. The example focuses on component definitions, but the approach is the same for extending other OSCAL models.  In this example, ACME is a software vendor that provides relational database management system (RDBMS) software.  ACME offers a free, open source version of their RDMBS as well as a commercial (proprietary) version.  ACME's federal government customers have varying security policies regarding the use of free and open source software (FOSS), so they have requested that ACME clearly specify the component's software licensing model in their component definitions. While core OSCAL does not have a pre-defined property for indicating a component's software licensing model, ACME is able to achieve this by creating a new property and specifying the property `name`, `ns`, and `value` attributes as follows on line #19:

{{< tabs XML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<component-definition
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  uuid="a7ba800c-a432-44cd-9075-0862cd66da6b"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://csrc.nist.gov/ns/oscal/1.0 https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_component_schema.xsd">
  <metadata>
    <title>New OSCAL Property Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210707</version>
    <oscal-version>1.0.0</oscal-version>
  </metadata>
  <component uuid="..." type="software">
    <title>RDBMS</title>
    <description>
      <p>ACME RDBMS provides a flexible, scalable, enterprise grade relational database management system (RDBMS).</p>
    </description>
    <purpose>Backend database.</purpose>
    <prop name="software-licensing-model" ns="http://acme-uri.com/ns/oscal" value="open-source" />
    <responsible-role role-id="supplier">
      <party-uuid>...</party-uuid>
    </responsible-role>
  </component>
  <control-implementation>...</control-implementation>
</component-definition>
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

> NOTE: OSCAL has many pre-defined properties. ***OSCAL content authors should review existing properties prior to creating their own.***  To review existing properties and corresponding value constraints, see the [All Models Index Reference](/reference/latest/complete/xml-index/#/prop).  The [OSCAL Model Metaschema Files](https://github.com/usnistgov/OSCAL/tree/main/src/metaschema) define all the existing properties and their corresponding constraints.

The optional `class` attributes should be used in cases where a property needs the same `name` and `ns` namespace.  The `class` attribute can be used in those circumstances to enable the &quot;overloading&quot; of the `prop`.   For example, while an OSCAL component model has an "ip-address" `prop` property, the `class` attribute helps support scenarios where a component may have multiple IP addresses as illustrated below on lines #14-15.

{{< tabs XML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<component-definition ...>
  <metadata>
    <title>OSCAL Property with Class Attribute Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210707</version>
    <oscal-version>1.0.0</oscal-version>
  </metadata>
  <component uuid="..." type="software">
    <title>RDBMS</title>
    <description>
      <p>ACME RDBMS provides a flexible, scalable, enterprise grade relational database management system (RDBMS).</p>
    </description>
    <purpose>Backend database.</purpose>
    <prop name="ip-address" class="local">10.0.0.1</prop>
    <prop name="ip-address" class="remote">192.168.0.1</prop>
    <responsible-role role-id="supplier">
      <party-uuid>...</party-uuid>
    </responsible-role>
  </component>
  <control-implementation>...</control-implementation>
</component-definition>
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

The `class` attribute requires a [token](/reference/datatypes/#token) datatype. The namespace `ns` attribute was omitted because "ip-address" is an OSCAL defined `prop` thus the implicit value namespace is `http://csrc.nist.gov/ns/oscal`.

### Extending Existing Prop Values

The other common scenario for extending OSCAL with `prop` is when adding values to an existing OSCAL property. Unlike the previous scenario, the `ns` namespace attribute does not need to be specified when extending `prop` values.  To view a complete listing of existing OSCAL `prop`, see the [All Models Index Reference](/reference/latest/complete/xml-index/#/prop).  The constraints for these `prop` properties are defined within the [OSCAL Metaschemas](https://github.com/usnistgov/OSCAL/tree/main/src/metaschema).  Where applicable, Metaschema defines the `allowed-values` for the `prop` properties.  The `prop` properties that are extensible are defined with an `allow-other=yes` attribute in Metaschema.  

The following example demonstrates how to extend a component's "asset-type" `prop`.  Currently, the default OSCAL defined values for this `prop` include: operating-system, database, web-server, dns-server, email-server, directory-server, pbx, firewall, router, switch, storage-array, and appliance.  However, because OSCAL defined the "asset-type" `prop` with an `allow-other=yes` attribute in Metaschema, new "asset-type" values can be specified as shown below on line #15.

{{< tabs XML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<component-definition ...>
  <metadata>
    <title>OSCAL Property Extended Value Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210707</version>
    <oscal-version>1.0.0</oscal-version>
  </metadata>
  <component uuid="..." type="hardware">
    <title>Mobile Device</title>
    <description>
      <p>Organizational Mobile Devices.</p>
    </description>
    <purpose>Communication and remote access.</purpose>
    <prop name="asset-type" value="mobile-device" />
    <responsible-role role-id="supplier">
      <party-uuid>...</party-uuid>
    </responsible-role>
  </component>
  <control-implementation>...</control-implementation>
</component-definition>
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

Props are prevalent throughout OSCAL appearing not only in `metadata` and `back-matter`, but in the majority of OSCAL properties.  Regardless of which OSCAL property is being extended, the approach is consistent, as described in this section of the tutorial.

## Links

Links in OSCAL provide a form of indirection, allowing the referencing of local or remote content. Organizations can limit duplication of content, reduce the size of their OSCAL files, and maintain important content relationships by using links.

The `link` property is made available in specific OSCAL models and supports either URL or back matter resources. The `link` property has the following attributes: `href`, `rel`, `media-type`, and `text`. The `href` attribute is a required, [resolvable URL reference](/reference/datatypes/#uri-reference) to a resource. This can either be an internet resource or a fragment that point to a back matter resource in the same document. The optional `rel` attribute is a [token](/reference/datatypes/#token) datatype that can be used to describe the link&#39;s purpose. The optional `media-type` attribute can be used to provide the consumer of the OSCAL content a hint about the type of data referenced in the link. Supported media types are as defined by the [Internet Assigned Numbers Authority (IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml). The `media-type` attribute accepts [string](/reference/datatypes/#string) values. Finally, the optional `text` sub-element can be used for as a textual label for the `link` and accepts [markup-line](/reference/datatypes/#markup-line) datatype. Below are examples illustrating the use of links.

### Link to internet URL

This first example illustrates how a component in a system security plan (SSP) might make use of a link to an internet URL. The component is an operating system and the SSP needs to provide clear documentation indicating whether its encryption modules are FIPS 140-2 validated.

{{< tabs XML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan ...>
  <metadata>
    <title>OSCAL SSP Component Link Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210707</version>
    <oscal-version>1.0.0</oscal-version>
  </metadata>
  <import-profile .../>
  <system-characteristics .../>
  <system-implementation>
    <component uuid="..." type="software">
      <title>Ubuntu 18.04</title>
      <description>
        <p>Ubuntu operating system.</p>
      </description>
      <purpose>Operating System.</purpose>
      <prop name="asset-type" value="operating-system" />
      <prop name="validation-reference" value="3980"/>
      <prop name="asset-type" value="operating-system" />
      <link rel="cmvp-fips-validation"
            href="https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/3980"/>
    </component>
  </system-implementation>
</system-security-plan>
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

In this case, the link is to the Cryptographic Module Validation Program (CMVP) which maintains records of FIPS validated cryptographic modules.  We used an absolute URI to point to the location of the referenced content, however, it should be noted that the `href` attribute also permits the use of relative URI paths. If the referenced resource is located is on the same machine or domain, then a relative URI path as shown below could be used.  The `rel` property describes the type of relationship provided by the specified `link`.  

The next section demonstrates how to reference back matter resources with links. Specifying a fragment in the href attribute indicates that the `link` is referencing a `back-matter` `resource` in the same OSCAL document.

### Referencing Back-Matter

When referencing `back-matter` `resources`, those resources may have a combination of `citations`, `rlinks`, and `base64` (embedded file resources). `Citations` describe bibliographic data with optional `links` whereas `rlinks` provide pointers to external resources with an optional hash for verification and change detection. Below are examples of `links` and `citations`.

{{< tabs XML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan ...>
  <metadata>...</metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <system-implementation>
    <prop .../>
      <component uuid="..." type="policy">
        <title>Information System (IT) Rules of Behavior Policy</title>
        <description>
          <p>Organizational IT Rules of Behavior policy.</p>
        </description>
        <link href="#rules-of-behavior-guid" rel="policy"/>
        <status state="operational"/>
      </component>
  </system-implementation>  
  <control-implementation>...</control-implementation>
  <back-matter>
    <resource uuid="#rules-of-behavior-guid">
      <rlink href="/ROB/Agency-IT-ROB.pdf">
    </resource>
  </back-matter>
</system-security-plan>
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

This example demonstrates how an system owner might reference an organization policy document, such as the IT Rules of Behavior, in  their SSP. To reference the organizational IT Rules of Behavior document, this SSP used the uuid (as specified in the `resource` element in the `back-matter`) as a fragment.  In the `back-matter`, the `rlink` element is used a relative path URI in its `href` attribute but could also accept an absolute path URI.

- [ ] _To-do: Provide an example of a citation._
- [ ] _To-do: Provide an example of a base64._

## Summary

This concludes the tutorial. You should now be familiar with:

- How to use props to extend OSCAL
- How to use namespaces to avoid collisions
- How to use classes to further differentiate prop extension names
- How to specify local and remote links for indirection
