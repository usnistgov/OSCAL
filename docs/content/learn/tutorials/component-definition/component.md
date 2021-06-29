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
- Read the OSCAL implementation layer [overview](/concepts/layer/implementation/).
- Review the OSCAL [component definition](/concepts/layer/implementation/component-definition/) model overview.
- Be familiar with the use of OSCAL properties and links.

## What is an OSCAL Component Definition?

An OSCAL component definition describes how a given implementation of a component or a set of components (e.g., hardware, software, service, policy, process, or procedure) can support specific controls.  Product and service vendors, capability owners, policy and process owners, and others can create component definitions that readily serve as inputs for a System Security Plan (SSP), helping describe how components might satisfy controls.  It is important to note that component definitions do not describe actual implementations; rather, component definitions describe possible implementations which can be instantiated within an information system. Thus, component definitions serve as references with content that can be used (e.g., in the SSP OSCAL model) to develop comprehensive and consistent control implementations within an SSP.

In this tutorial, we will walk through the process of creating an [OSCAL component definition model](/documentation/schema/implementation-layer/component/) for [MongoDB](https://docs.mongodb.com/).  Our goal is to provide standard control implementations for the benefit of system owners and SSP authors. As potential components in systems that may need to meet the OMB A-130 Authorization to Operate requirements, the component definition in this tutorial will demonstrate proper implementation of a couple [NIST SP 800-53 rev 5 controls](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev5/xml) deemed necessary for high, moderate, or low impact systems. While this example focuses on NIST controls, the same approach could be applied to any catalog of controls (e.g., ISO/IEC 27002).

For the purposes of this tutorial we'll presume the MongoDB component can partially or fully satisfy the following controls:

| NIST 800-53 rev5 Control | Description |
| -------- | -------- |
| SA-4(9) | Acquisition Process - Functions, Ports, Protocols, and Services in Use |
| SC-8(1) | Transmission Confidentiality and Integrity |

In this tutorial, we’ll demonstrate how to use the `<implemented-requirement>` element’s `@control-id` attribute for traceability between the component definition model, its components, the component’s control implementations and associated implemented requirements.

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

The root of the OSCAL component definition model is [`<component-definition>`](/reference/latest/component-definition/xml-reference/#/component-definition). Note that the schema location attribute is omitted for this example. The `@id` attribute (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.
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
        "import-component-definitions": [{}],
        "components: [{}],
        "capabilities": [{}],
        "back-matter": {}
    }
}
{{< /highlight >}}

