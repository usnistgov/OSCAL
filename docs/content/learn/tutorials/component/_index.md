---
title: Creating a Component Definition
description: A tutorial on creating an OSCAL component definition.
weight: 6
suppresstopiclist: true
toc:
  enabled: true
aliases:
  - /tutorials/component/
---

This tutorial covers creating a basic OSCAL component definition. Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Read the OSCAL implementation layer [overview](/documentation/schema/implementation-layer/).
- Review the OSCAL [component definition model documentation](/documentation/schema/implementation-layer/component/).
- Be familiar with OSCAL properties and links.

## What is an OSCAL Component Definition?

A component definition describes how a given implementation of a component or sets of components (e.g., hardware, software, service, policy, process, or procedure) can support specific controls.  Providers, such as hardware and software manufacturers, organizational security professionals and system integrators, can create component definitions that can readily serve as a foundation for implementation details regarding how to satisfy controls.  Furthermore, these component definitions can be imported into the SSP OSCAL model, providing useful content for the development of consistent control implementations within an SSP.

In this example, we will walk through the process of creating a component definition model for a MongoDB NoSQL database solution.  We’ll assume this MongoDB solution is being considered for use as part of on-premise system. As component of a system that needs to meet the OMB A-130 Authorization to Operate requirements, the component definition demonstrates proper implementation of the NIST SP 800-53 controls deemed necessary for high/ moderate/low impact systems. While this example focuses on NIST controls, the same approach could be used for any cybersecurity frameworks and their respective controls.  We'll presume the NoSQL database component can partially or fully satisfy the following controls:

| NIST 800-53 rev5 Control | Description |
| -------- | -------- |
| AU-2 | Audit Events |
| AC-2 | Account Management     |
| AC-3 | Access Enforcement |
| AC-5 | Separation of Duties |
| AC-6 | Least Privilege |
| AC-7 | Unsuccessful Logon Attempts |
| IA-2 | Identification and Authentication (organizational Users) |
| SC-7 | Boundary Protection |
| SC-8 | Transmission Confidentiality and Integrity|
| SC-13 | Cryptographic Protection |
| SC-28 | Protection of Information at Rest |


In this tutorial, we’ll demonstrate how to use the `<implemented-requirement>` element’s `control-id` attribute for traceability between the component definition model, its components, the component’s control implementations and associated implemented requirements.

## Creating an OSCAL Component Definition Model

The examples below illustrate the top-level structure of the OSCAL Component Definition Model.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
    <metadata/>
    <import-component-definition/>
    <component/>
    <capability/>
    <back-matter/>
</component-definition>
{{< /highlight >}}

