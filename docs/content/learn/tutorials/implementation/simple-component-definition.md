---
title: Creating a Component Definition
description: A tutorial on creating an OSCAL component definition.
weight: 40
suppresstopiclist: true
toc:
  enabled: true
alias:
- /learn/tutorials/component-definition/
---

This tutorial covers creating a basic OSCAL component definition. Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Read the OSCAL implementation layer [overview](/concepts/layer/implementation/).
- Review the OSCAL [component definition](/concepts/layer/implementation/component-definition/) model overview.
- Be familiar with the use of OSCAL properties and links.

## What is an OSCAL Component Definition?

An OSCAL [component definition](/concepts/layer/implementation/component-definition/) contains a collection of components. Each component in a component definition describes how a given implementation of a hardware, software, service, policy, process, or procedure asset can support or provide implementations of specific controls. The asset described by a component in a component definition is called a *component subject*"* in this tutorial.

By publishing a set of components in a component definition, product and service vendors, capability owners, policy and process owners, and [others](/concepts/layer/implementation/component-definition/#component-definition-authors) can share control implementation information for a component subject they maintain. The information about a component subject can then be [used](/concepts/layer/implementation/component-definition/#component-definition-consumers) when implementing that subject in an information system. This allows the control narrative for the subject to be imported into the System Security Plan (SSP).

It is important to note that component definitions do not describe actual implementations; rather, component definitions describe possible implementations which can be instantiated within an information system. Thus, component definitions serve as references with content that can be (re)used (e.g., in the SSP OSCAL model) to develop comprehensive and consistent control implementations within an SSP.

In this tutorial, we will walk through the process of creating an OSCAL component definition model instance for [MongoDB](https://docs.mongodb.com/).  Our goal is to demonstrate how to provide standard control implementations for the benefit of system owners and SSP authors that use a similar software application.

As potential components in information systems that may need to meet the OMB A-130 Authorization to Operate requirements, the component definition in this tutorial will show proper implementation of a couple [NIST SP 800-53 rev 5 controls](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev5/xml) deemed necessary for high, moderate, or low impact systems. While this example focuses on NIST controls, the same approach could be applied to any catalog of controls (e.g., ISO/IEC 27002).

For the purposes of this tutorial we'll presume the MongoDB component can partially or fully satisfy the following controls:

| NIST 800-53 rev5 Control | Description |
| -------- | -------- |
| SA-4(9) | Acquisition Process - Functions, Ports, Protocols, and Services in Use |
| SC-8(1) | Transmission Confidentiality and Integrity |

This tutorial demonstrates how to document a set of implemented controls as an OSCAL component definition for these controls.

## Creating an OSCAL Component Definition Instance

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

The root of the OSCAL component definition model is [`<component-definition>`](/reference/latest/component-definition/xml-reference/#/component-definition). Note that the schema location attribute is omitted for this example. The `@uuid` attribute (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `<component-definition>` contains the following elements:

- `<metadata>` (required) - Provides document metadata for the component definition. This is covered in the [next section](#defining-the-component-definitions-metadata) to a limited extent. The metadata used here is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `<import-component-definition>` (optional) – Identifies a collection of external component definitions from other resources from which related information is referenced within this component definition. Use of `<import-component-definition>` is not covered in this tutorial.
- `<component>` (optional) - Defines a given component in the component definition. Zero or more `<component>` elements may be used. Use of this element is [discussed later](#defining-the-mongodb-component) in this tutorial.
- `<capability>` (optional) - Defines a given capability in the component definition. Zero or more `<capability>` elements may be used. Capabilities are not covered in this tutorial.
- `<back-matter>` (optional) – Contains resources which are referenced within the component definition. Use of `<back-matter>` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    "uuid": "a7ba800c-a432-44cd-9075-0862cd66da6b",
    "metadata": {},
    "import-component-definitions": [{}],
    "components": [{}],
    "capabilities": [{}],
    "back-matter": {}
  }
}
{{< /highlight >}}

The root of the OSCAL component definition model is [`component-definition`](/reference/latest/component-definition/json-reference/#/component-definition). The `uuid` property (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `component-definition` contains the following properties:

- `metadata` (required) - Provides document metadata for the component definition. This is covered in the [next section](#defining-the-component-definitions-metadata) to a limited extent. The metadata used here is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `import-component-definitions` (optional) – Identifies a collection of external component definitions from other resources from which related information is referenced within this component definition.  Use of `import-component-definitions` is not covered in this tutorial.
- `components` (optional) - Groups `component` objects which each define a given component in the component definition. One or more `component` objects may be provided. Use of this property is [discussed later](#defining-the-mongodb-component) in this tutorial.
- `capabilities` (optional) - Defines a group of given capabilities in the component definition. One or more `capability` objects may be used. Capabilities are not covered in this tutorial.
- `back-matter` (optional) – Contains references which are referenced within the component definition. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}

---
component-definition:
  uuid: a7ba800c-a432-44cd-9075-0862cd66da6b
  metadata: ~
  import-component-definitions: ~
  components: ~
  capabilities: ~
  back-matter: ~
{{< /highlight >}}

The root of the OSCAL component definition model is [`component-definition`](/reference/latest/component-definition/json-reference/#/component-definition). The `uuid` key (on line 3) is the document's universally unique identifier (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by RFC 4122. OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `component-definition` contains the following keys:

- `metadata` (required) - Provides document metadata for the component definition. This is covered in the [next section](#defining-the-component-definitions-metadata) to a limited extent. The metadata used here is similar to metadata for other OSCAL models, therefor is not described extensively in this tutorial.
- `import-component-definitions` (optional) – Identifies a collection of external component definitions from other resources from which related information is referenced within this component definition.  Use of `import-component-definitions` is not covered in this tutorial.
- `components` (optional) - Groups `component` items which define given component(s) in the component definition. One or more `component` items may be used. Use of this key is [discussed later](#defining-the-mongodb-component) in this tutorial.
- `capabilities` (optional) - Defines a group of given capabilities in the component definition. One or more `capability` items may be used. Capabilities are not covered in this tutorial.
- `back-matter` (optional) – Contains references which are referenced within the component definition. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{< /tabs >}}

For simplicity of this tutorial, we will only discuss certain data structures in the sections that follow and identify how they can be used to represent our component definition.

### Defining the Component Definition’s Metadata

Most OSCAL models have a standard metadata syntax, therefore, this is not covered extensively in this tutorial.  There are a few considerations however when authoring metadata for a component definition, such as the `role` and `party` data items illustrated in the example below.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  <metadata>
    <title>MongoDB Component Definition Example</title>
    <last-modified>2001-08-26T23:11:47Z</last-modified>
    <version>20210826</version>
    <oscal-version>1.0.0</oscal-version>
    <role id="provider">
      <title>Provider</title>
    </role>
    <party uuid="ef7c799a-c50e-49ab-83e0-515e989e6df1" type="organization">
      <name>MongoDB</name>
      <link rel="website" href="https://www.mongodb.com"/>
    </party>
  </metadata>
</component-definition>
{{< /highlight >}}

The [`<role>`](/reference/latest/component-definition/xml-reference/#/component-definition/metadata/role) element defines a function assumed or expected to be assumed by a party in a specific situation. In this case the role `provider` has been standardized by OSCAL to be used for [component definition authors](/concepts/layer/implementation/component-definition/#component-definition-authors). This element has a required `@id` attribute which expects an [token](/reference/datatypes/#token) data type. A `<title>` is also provided.

The `<party>` element represents either a person or organization that serves as the responsible entity. A party must have an associated `@uuid` which is used to reference this party, a `<name>` which provides a formal label, and a `@type` which defines the nature of the party. There are prescribed types, including *"person"*, and *"organization"*. In this case we are defining the MongoDB project as an organization. A pointer to the organization's website is also included.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    "uuid": "a7ba800c-a432-44cd-9075-0862cd66da6b",
    "metadata": {
      "title": "MongoDB Component Definition Example",
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210507,
      "oscal-version": "1.0.0",
      "roles": [{
        "id": "provider",
        "title": "Provider"
      }],
      "parties": [{
        "uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1",
        "type": "organization",
        "name": "MongoDB",
        "links": [{
          "href": "https://www.mongodb.com",
          "rel": "website"
        }]
      }]
    }
  }
}
{{< /highlight >}}

The [`roles`](/reference/latest/component-definition/json-reference/#/component-definition/metadata/roles) property provides a grouping of role objects that each defines a function assumed or expected to be assumed by a party in a specific situation. In this case the role `provider` has been standardized by OSCAL to be used for [component definition authors](/concepts/layer/implementation/component-definition/#component-definition-authors). This element has a required `id` attribute which expects an [token](/reference/datatypes/#token) data type. A `title` is also provided.

The [`parties`](/reference/latest/component-definition/json-reference/#/component-definition/metadata/parties) property provides a grouping of party objects that each represent either a person or organization that serves as the responsible entity. A party must have an associated `uuid` which is used to reference this party, a `name` which provides a formal label, and a `type` which defines the nature of the party. There are prescribed types, including *"person"*, and *"organization"*. In this case we are defining the MongoDB project as an organization. A pointer to the organization's website is also included.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---

component-definition:
  uuid: a7ba800c-a432-44cd-9075-0862cd66da6b
  metadata:
    title: MongoDB Component Definition Example
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210507
    oscal-version: 1.0.0
    roles:
    - id: provider
      title: Provider
    parties:
    - uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
      type: organization
      name: MongoDB
      links:
      - href: <https://www.mongodb.com>
        rel: website
{{< /highlight >}}

The [`roles`](/reference/latest/component-definition/json-reference/#/component-definition/metadata/roles) key provides a grouping of role items that each defines a function assumed or expected to be assumed by a party in a specific situation. In this case the role `provider` has been standardized by OSCAL to be used for [component definition authors](/concepts/layer/implementation/component-definition/#component-definition-authors). A role item has a required `id` attribute which expects an [token](/reference/datatypes/#token) data type. A `title` is also provided.

The [`parties`](/reference/latest/component-definition/json-reference/#/component-definition/metadata/parties) key provides a grouping of party objects that each represent either a person or organization that serves as the responsible entity. A party must have an associated `uuid` which is used to reference this party, a `name` which provides a formal label, and a `type` which defines the nature of the party. There are prescribed types, including *"person"*, and *"organization"*. In this case we are defining the MongoDB project as an organization. A pointer to the organization's website is also included.
{{% /tab %}}
{{% /tabs %}}

### Defining the MongoDB Component

Within the component definition model, components provide a way to describe subject assets which may be used as parts of an information system. A component allows potential control implementations to be described for an subject asset, which can then be used when implementing an information system. While components are optional in a component definition, a typical component definition will include at least one component. In this example, we'll demonstrate how the control implementation of the MongoDB software is represented using the OSCAL component definition model. The snippet below provides an example of the minimum data needed to define a component.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  <component uuid="91f646c5-b1b6-4786-9ec3-2305a044e217" type="software">
    <title>MongoDB</title>
    <description>
      <p>MongoDB is a source-available, cross-platform document-oriented
        database program. Classified as a NoSQL database program, MongoDB
        uses JSON-like documents with optional schemas.</p>
    </description>
    <purpose>Provides a NoSQL database service</purpose>
    <responsible-role role-id="provider">
      <party-uuid>ef7c799a-c50e-49ab-83e0-515e989e6df1</party-uuid>
    </responsible-role>
    <protocol />
    <control-implementation />
  </component>
</component-definition>
{{< /highlight >}}

A component is represented using the [`<component>`](/reference/latest/component-definition/xml-reference/#/component-definition/component) element (on line 3). This element requires a unique identifier, which is provided using the `@uuid` attribute.

The required `@type` attribute categorizes the component by asset type. Some common examples include interconnection, hardware, software, service, policy, process/procedure, plan, guidance, standard, and validation. In our example, we’ll set the MongoDB component as the "*software*" type, since MongoDB is a software application.

Next, the component needs to have title and description elements that help to support human-readability of this information.

The optional `<responsible-role>` element can be used to reference one or more roles with responsibility for performing a function relative to the component.  In this tutorial, will reference the `provider` and map this role to the mongoDB party.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    "components": [{
      "uuid": "91f646c5-b1b6-4786-9ec3-2305a044e217",
      "type": "software",
      "title": "MongoDB",
      "description": "MongoDB is a source-available, cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.",
      "purpose": "Provides a NoSQL database service",
      "responsible-roles": [{
        "role-id": "provider",
        "party-uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1"
      }],
      "protocols": [{}],
      "control-implementations": [{}]
    }]
  }
}
{{< /highlight >}}

A component is represented in the [components](/reference/latest/component-definition/json-reference/#/component-definition/components) object array shown in line 4. Each component requires a unique identifier, which is provided using the `uuid` property.

The required `type` property categorizes the component by asset type.  Some common examples include interconnection, hardware, software, service, policy, process/procedure, plan, guidance, standard, and validation. In our example, we’ll set the MongoDB component as the "*software*" type, since MongoDB is a software application.

Next, the component needs to have title and description properties that help to support human-readability of this information.

The optional `responsible-roles` property can be used to reference one or more roles with responsibility for performing a function relative to the component.  In this tutorial, will reference the `provider` and map this role to the mongoDB party.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---

component-definition:
  components:
  - uuid: 91f646c5-b1b6-4786-9ec3-2305a044e217
    type: software
    title: MongoDB
    description: >-
      MongoDB is a source-available, cross-platform document-oriented
      database program. Classified as a NoSQL database program, MongoDB
      uses JSON-like documents with optional schemas.
    purpose: Provides a NoSQL database service
    responsible-roles:
    - role-id: provider
      party-uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
    protocols: ~
    control-implementations: ~
{{< /highlight >}}

A component is represented in the [components](/reference/latest/component-definition/json-reference/#/component-definition/components) object array shown in line 4. Each component requires a unique identifier, which is provided using the `uuid` property.

The required `type` key categorizes the component by asset type.  Some common examples include interconnection, hardware, software, service, policy, process/procedure, plan, guidance, standard, and validation. In our example, we’ll set the MongoDB component to a "*software*" type.  

Next, the component needs to have title and description keys that help to support human-readability of this information.

The optional `responsible-roles` key can be used to reference one or more roles with responsibility for performing a function relative to the component. In this tutorial, will reference the `provider` and map this role to the mongoDB party.
{{% /tab %}}
{{% /tabs %}}

### Defining Protocols Used in a Component

Another optional but valuable sub-element of `<component>` is [`<protocol>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/protocol).  Generally, `<protocol>` elements are applicable when dealing with a `<component>` of types *"service"*, but they can also be provided for component types *"software"*, *"hardware"*, or *"interconnection"*.  In our example, we'll assume that installations of MongoDB will result in an installation of mongod (Mongo Daemon) which runs the MongoDB database as a process and uses the following protocols:

| Port| Transport | Direction | Description |
| ----- | --------- | --------- | ----------- |
| 27017 | TCP | Inbound | The default port for mongod and mongos instances. |
| 27018 | TCP | Inbound | The default port when running with --shardsvr runtime operation. |
| 27019 | TCP | Inbound-Outbound | The default port when running with --configsvr runtime operation |

This is represented below.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  <component uuid="91f646c5-b1b6-4786-9ec3-2305a044e217" type="service">
    <title>MongoDB</title>
    <protocol uuid="2b4a1b3a-cbc5-4cc8-bde6-7437c28c4e54" name="mongodb">
      <title>Primary daemon process for the MongoDB system.</title>
      <port-range start="27017" end="27017" transport="TCP" />
    </protocol>
    <protocol uuid="99d8d4e5-e734-4e05-a2f9-7353097b8b61"
        name="mongodb-shardsrv">
      <title>MongoDB protocol for sharding with shardsrv option.</title>
      <port-range start="27018" end="27018" transport="TCP" />
    </protocol>
    <protocol uuid="6fa762f1-09ca-44d5-a94c-cfceb57debd5"
        name="mongodb-configsvr">
      <title>MongoDB protocol for configsrv operation.</title>
      <port-range start="27019" end="27019" transport="TCP" />
    </protocol>
    <control-implementation />
  </component>
</component-definition>
{{< /highlight >}}

The [`<protocol>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/protocol) element has a mandatory `@uuid` and mandatory `@name` attribute that should be set to the common name of the protocol, which should be the appropriate "service name" from the [IANA Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml?search=27017).  In this example, we set it to "mongodb", which is registered with IANA.  The `@name` attribute accepts [string](/reference/datatypes/#string) data types and can be set to other values when there is no corresponding IANA service name for the port (e.g., lines 10 and 15). Descriptive text for the protocol can be provided using the `title` element.  The `<port-range>` element is where we can specify the port number(s) and associated transport. If the protocol uses multiple contiguous port numbers, a single `<port-range>` element with `start="27017" end="27019"` is sufficient, however; when the component has several protocols, it is acceptable to have multiple `<protocol>` and `<port-range>` elements as shown in the example XML above.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    "components": [{
      "uuid": "91f646c5-b1b6-4786-9ec3-2305a044e217",
      "type": "service",
      "title": "MongoDB",
      "protocols": [{
        "uuid": "2b4a1b3a-cbc5-4cc8-bde6-7437c28c4e54",
        "name": "mongodb",
        "title": "Primary daemon process for the MongoDB system.",
        "port-ranges": [{
          "start": 27017,
          "end": 27017,
          "transport": "TCP"
        }]
      },
      {
        "uuid": "99d8d4e5-e734-4e05-a2f9-7353097b8b61",
        "name": "mongodb-shardsrv",
        "title": "MongoDB protocol for sharding with shardsrv option.",
        "port-ranges": [{
          "start": 27018,
          "end": 27018,
          "transport": "TCP"
        }]
      },
      {
        "uuid": "6fa762f1-09ca-44d5-a94c-cfceb57debd5",
        "name": "mongodb-configsvr",
        "title": "MongoDB protocol for configsrv operation.",
        "port-ranges": [{
          "start": 27019,
          "end": 27019,
          "transport": "TCP"
        }]
      }]
    }]
  }
}
{{< /highlight >}}

The [`protocols`](/reference/latest/component-definition/json-reference/#/component-definition/components/protocols) grouping has objects with mandatory `uuid` and mandatory `name` properties that should be set to the common name of the protocol, which should be the appropriate "service name" from the [IANA Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml?search=27017).  In this example, we set it to "mongodb", which is registered with IANA.  The `name` property accepts [string](/reference/datatypes/#string) data types and can be set to other values when there is no corresponding IANA service name for the port (e.g., lines 19 and 29).  Descriptive text for the protocol can be provided using the `title` property.  The `port-ranges` object grouping is where you can specify the port number(s) and associated transport. If the protocol uses multiple contiguous port numbers, a single `port-ranges` object with `"start":"27017"` and `"end":"27019"` is sufficient; however, when the component has several protocols, it is acceptable to have multiple `protocols` and `port-ranges` objects as shown in the example XML above.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---

component-definition:
  components:
  - uuid: 91f646c5-b1b6-4786-9ec3-2305a044e217
    type: service
    title: MongoDB
    protocols:
    - uuid: 2b4a1b3a-cbc5-4cc8-bde6-7437c28c4e54
      name: mongodb
      title: Primary daemon process for the MongoDB system.
      port-ranges:
      - start: 27017
        end: 27017
        transport: TCP
    - uuid: 99d8d4e5-e734-4e05-a2f9-7353097b8b61
      name: mongodb-shardsrv
      title: MongoDB protocol for sharding with shardsrv option.
      port-ranges:
      - start: 27018
        end: 27018
        transport: TCP
    - uuid: 6fa762f1-09ca-44d5-a94c-cfceb57debd5
      name: mongodb-configsvr
      title: MongoDB protocol for configsrv operation.
      port-ranges:
      - start: 27019
        end: 27019
        transport: TCP
{{< /highlight >}}

The [`protocols`](/reference/latest/component-definition/json-reference/#/component-definition/components/protocols) key has items with mandatory `uuid` and mandatory `name` keys that should be set to the common name of the protocol, which should be the appropriate "service name" from the [IANA Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml?search=27017).  In this example, we set it to "mongodb", which is registered with IANA.  The `name` key accepts [string](/reference/datatypes/#string) data types and can be set to other values when there is no corresponding IANA service name for the port (e.g., lines 17 and 24).  Descriptive text for the protocol can be provided using the `title` key.  The `port-ranges` key can contain items where you can specify the port number(s) and associated transport. If the protocol uses multiple contiguous port numbers, a single `port-ranges` key with `start: 27017` and `end: 27019` is sufficient; however, when the component has several protocols, it is acceptable to have multiple `protocols` and `port-ranges` items as shown in the example XML above.
{{% /tab %}}
{{% /tabs %}}

### Defining Control Implementation Details

By providing control implementation details in a component, information is provided about how the given component target can satisfy controls with an associated OSCAL [catalog](/concepts/layer/control/catalog/) in general, or an associated OSCAL [profile](/concepts/layer/control/profile/) to describe how the component subject can satisfy controls from a specific baseline.  In this example, we document how the MongoDB component may satisfy **SC-8(1)** which requires the implementation of cryptographic mechanisms to prevent unauthorized disclosure of information and/or detect changes to information during transmission.

An example of providing control implementation details for SC-8(1) is provided below.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<component-definition xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="a7ba800c-a432-44cd-9075-0862cd66da6b">
  <component uuid="91f646c5-b1b6-4786-9ec3-2305a044e217" type="software">
    <control-implementation
        uuid="49f0b690-ed9f-4f32-aae0-625b77aa6d27"
        source="https://github.com/usnistgov/oscal-content/blob/master/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_MODERATE-baseline_profile.xml">
      <description>
        <p>MongoDB control implementations for NIST SP 800-53 revision 5.</p>
      </description>
      <implemented-requirement
          uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0"
          control-id="sc-8.1">
        <description>
          <p>MongoDB supports TLS 1.x to encrypt data in transit,
          preventing unauthorized disclosure or changes to information
          during transmission. To implement TLS, set the PEMKeyFile
          option in the configuration /etc/mongod.conf to the
          certificate file's path and restart the the component.</p>
        </description>
      </implemented-requirement>
    </control-implementation>
  </component>
</component-definition>
{{< /highlight >}}

To document this, we use the [`<control-implementation>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/control-implementation) element.  This element requires a unique identifier, which is provided using the `@uuid` attribute.  This element also has a `@source` attribute that is used to provide a URI reference to the appropriate OSCAL catalog or profile.  The URI reference can be a URI, a relative reference, or a fragment that points to a [`<back-matter>`](/reference/latest/component-definition/xml-reference/#/component-definition/back-matter) resource.  The `<implemented-requirement>` element on line 10 is where we can specify the control (e.g., SC-8(1)) and the implementation description.  The `<implemented-requirement>` element also has its own unique identifier `@uuid`, and the control is specified in the `@control-id` attribute on line 12.  We then use the `<description>` element to describe how this component can satisfy the specified control.

In the example above, we demonstrated how to use OSCAL to document the MongoDB software component's control implementation for NIST control SC-8(1). However, one could document how the same component also satisfies controls from other security risk management frameworks (e.g., FedRAMP, ISO 27002, etc.) by simply adding additional [`<control-implementation>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/control-implementation) elements for each catalog or profile.  Likewise, for each `<control-implementation>`, we can add additional `<implemented-requirement>` elements for every control that can be implemented by the component. Additionally, we can address implementations at the control statement-level using the [`<statement>`](/reference/latest/component-definition/xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement) element, allowing implementation details to be provided in a more fine-grained way.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "component-definition": {
    "uuid": "a7ba800c-a432-44cd-9075-0862cd66da6b",
    "components": [{
      "uuid": "91f646c5-b1b6-4786-9ec3-2305a044e217",
      "type": "software",
      "control-implementations": [{
        "uuid": "49f0b690-ed9f-4f32-aae0-625b77aa6d27",
        "source": "https://github.com/usnistgov/oscal-content/blob/master/nist.gov/SP800-53/rev5/json/NIST_SP-800-53_rev5_MODERATE-baseline_profile.json",
        "description": "MongoDB control implementations for NIST SP 800-53
          revision 5.",
        "implemented-requirements" [{
          "uuid": "cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0",
          "control-id": "sc-8.1",
          "description": "MongoDB supports TLS 1.x to encrypt data in transit,
            preventing unauthorized disclosure or changes to information
            during transmission. To implement TLS, set the PEMKeyFile option
            in the configuration file /etc/mongod.conf to the certificate
            file's path and restart the the component."
        }]
      }]
    }]
  }
}
{{< /highlight >}}

To document this, we use the [`control-implementations`](/reference/latest/component-definition/json-reference/#/component-definition/components/control-implementations) grouping.  Objects within this grouping require a unique identifier, which is provided using the `uuid` property.  This object also has a `source` property that is used to provide a URI reference to the appropriate OSCAL catalog or profile.  The URI reference can be a URI, a relative reference, or a fragment that points to a [`back-matter`](/reference/latest/component-definition/json-reference/#/component-definition/back-matter) resource.  The `implemented-requirements` grouping on line 12 is where we can specify the control (e.g., SC-8(1)) and the implementation description.  Each object in the `implemented-requirements` grouping also has its own unique identifier `uuid`, and the control is specified using the `control-id` property on line 14.  We then use the `description` property to describe how this component can satisfy the specified control.

In the example above, we demonstrated how to use OSCAL to document the MongoDB software component's control implementation for NIST control SC-8(1). However, one could document how the same component also satisfies controls from other security risk management frameworks (e.g., FedRAMP, ISO 27002, etc.) by simply adding additional [`control-implementations`](/reference/latest/component-definition/json-reference/#/component-definition/components/control-implementations) objects for each catalog or profile.  Likewise, for each `control-implementations` object, we can add additional `implemented-requirements` objects for every control that can be implemented by the component. Additionally, we can address implementations at the control statement-level using the [`statements`](/reference/latest/component-definition/json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements) grouping, allowing implementation details to be provided in a more fine-grained way.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---

component-definition:
  uuid: a7ba800c-a432-44cd-9075-0862cd66da6b,
  components:
  - uuid: 91f646c5-b1b6-4786-9ec3-2305a044e217
    type: software
    control-implementations:
    - uuid: 49f0b690-ed9f-4f32-aae0-625b77aa6d27
      source: <https://github.com/usnistgov/oscal-content/blob/master/nist.gov/SP800-53/rev5/json/NIST_SP-800-53_rev5_MODERATE-baseline_profile.json>
      description: >-
        MongoDB control implementations for NIST SP 800-53rev5.
      implemented-requirements:
      - uuid: cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0
        control-id: sc-8.1
        description: >-
          MongoDB supports TLS 1.x to encrypt data in transit, preventing
          unauthorized disclosure or changes to information during
          transmission. To implement TLS, set the PEMKeyFile option in the
          configuration file /etc/mongod.conf to the certificate file's path
          and restart the the component.
{{< /highlight >}}

To document this, we use the [`control-implementations`](/reference/latest/component-definition/json-reference/#/component-definition/components/control-implementations) key.  Items associated with this key require a unique identifier, which is provided using the `uuid` key.  These items also have a `source` key that is used to provide a URI reference to the appropriate OSCAL catalog or profile.  The URI reference can be a URI, a relative reference, or a fragment that points to a [`back-matter`](/reference/latest/component-definition/json-reference/#/component-definition/back-matter) resource.  The `implemented-requirements` key on line 13 is where we can specify the control (e.g., SC-8(1)) and the implementation description.  Each item under the `implemented-requirements` key also has its own unique identifier `uuid`, and the control is specified using the `control-id` key on line 15.  We then use the `description` key to describe how this component can satisfy the specified control.

In the example above, we demonstrated how to use OSCAL to document the MongoDB software component's control implementation for NIST control SC-8(1). However, one could document how the same component also satisfies controls from other security risk management frameworks (e.g., FedRAMP, ISO 27002, etc.) by simply adding additional [`control-implementations`](/reference/latest/component-definition/json-reference/#/component-definition/components/control-implementations) items for each catalog or profile.  Likewise, for each `control-implementations` item, we can add additional `implemented-requirements` items for every control that can be implemented by the component. Additionally, we can address implementations at the control statement-level using the [`statements`](/reference/latest/component-definition/json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements) key, allowing implementation details to be provided in a more fine-grained way.
{{% /tab %}}
{{% /tabs %}}

## The Final Component Definition

Combining all the content described in this tutorial, we can produce a completed component definition instance.  Provided below are well-formed complete examples.  Having these implementation details readily available in an OSCAL component definition means they can be used to populate an OSCAL SSP and should give SSP authors helpful content for their control implementation statements. These examples can also be downloaded in [XML]({{< param "contentRepoPath" >}}/examples/component-definition/xml/example-component-definition.xml),
[JSON]({{< param "contentRepoPath" >}}/examples/component-definition/json/example-component-definition.json),
and [YAML]({{< param "contentRepoPath" >}}/examples/component-definition/yaml/example-component-definition.yaml).

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
    <last-modified>2001-08-26T23:11:47Z</last-modified>
    <version>20210826</version>
    <oscal-version>1.0.0</oscal-version>
    <role id="provider">
      <title>Provider</title>
    </role>
    <party uuid="ef7c799a-c50e-49ab-83e0-515e989e6df1" type="organization">
      <name>MongoDB</name>
      <link rel="website" href="https://www.mongodb.com"/>
    </party>
  </metadata>
  <component uuid="91f646c5-b1b6-4786-9ec3-2305a044e217" type="software">
    <title>MongoDB</title>
    <description>
      <p>MongoDB is a source-available, cross-platform document-oriented
        database program. Classified as a NoSQL database program, MongoDB
        uses JSON-like documents with optional schemas.</p>
    </description>
    <purpose>Provides a NoSQL database service</purpose>
    <responsible-role role-id="provider">
      <party-uuid>ef7c799a-c50e-49ab-83e0-515e989e6df1</party-uuid>
    </responsible-role>
    <protocol uuid="2b4a1b3a-cbc5-4cc8-bde6-7437c28c4e54" name="mongodb">
      <title>Primary daemon process for the MongoDB system.</title>
      <port-range start="27017" end="27017" transport="TCP" />
    </protocol>
    <protocol uuid="99d8d4e5-e734-4e05-a2f9-7353097b8b61"
        name="mongodb-shardsrv">
      <title>MongoDB protocol for sharding with shardsrv option.</title>
      <port-range start="27018" end="27018" transport="TCP" />
    </protocol>
    <protocol uuid="6fa762f1-09ca-44d5-a94c-cfceb57debd5"
        name="mongodb-configsvr">
      <title>MongoDB protocol for configsrv operation.</title>
      <port-range start="27019" end="27019" transport="TCP" />
    </protocol>
    <control-implementation
        uuid="49f0b690-ed9f-4f32-aae0-625b77aa6d27"
        source="https://github.com/usnistgov/oscal-content/blob/master/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_MODERATE-baseline_profile.xml">
      <description>
        <p>MongoDB control implementations for NIST SP 800-53 revision 5.</p>
      </description>
      <implemented-requirement
          uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0"
          control-id="sc-8.1">
        <description>
          <p>MongoDB supports TLS 1.x to encrypt data in transit,
          preventing unauthorized disclosure or changes to information
          during transmission. To implement TLS, set the PEMKeyFile
          option in the configuration /etc/mongod.conf to the
          certificate file's path and restart the the component.</p>
        </description>
      </implemented-requirement>
      <implemented-requirement
          uuid="cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0"
          control-id="sa-4.9">
        <description>
          <p>Must ensure that MongoDB only listens for network
          connections on authorized interfaces by configuring the MongoDB
          configuration file to limit the services exposure to only the
          network interfaces on which MongoDB instances should listen for
          incoming connections.</p>
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
    "uuid": "a7ba800c-a432-44cd-9075-0862cd66da6b",
    "metadata": {
      "title": "MongoDB Component Definition Example",
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210507,
      "oscal-version": "1.0.0",
      "roles": [{
      "id": "supplier",
      "title": "Supplier"
      }],
      "parties": [{
      "uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1",
      "type": "organization",
      "name": "MongoDB",
      "links": "https://www.mongodb.com"
      }]
    },
    "components": [{
      "uuid": "91f646c5-b1b6-4786-9ec3-2305a044e217",
      "type": "software",
      "title": "MongoDB",
      "description": "MongoDB is a source-available, cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas.",
      "purpose": "Provides a NoSQL database service",
      "responsible-roles": [{
        "role-id": "provider",
        "party-uuid": "ef7c799a-c50e-49ab-83e0-515e989e6df1"
      }],
      "protocols": [{
        "uuid": "2b4a1b3a-cbc5-4cc8-bde6-7437c28c4e54",
        "name": "mongodb",
        "title": "Primary daemon process for the MongoDB system.",
        "port-ranges": [{
          "start": 27017,
          "end": 27017,
          "transport": "TCP"
        }]
      },
      {
        "uuid": "99d8d4e5-e734-4e05-a2f9-7353097b8b61",
        "name": "mongodb-shardsrv",
        "title": "MongoDB protocol for sharding with shardsrv option.",
        "port-ranges": [{
          "start": 27018,
          "end": 27018,
          "transport": "TCP"
        }]
      },
      {
        "uuid": "6fa762f1-09ca-44d5-a94c-cfceb57debd5",
        "name": "mongodb-configsvr",
        "title": "MongoDB protocol for configsrv operation.",
        "port-ranges": [{
          "start": 27019,
          "end": 27019,
          "transport": "TCP"
        }]
      }],
      "control-implementations": [{
        "uuid": "49f0b690-ed9f-4f32-aae0-625b77aa6d27",
        "source": "https://github.com/usnistgov/oscal-content/blob/master/nist.gov/SP800-53/rev5/json/NIST_SP-800-53_rev5_MODERATE-baseline_profile.json",
        "description": "MongoDB control implementations for NIST SP 800-53
          revision 5.",
        "implemented-requirements" [{
          "uuid": "cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0",
          "control-id": "sc-8.1",
          "description": "MongoDB supports TLS 1.x to encrypt data in transit,
            preventing unauthorized disclosure or changes to information
            during transmission. To implement TLS, set the PEMKeyFile option
            in the configuration file /etc/mongod.conf to the certificate
            file's path and restart the the component."
        }]
      }]
    }]
  }
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
component-definition:
  uuid: a7ba800c-a432-44cd-9075-0862cd66da6b
  metadata:
    title: MongoDB Component Definition Example
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210507
    oscal-version: 1.0.0
    roles:
    - id: provider
      title: Provider
    parties:
    - uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
      type: organization
      name: MongoDB
      links:
      - href: <https://www.mongodb.com>
        rel: website
  components:
  - uuid: 91f646c5-b1b6-4786-9ec3-2305a044e217
    type: software
    title: MongoDB
    description: >-
      MongoDB is a source-available, cross-platform document-oriented
      database program. Classified as a NoSQL database program, MongoDB
      uses JSON-like documents with optional schemas.
    purpose: Provides a NoSQL database service
    responsible-roles:
    - role-id: provider
      party-uuid: ef7c799a-c50e-49ab-83e0-515e989e6df1
    protocols:
    - uuid: 2b4a1b3a-cbc5-4cc8-bde6-7437c28c4e54
      name: mongodb
      title: Primary daemon process for the MongoDB system.
      port-ranges:
      - start: 27017
        end: 27017
        transport: TCP
    - uuid: 99d8d4e5-e734-4e05-a2f9-7353097b8b61
      name: mongodb-shardsrv
      title: MongoDB protocol for sharding with shardsrv option.
      port-ranges:
      - start: 27018
        end: 27018
        transport: TCP
    - uuid: 6fa762f1-09ca-44d5-a94c-cfceb57debd5
      name: mongodb-configsvr
      title: MongoDB protocol for configsrv operation.
      port-ranges:
      - start: 27019
        end: 27019
        transport: TCP
    control-implementations:
    - uuid: 49f0b690-ed9f-4f32-aae0-625b77aa6d27
      source: <https://github.com/usnistgov/oscal-content/blob/master/nist.gov/SP800-53/rev5/json/NIST_SP-800-53_rev5_MODERATE-baseline_profile.json>
      description: >-
        MongoDB control implementations for NIST SP 800-53rev5.
      implemented-requirements:
      - uuid: cf8338c5-fb6e-4593-a4a8-b3c4946ee2a0
        control-id: sc-8.1
        description: >-
          MongoDB supports TLS 1.x to encrypt data in transit, preventing
          unauthorized disclosure or changes to information during
          transmission. To implement TLS, set the PEMKeyFile option in the
          configuration file /etc/mongod.conf to the certificate file's path
          and restart the the component.
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

## Summary

This concludes the tutorial.  You should now be familiar with:

- The basic structure of a component definition in OSCAL.
- How to provide the basic metadata required in an OSCAL component definition.
- How to define a component within an OSCAL component definition.
- How to use the protocol elements in a component.
- How to specify the control implementation for a component.

For more information, you can review the OSCAL component definition model [documentation](/concepts/layer/implementation/component-definition/).