The root of the OSCAL component definition model is [`component-definition`](/reference/latest/component-definition/json-reference/#/component-definition). The `id` property (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.
A `component-definition` contains the following props:

- `metadata` (required) - Provides document metadata for the component definition. This is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `import-component-definitions` (optional) – Allows for grouping of `import-component-definition` properties.  Each `import-component-definition` object identifies component definition from other resources from which related information is referenced.  Use of `import-component-definition` is not covered in this tutorial.
- `components` (optional) - Groups `component` objects which define given component(s) in the component definition. Zero or more `component` objects may be used.
- `capabilities` (optional) - Defines a group of given capabilities in the component definition. Zero or more `capability` objects may be used. Capabilities are not covered in this tutorial.
- `back-matter` (optional) – Contains references used within the component definition. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition:
  uuid: a7ba800c-a432-44cd-9075-0862cd66da6b
  metadata:
  import-component-definitions:
  components:
  capabilities:
  back-matter:

{{< /highlight >}}

The root of the OSCAL component definition model is `component-definition`. The `id` property (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.
A `component-definition` contains the following items:

- `metadata` (required) - Provides document metadata for the component definition. This is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `import-component-definitions` (optional) – Allows for grouping of `import-component-definition` items.  Each `import-component-definition` item identifies component definition from other resources from which related information is referenced.  Use of `import-component-definition` is not covered in this tutorial.
- `components` (optional) - Groups `component` items which define given component(s) in the component definition. Zero or more `component` items may be used.
- `capabilities` (optional) - Defines a group of given capabilities in the component definition. Zero or more `capability` items may be used. Capabilities are not covered in this tutorial.
- `back-matter` (optional) – Contains references used within the component definition. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{< /tabs >}}

For simplicity of this tutorial, we will only discuss certain data structures in the sections that follow and identify how they can be used to represent our component definition.

### Defining the Component Definition’s Metadata

Most OSCAL models have a standard metadata syntax, therefore, this is not covered extensively in this tutorial.  There are a few considerations however when authoring metadata for a component definition, such as the `<role>`, `<location>`, and `<party>` elements illustrated in lines 9-18 below.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  ...  
	<metadata>
		<title>MongoDB Component Definition Example</title>
		<last-modified>2001-12-17T09:30:47Z</last-modified>
		<version>20210507</version>
		<oscal-version>1.0.0-rc2</oscal-version>
		<role id="supplier">
			<title>Supplier</title>
		</role>
		<location uuid="0db91129-35ed-474f-a25e-c3ff1e2cb9dc">
			<address />
			<url>https://www.mongodb.com</url>
		</location>
		<party uuid="ef7c799a-c50e-49ab-83e0-515e989e6df1" type="prepared-for">
		    <name>MongoDB</name>
		</party>
	</metadata>
  ...
</component-definition>
{{< /highlight >}}

The [`<role>`](/reference/latest/component-definition/xml-reference/#/component-definition/metadata/role) element defines a function assumed or expected to be assumed by a party in a specific situation.  Common examples include [component definition authors](/concepts/layer/implementation/component-definition/#component-definition-authors) (e.g., Product and Service Vendors, Capability Owners, Policy and Process Owners, Standards Bodies and Validation Bodies) and [component definition consumers](/concepts/layer/implementation/component-definition/#component-definition-consumers) (e.g., System Owners and SSP Authors).  This element has a required `@id` attribute which expects an [NCName data type](/reference/datatypes/#ncname).  The `<location>` element can be used to associate the metadata with a location, including physical addresses and urls.  The `<location>` element has a `@uuid` attribute which requires a UUID.  Lastly, the `<party>` element represents either a person or organization that serves as the responsible entity.  There are prescribed types, including *"prepared-for"*, *"prepared-by"*, and *"approved-by"*.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    ......
    "uuid": "a7ba800c-a432-44cd-9075-0862cd66da6b",
    "metadata": {
      "title": "MongoDB Component Definition Example",
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210507,
      "oscal-version": "1.0.0-rc2",
      "roles": [{
        "id": "supplier",
        "title": "Supplier"
      }],
      "locations": [{
        "uuid": "0db91129-35ed-474f-a25e-c3ff1e2cb9dc",
        "address": "",
        "url": "https://www.mongodb.com"
      }],
      "parties": [{
        "uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1",
        "type": "prepared-for",
        "name": "MongoDB"
      }]
    }
    ......
  }
}
{{< /highlight >}}