The root of the OSCAL component definition model is `<component-definition>`. Note that the schema location attribute is omitted for this example. The @id attribute (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.
A `<component-definition>` contains:

- `<metadata>` (required) - Provides document metadata for the component definition. This is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `<import-component-definition>` (optional) – Identifies component definition from other resources from which related information is referenced.  Use of `<import-component-definition>` is not covered in this tutorial.
- `<component>` (optional) - Defines a given component in the component definition. Zero or more `<component>` elements may be used.
- `<capability>` (optional) - Defines a given capability in the component definition. Zero or more `<capability>` elements may be used. Capabilities are not covered in this tutorial.
- `<back-matter>` (optional) – Contains references used within the component definition. Use of `<back-matter>` is not covered in this tutorial.

{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
    "component-definition": {
        "uuid": "a7ba800c-a432-44cd-9075-0862cd66da6b",
        "metadata": {},
        "import-component-definition": {},
        "component": {},
        "capability": {},
        "back-matter": {}
    }
}
{{< /highlight >}}

The root of the OSCAL component definition model is `component-definition`. The @id attribute (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.
A `component-definition` contains:

- `metadata` (required) - Provides document metadata for the component definition. This is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `import-component-definition` (optional) – Identifies component definition from other resources from which related information is referenced.  Use of `import-component-definition` is not covered in this tutorial.
- `component` (optional) - Defines a given component in the component definition. Zero or more `component` objects may be used.
- `capability` (optional) - Defines a given capability in the component definition. Zero or more `capability` objects may be used. Capabilities are not covered in this tutorial.
- `back-matter` (optional) – Contains references used within the component definition. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition: 
  uuid: "a7ba800c-a432-44cd-9075-0862cd66da6b"
  metadata: 
  import-component-definition: 
  component: 
  capability: 
  back-matter: 
{{< /highlight >}}

The root of the OSCAL component definition model is `component-definition`. The @id attribute (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.
A `component-definition` contains:

- `metadata` (required) - Provides document metadata for the component definition. This is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `import-component-definition` (optional) – Identifies component definition from other resources from which related information is referenced.  Use of `import-component-definition` is not covered in this tutorial.
- `component` (optional) - Defines a given component in the component definition. Zero or more `component` items may be used.
- `capability` (optional) - Defines a given capability in the component definition. Zero or more `capability` items may be used. Capabilities are not covered in this tutorial.
- `back-matter` (optional) – Contains references used within the component definition. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{< /tabs >}}

We will now discuss each of these data structures in the following sections and identify how they each can be used to represent our component definition.

## Defining the Component Definition’s Metadata

The metadata section of the component definition contains data about the component definition document. This section has an identical structure which is used consistently across all OSCAL models, therefore, this is not covered in this tutorial.  For details on how to construct metadata, please refer to the [Metadata Tutorial](/documentation/tutorials/metadata).

## Component

Within the component definition model, components provide a way to describe parts of an information system and the associated potential control implementations that could be established when the system is implemented.  Components are optional, but this tutorial will demonstrate their use.  In this example, the MongoDB provides NoSQL database services. The snippet below provides an example of the minimum data needed to define a component.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component uuid="91f646c5-b1b6-4786-9ec3-2305a044e217" type="software">
    <title>MongoDB</title>
    <description>
        <p>MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.</p>
    </description>
    <purpose>Backend NoSQL database</purpose>
    <responsible-role role-id="supplier">
        <party-uuid>ef7c799a-c50e-49ab-83e0-515e989e6df1</party-uuid>
    </responsible-role>
    <protocol name="Transmission Control" />
    <control-implementation />
</component>
{{< /highlight >}}

A component is represented using the `<component>` element as shown in line #.   This element requires a unique identifier, which is provided using the `@uuid` attribute.

The type attribute is very useful in classifying components.  Some common examples include interconnection, hardware, software, service, policy, process / procedure,  plan, guidance, and standard. In our example, we’ll set the MongoDB component to a “software" type.  
Next, the component needs to have title and description elements.   Should I cover props & links?  
The optional `<responsible-role>` element can be used to reference one or more roles with responsibility for performing a function relative to the component.  In this tutorial, will reference the supplier.  

## Protocol

Another optional but valuable sub-element of `<component>` is `<protocol>`.  In our example, the MongoDB database uses the following protocols:

| Port| Transport | Direction | Description |
| ----- | --------- | --------- | ----------- |
| 27017 | TCP | Inbound | The default port for mongod and mongos instances. |
| 27018 | TCP | Inbound | The default port when running with --shardsvr runtime operation. |
| 27009 | TCP | Inbound-Outbound | The default port when running with --configsvr runtime operation |

This is represented below.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<protocol name="Transmission Control">
    <title>MongoDB requires use of TCP.</title>
    <port-range start="27017" end="2701" transport="TCP" />
    <port-range start="27018" end="27018" transport="TCP" />
    <port-range start="27019" end="27019" transport="TCP" />
</protocol>
{{< /highlight >}}

The `<protocol />` element has a mandatory `@name` attribute.  In this example, we set it to "Transmission Control" because uses TCP.  A supplier may provide some descriptive text in the `<title />` element.  The `<port-range />` element is where we can specify the port number(s) and transport. If the port numbers are contiguous, a single `<port-range />` element with `start="27017" end="27019"` is sufficient, however, it is also acceptable to have multiple port-range elements as shown in the example xml snipped above.

## Control-Implementations

The control implementations help define how the component can satisfy controls.  

- Todo: Basic elements (props, links)

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<control-implementation 
    uuid="49f0b690-ed9f-4f32-aae0-625b77aa6d27" 
    source="../../../content/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_catalog.xml">
    <description>
        <p>MongoDB is a NoSQL backend database software.</p>
    </description>
    <implemented-requirement 
        uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0" 
        control-id="au-2">
        <description>
            <p>MongoDB Enterprise includes a system auditing facility that can record system events (e.g. user operations, connection events) on a MongoDB instance.</p>
        </description>
    </implemented-requirement>
{{< /highlight >}}

## The Final Component Definition

Combining all the content described in this tutorial, we can produce this final component definition model.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<component-definition 
	xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
	uuid="a7ba800c-a432-44cd-9075-0862cd66da6b" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://csrc.nist.gov/ns/oscal/1.0 https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_component_schema.xsd">
	<metadata>
		<title>MongoDB Component Definition Example</title>
		<last-modified>2001-12-17T09:30:47Z</last-modified>
		<version>20210507</version>
		<oscal-version>1.0.0-rc2</oscal-version>
	</metadata>
	<component uuid="91f646c5-b1b6-4786-9ec3-2305a044e217" type="software">
		<title>MongoDB</title>
		<description>
			<p>MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.</p>
		</description>
		<purpose>Backend NoSQL database</purpose>
		<responsible-role role-id="supplier">
			<party-uuid>ef7c799a-c50e-49ab-83e0-515e989e6df1</party-uuid>
		</responsible-role>
		<protocol name="Transmission Control">
			<title>MongoDB requires use of TCP.</title>
			<port-range start="27017" end="2701" transport="TCP" />
			<port-range start="27018" end="27018" transport="TCP" />
			<port-range start="27019" end="27019" transport="TCP" />
		</protocol>
		<control-implementation 
			uuid="49f0b690-ed9f-4f32-aae0-625b77aa6d27" 
			source="../../../content/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_catalog.xml">
			<description>
				<p>MongoDB is a NoSQL backend database software.</p>
			</description>
			<implemented-requirement 
				uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0" 
				control-id="au-2">
				<description>
					<p>MongoDB Enterprise includes a system auditing facility that can record system events (e.g. user operations, connection events) on a MongoDB instance.</p>
				</description>
			</implemented-requirement>
		</control-implementation>
	</component>
</component-definition>
{{< /highlight >}}

## Summary

This concludes the tutorial.  You should now be familiar with:

- The basic structure of a component definition in OSCAL.
- How to provide the basic metadata required in an OSCAL component definition.
- How to use of a component within an OSCAL component definition.
- How to use the protocol elements in a component.
- How to specify the control implementation in a component.

For more information, you can review the OSCAL component definition model documentation.