The [`roles`](/reference/latest/component-definition/json-reference/#/component-definition/metadata/roles) property provides a grouping of `role` objects that each define a function assumed or expected to be assumed by a party in a specific situation.  Common examples include [component definition authors](/concepts/layer/implementation/component-definition/#component-definition-authors) (e.g., Product and Service Vendors, Capability Owners, Policy and Process Owners, Standards Bodies and Validation Bodies) and [component definition consumers](/concepts/layer/implementation/component-definition/#component-definition-consumers) (e.g., System Owners and SSP Authors).  This element has a required `id` property which expects an [NCName data type](/reference/datatypes/#ncname).  The `locations` grouping can be used to associate the metadata with any number of locations, including physical addresses and urls.  Each `location` object has an `uuid` property.  Lastly, the `parties` grouping property represents either persons or organizations that serves as the responsible entities.  There are prescribed types, including *"prepared-for"*, *"prepared-by"*, and *"approved-by"*.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition:
  ...
  uuid: a7ba800c-a432-44cd-9075-0862cd66da6b
  metadata:
    title: MongoDB Component Definition Example
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210507
    oscal-version: 1.0.0-rc2
    roles:
      - id: supplier
        title: Supplier
    locations:
      - uuid: 0db91129-35ed-474f-a25e-c3ff1e2cb9dc
        address: ''
        url: https://www.mongodb.com
    parties:
      - uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
        type: prepared-for
        name: MongoDB

{{< /highlight >}}

The `roles` item provides a grouping of `role` objects that each define a function assumed or expected to be assumed by a party in a specific situation.  Common examples include [component definition authors](/concepts/layer/implementation/component-definition/#component-definition-authors) (e.g., Product and Service Vendors, Capability Owners, Policy and Process Owners, Standards Bodies and Validation Bodies) and [component definition consumers](/concepts/layer/implementation/component-definition/#component-definition-consumers) (e.g., System Owners and SSP Authors).  This element has a required `id` property which expects an [NCName data type](/reference/datatypes/#ncname).  The `locations` grouping can be used to associate the metadata with any number of locations, including physical addresses and urls.  Each `location` object has an `uuid` property.  Lastly, the `parties` grouping item represents either persons or organizations that serves as the responsible entities.  There are prescribed types, including *"prepared-for"*, *"prepared-by"*, and *"approved-by"*.
{{% /tab %}}
{{% /tabs %}}

### Component

Within the component definition model, components provide a way to describe parts of an information system and the associated potential control implementations that could be established when the system is implemented.  Components are optional, but this tutorial will demonstrate their use.  In this example, we'll demonstrate how a MongoDB software component is described within an OSCAL component definition model. The snippet below provides an example of the minimum data needed to define a component.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  ...  
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
  ...
</component-definition>
{{< /highlight >}}

A component is represented using the [`<component>`](/reference/latest/component-definition/xml-reference/#/component-definition/component) element as shown in line 4.   This element requires a unique identifier, which is provided using the `@uuid` attribute.

The `@type` attribute is very useful in classifying components.  Some common examples include interconnection, hardware, software, service, policy, process / procedure,  plan, guidance, and standard. In our example, we’ll set the MongoDB component to a *“software"* type.  
Next, the component needs to have title and description elements.
The optional `<responsible-role>` element can be used to reference one or more roles with responsibility for performing a function relative to the component.  In this tutorial, will reference the supplier.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    ......
    "components": [{
      "uuid": "91f646c5-b1b6-4786-9ec3-2305a044e217",
      "type": "software",
      "title": "MongoDB",
      "description": "MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.",
      "purpose": "Backend NoSQL database",
      "responsible-roles": [{
        "role-id": "supplier",
        "party-uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1"
      }],
      "protocols": [{
        "name": "Transmission Control"
      }],
      "control-implementations": [{}]
    }]
    ......
  }
}
{{< /highlight >}}

A component is represented in the [`components`](/reference/latest/component-definition/json-reference/#/component-definition/components) object array shown in line 4.   Each component requires a unique identifier, which is provided using the `uuid` property.

The `type` property is very useful in classifying components.  Some common examples include interconnection, hardware, software, service, policy, process / procedure,  plan, guidance, and standard. In our example, we’ll set the MongoDB component to a *“software"* type.  
Next, the component needs to have title and description properties.
The optional `responsible-roles` object can be used to reference one or more roles with responsibility for performing a function relative to the component.  In this tutorial, will reference the supplier.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition:
  ...
  components:
    - uuid: 91f646c5-b1b6-4786-9ec3-2305a044e217
      type: software
      title: MongoDB
      description: >-
        MongoDB is a source-available cross-platform document-oriented database
        program. Classified as a NoSQL database program, MongoDB uses JSON-like
        documents with optional schemas.
      purpose: Backend NoSQL database
      responsible-roles:
        - role-id: supplier
          party-uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
      protocols:
        - name: Transmission Control
      control-implementations:
        - Implementation details...

{{< /highlight >}}

A component is represented in the `components` object array shown in line 4.   Each component requires a unique identifier, which is provided using the `uuid` property.

The `type` item is very useful in classifying components.  Some common examples include interconnection, hardware, software, service, policy, process / procedure,  plan, guidance, and standard. In our example, we’ll set the MongoDB component to a *“software"* type.  
Next, the component needs to have title and description.
The optional `responsible-roles` item can be used to reference one or more roles with responsibility for performing a function relative to the component.  In this tutorial, will reference the supplier.
{{% /tab %}}
{{% /tabs %}}

### Protocol

Another optional but valuable sub-element of `<component>` is [`<protocol>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/protocol).  Generally, `<protocol>` elements are only applicable when dealing with a `<component>` of type *"service"*.  In our example, we'll assume that installations of MongoDB will result in an installation of mongod (Mongo Daemon) which runs the MongoDB database as a process and uses the following protocols:

| Port| Transport | Direction | Description |
| ----- | --------- | --------- | ----------- |
| 27017 | TCP | Inbound | The default port for mongod and mongos instances. |
| 27018 | TCP | Inbound | The default port when running with --shardsvr runtime operation. |
| 27009 | TCP | Inbound-Outbound | The default port when running with --configsvr runtime operation |

This is represented below.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  ...  
  <component uuid="3e5c92b8-870c-4313-871a-f4307bf2eaf0" type="service">
      ...
      <protocol name="Transmission Control">
        <title>MongoDB requires use of TCP.</title>
        <port-range start="27017" end="27017" transport="TCP" />
        <port-range start="27018" end="27018" transport="TCP" />
        <port-range start="27019" end="27019" transport="TCP" />
      </protocol>
      <control-implementation />
  </component>
  ...
</component-definition>
{{< /highlight >}}

The [`<protocol>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/protocol) element has a mandatory `@name` attribute.  In this example, we set it to "Transmission Control" because MongoDB uses TCP.  A supplier may provide some descriptive text in the `<title>` element.  The `<port-range>` element is where we can specify the port number(s) and transport. If the port numbers are contiguous, a single `<port-range>` element with `start="27017" end="27019"` is sufficient, however, it is also acceptable to have multiple port-range elements as shown in the example xml snipped above.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    .....
    "components": [{
      "uuid": "3e5c92b8-870c-4313-871a-f4307bf2eaf0",
      "type": "service",
      "title": "",
      "protocols": [{
      "uuid": "",
        "name": "Transmission Control",
        "title": "MongoDB requires use of TCP.",
        "port-ranges": [{
          "start": "27017",
          "end": "201707",
          "transport": "TCP"
        },
        {
          "start": "27018",
          "end": "27018",
          "transport": "TCP"
        },
        {
          "start": "27019",
          "end": "27019",
          "transport": "TCP"
        }]
      }],
      "control-implementation": ""
    }]
    .....
  }
}
{{< /highlight >}}

The [`protocols`](/reference/latest/component-definition/json-reference/#/component-definition/component/protocol) grouping has objects with mandatory `name` properties.  In this example, we set it to "Transmission Control" because MongoDB uses TCP.  A supplier may provide some descriptive text in the `title` property.  The `port-ranges` object array is where we can specify the port number(s) and transport. If the port numbers are contiguous, a single `port-range` object with `"start":"27017"` and `"end":"27019"` is sufficient.  However, it is also acceptable to have multiple port-range objects as shown in the example JSON snipped above.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition:
  ...
  components:
    - uuid: 3e5c92b8-870c-4313-871a-f4307bf2eaf0
      type: service
      title: ''
      protocols:
        - uuid: ''
          name: Transmission Control
          title: MongoDB requires use of TCP.
          port-ranges:
            - start: '27017'
              end: '201707'
              transport: TCP
            - start: '27018'
              end: '27018'
              transport: TCP
            - start: '27019'
              end: '27019'
              transport: TCP
      control-implementation: ''

{{< /highlight >}}

The `protocols` grouping has items with mandatory `name` properties.  In this example, we set it to "Transmission Control" because MongoDB uses TCP.  A supplier may provide some descriptive text in the `title` item.  The `port-ranges` item array is where we can specify the port number(s) and transport. If the port numbers are contiguous, a single `port-range` item with `"start":"27017"` and `"end":"27019"` is sufficient.  However, it is also acceptable to have multiple port-range items as shown in the example YAML snipped above.
{{% /tab %}}
{{% /tabs %}}

### Control-Implementations

The control implementations help define how the component can satisfy controls.  In this example, we document how MongoDB component may satisfy SC-8(1) which requires implementation of cryptographic mechanisms to prevent unauthorized disclosure of information and/or detect changes to information during transmission. To document this, we use the [`<control-implementation>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/control-implementation) element.  This element requires a unique identifier, which is provided using the `@uuid` attribute.  This element also has a `@source` attribute that is used to provide a URI reference to the appropriate OSCAL profile.  The URI reference can be either a URI or a relative reference.  The `<implemented-requirement>` element on line 12 is where we can specify the control (e.g., SC-8(1)) and the implementation description.  The `<implemented-requirement>` element also has its own unique identifier `@uuid`, and the control is specified in the `@control-id` attribute on line 14.  We then use the `<description>` element to describe how this component satisfies the specified control.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  ...  
  <component uuid="91f646c5-b1b6-4786-9ec3-2305a044e217" type="software">
      ...
      <control-implementation
        uuid="49f0b690-ed9f-4f32-aae0-625b77aa6d27"
        source="../../../content/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_MODERATE-baseline_profile.xml">
        <description>
          <p>MongoDB control implementations for NIST SP 800-53rev5.</p>
        </description>
        <implemented-requirement
          uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0"
          control-id="sc-8.1">
          <description>
              <p>MongoDB supports TLS 1.x to encrypt data in transit, preventing unauthorized disclosure or changes to information during transmission. To implement TLS, set the PEMKeyFile option in the configuration file /etc/mongod.conf to the certificate file's path and restart the the component.</p>
          </description>
        </implemented-requirement>
      </control-implementation>
  </component>
  ...
</component-definition>
{{< /highlight >}}

In the example above, we demonstrated how to use OSCAL to document the MongoDB software component's control implementation for NIST control SC-8(1). However, one could document how the same component also satisfies controls from other security risk management frameworks (e.g., FedRAMP, ISO 27002, etc.) by simply adding additional [`<control-implementation>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/control-implementation) elements for each.  Likewise, for each `<control-implementation>`, we can add `<implemented-requirement>` elements for every control that can be implemented by the component.  
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    ...
    "component": {
      ...
      "control-implementations": [{
        "description": "MongoDB control implementations for NIST SP 800-53rev5.",
        "implemented-requirements": [{
          "description": "MongoDB supports TLS 1.x to encrypt data in transit, preventing unauthorized disclosure or changes to information during transmission. To implement TLS, set the PEMKeyFile option in the configuration file /etc/mongod.conf to the certificate file's path and restart the the component."
        }]
      }]
      ...
    }
    ...
  }
}
{{< /highlight >}}

In the example above, we demonstrated how to use OSCAL to document the MongoDB software component's control implementation for NIST control SC-8(1). However, one could document how the same component also satisfies controls from other security risk management frameworks (e.g., FedRAMP, ISO 27002, etc.) by simply adding additional [`control-implementations`](/reference/latest/component-definition/json-reference/#/component-definition/components/control-implementations) objects for each.  Likewise, for each `control-implementation`, we can add `implemented-requirements` objects for every control that can be implemented by the component.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition:
  component:
    control-implementations:
      - description: MongoDB control implementations for NIST SP 800-53rev5.
        implemented-requirements:
          - description: >-
              MongoDB supports TLS 1.x to encrypt data in transit, preventing
              unauthorized disclosure or changes to information during
              transmission. To implement TLS, set the PEMKeyFile option in the
              configuration file /etc/mongod.conf to the certificate file's path
              and restart the the component.

{{< /highlight >}}

In the example above, we demonstrated how to use OSCAL to document the MongoDB software component's control implementation for NIST control SC-8(1). However, one could document how the same component also satisfies controls from other security risk management frameworks (e.g., FedRAMP, ISO 27002, etc.) by simply adding additional `control-implementations` items for each.  Likewise, for each `control-implementation`, we can add `implemented-requirements` items for every control that can be implemented by the component.
{{% /tab %}}
{{% /tabs %}}

## The Final Component Definition

Combining all the content described in this tutorial, we can produce this final component definition model.  Provided below is a well-formed XML example.  Having these implementation details readily available in an OSCAL component definition means they can be used to populate an OSCAL SSP and should give SSP authors helpful content for their control implementation statements.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0" 
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="http://csrc.nist.gov/ns/oscal/1.0 https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_component_schema.xsd">
	<metadata>
		<title>MongoDB Component Definition Example</title>
		<last-modified>2001-12-17T09:30:47Z</last-modified>
		<version>20210507</version>
		<oscal-version>1.0.0-rc2</oscal-version>
		<role id="supplier">
			<title>Supplier</title>
		</role>
		<location uuid="0db91129-35ed-474f-a25e-c3ff1e2cb9dc">
			<address></address>
			<url>https://www.mongodb.com</url>
		</location>
		<party uuid="ef7c799a-c50e-49ab-83e0-515e989e6df1" type="prepared-for">
		    <name>MongoDB</name>
		</party>
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
		<control-implementation uuid="49f0b690-ed9f-4f32-aae0-625b77aa6d27" source="../../../content/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_MODERATE-baseline_profile.xml">
			<description>
				<p>MongoDB control implementations for NIST SP 800-53rev5.</p>
			</description>
			<implemented-requirement uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0" control-id="sc-8.1">
				<description>
					<p>MongoDB supports TLS 1.x to encrypt data in transit, preventing unauthorized disclosure or changes to information during transmission. To implement TLS, set the PEMKeyFile option in the configuration file /etc/mongod.conf to the certificate file's path and restart the the component.</p>
				</description>
			</implemented-requirement>
		</control-implementation>
	</component>
	<component uuid="3e5c92b8-870c-4313-871a-f4307bf2eaf0" type="service">
		<title>mongod</title>
		<description>
			<p>Mongo Daemon which runs the MongoDB database as a process.</p>
		</description>
		<purpose>Backend NoSQL database</purpose>
		<responsible-role role-id="supplier">
			<party-uuid>ef7c799a-c50e-49ab-83e0-515e989e6df1</party-uuid>
		</responsible-role>
		<protocol name="Transmission Control">
			<title>MongoDB requires use of TCP.</title>
			<port-range start="27017" end="27017" transport="TCP"/>
			<port-range start="27018" end="27018" transport="TCP"/>
			<port-range start="27019" end="27019" transport="TCP"/>
		</protocol>
		<control-implementation uuid="49f0b690-ed9f-4f32-aae0-625b77aa6d27" source="../../../content/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_MODERATE-baseline_profile.xml">
			<description>
				<p>The Mongo Daemon control implementations for NIST SP 800-53rev5.</p>
			</description>
			<implemented-requirement uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0" control-id="sa-4.9">
				<description>
					<p>Acquisition Process | Functions, Ports, Protocols, and Services in Use.  Must ensure that MongoDB only listens for network connections on authorized interface by configuring the MongoDB configuration file to limit its exposure to only the network
interfaces on which MongoDB instances should listen for incoming connections.  </p>
				</description>
			</implemented-requirement>
		</control-implementation>
	</component>
</component-definition>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    "metadata": {
      "title": "MongoDB Component Definition Example",
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210507,
      "oscal-version": "1.0.0-rc2",
      "roles": [{
        "title": "Supplier"
      }],
      "locations": [{
        "address": "",
        "url": "https://www.mongodb.com"
      }],
      "parties": [{
        "name": "MongoDB"
      }]
    },
    "components": [
      {
        "title": "MongoDB",
        "description": "MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.",
        "purpose": "Backend NoSQL database",
        "responsible-roles": [{
          "party-uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1"
        }],
        "control-implementations": [{
          "description": "MongoDB control implementations for NIST SP 800-53rev5.",
          "implemented-requirements": [{
            "description": "MongoDB supports TLS 1.x to encrypt data in transit, preventing unauthorized disclosure or changes to information during transmission. To implement TLS, set the PEMKeyFile option in the configuration file /etc/mongod.conf to the certificate file's path and restart the the component."
          }]
        }]
      },
      {
        "title": "mongod",
        "description": "Mongo Daemon which runs the MongoDB database as a process.",
        "purpose": "Backend NoSQL database",
        "responsible-roles": [{
          "party-uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1"
        }],
        "protocols": [{
          "title": "MongoDB requires use of TCP.",
          "port-range": [
            "",
            "",
            ""
          ]
        }],
        "control-implementations": [{
          "description": "The Mongo Daemon control implementations for NIST SP 800-53rev5.",
          "implemented-requirements": [{
            "description": "Acquisition Process | Functions, Ports, Protocols, and Services in Use.  Must ensure that MongoDB only listens for network connections on authorized interface by configuring the MongoDB configuration file to limit its exposure to only the network\r\ninterfaces on which MongoDB instances should listen for incoming connections."
          }]
        }]
      }
    ]
  }
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition:
  metadata:
    title: MongoDB Component Definition Example
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210507
    oscal-version: 1.0.0-rc2
    roles:
      - title: Supplier
    locations:
      - address: ''
        url: https://www.mongodb.com
    parties:
      - name: MongoDB
  components:
    - title: MongoDB
      description: >-
        MongoDB is a source-available cross-platform document-oriented database
        program. Classified as a NoSQL database program, MongoDB uses JSON-like
        documents with optional schemas.
      purpose: Backend NoSQL database
      responsible-roles:
        - party-uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
      control-implementations:
        - description: MongoDB control implementations for NIST SP 800-53rev5.
          implemented-requirements:
            - description: >-
                MongoDB supports TLS 1.x to encrypt data in transit, preventing
                unauthorized disclosure or changes to information during
                transmission. To implement TLS, set the PEMKeyFile option in the
                configuration file /etc/mongod.conf to the certificate file's
                path and restart the the component.
    - title: mongod
      description: Mongo Daemon which runs the MongoDB database as a process.
      purpose: Backend NoSQL database
      responsible-roles:
        - party-uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
      protocols:
        - title: MongoDB requires use of TCP.
          port-range:
            - ''
            - ''
            - ''
      control-implementations:
        - description: The Mongo Daemon control implementations for NIST SP 800-53rev5.
          implemented-requirements:
            - description: "Acquisition Process | Functions, Ports, Protocols, and Services in Use.  Must ensure that MongoDB only listens for network connections on authorized interface by configuring the MongoDB configuration file to limit its exposure to only the network\r\ninterfaces on which MongoDB instances should listen for incoming connections."

{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

## Summary

This concludes the tutorial.  You should now be familiar with:

- The basic structure of a component definition in OSCAL.
- How to provide the basic metadata required in an OSCAL component definition.
- How to use of a component within an OSCAL component definition.
- How to use the protocol elements in a component.
- How to specify the control implementation in a component.

For more information, you can review the OSCAL component definition model documentation.
