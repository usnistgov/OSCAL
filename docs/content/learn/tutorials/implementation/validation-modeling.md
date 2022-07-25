---
title: Representing Test Validation Information
heading: "Representing Test Validation Information for Components"
summary: "A mini-tutorial on providing test validation information (e.g., FIPS 140-2 validation) as an OSCAL component."
weight: 90
toc:
  enabled: true
sidenav:
    activerenderdepth: 2
    inactiverenderdepth: 2
aliases:
  - /documentation/schema/implementation-layer/validation-modeling/
  - /learn/tutorials/validation-modeling/
---

This tutorial covers describing test validation information (e.g., FIPS-140-2) using an OSCAL component.

Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Read the OSCAL implementation layer [overview](/concepts/layer/implementation/).
- Review the OSCAL [component definition](/concepts/layer/implementation/component-definition/) and [system security plan](/concepts/layer/implementation/ssp/) model overviews.

OSCAL's implementation layer models enable authors to capture testing validation information related to components. The validation information is represented as a component, which is then linked to a separate component on which the validation was performed.

For example, this approach can be used with a product containing a cryptographic module that has received a FIPS 140-2 validation by a NIST accredited laboratory. The product is represented as one `component`, and the validation information is represented in a different `component`. The two components are then linked as follows:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml >}}
<component uuid="11111111-0000-4000-a000-000000000001" type="hardware">
   <title>Product Name</title>
   <description>
      <p>Describe the product's function.</p>
   </description>
   <link rel="validation" href="#22222222-0000-4000-a000-000000000002" />
   <status state="operational" />
</component>
<component uuid="22222222-0000-4000-a000-000000000002" type="validation">
   <title>Validation Name</title>
   <description>
      <p>Describe the validation.</p>
   </description>
   <prop name="validation-type" value="fips-140-2" />
   <prop name="validation-reference" value="xxxx" />
   <link rel="validation-details" href="https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/xxxx" />
   <status state="operational" />
</component>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json >}}
{
  "components": [
    {
      "uuid": "11111111-0000-4000-a000-000000000001",
      "type": "hardware",
      "title": "Product Name",
      "description": "Describe the product's function.",
      "links": [
        {
          "rel": "validation",
          "href": "#22222222-0000-4000-a000-000000000002"
        }
      ],
      "status": {
        "state": "operational"
      }
    },
    {
      "uuid": "22222222-0000-4000-a000-000000000002",
      "type": "validation",
      "title": "Validation Name",
      "description": "Describe the validation.",
      "props": [
        {
          "name": "validation-type",
          "value": "fips-140-2"
        },
        {
          "name": "validation-reference",
          "value": "xxxx"
        }
      ],
      "links": [
        {
          "rel": "validation-details",
          "href": "https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/xxxx"
        }
      ],
      "status": {
        "state": "operational"
      }
    }
  }
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml>}}
    components:
      - uuid: 11111111-0000-4000-a000-000000000001:
        type: hardware
        title:          Product Name
        description:    Describe the product's function.
        links:
          - rel: validation
            href: #22222222-0000-4000-a000-000000000002
        status:
          state: operational
      - uuid: 22222222-0000-4000-a000-000000000002:
        component-type: validation
        title: Validation Name
        description: Describe the validation.
        props:
          - name:  validation-type
            value: fips-140-2
          - name:  validation-reference
            value: xxxx
        links:
          - rel:  validation-details
            href: https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/xxxx
        status:
          state: operational
{{< /highlight >}}
{{% /tab %}}
{{< /tabs >}}

The example above depicts two linked components:
- Component #1 (`11111111-0000-4000-a000-000000000001`) is a hardware component, which has achieved a FIPS 140-2 validation from a NIST validated testing lab.
- Component #2 (`22222222-0000-4000-a000-000000000002`) is a component representing the validation itself.

The only additional information necessary in component #1 is the link (XML:`link`, JSON/YAML: `links`) to component #2. The link's `rel` must be set to `validation`, and the `href` contains a URI fragment, which is the UUID of the second component, prepended with a hashtag (`#`). This link creates a `validation` association between the hardware component and the validation component.

In component #2, details are provided about the validation. There must be at least two properties (XML:`prop`, JSON/YAML:`properties`) and a link.
- `validation-type` property: a value depicting the type of validation, such as `fips-140-2` for a FIPS 140-2 validation.
- `validation-reference` property: a value containing the identifier assigned by the validating body, such as the FIPS 140-2 certificate number.
- `validation-details` link: A link to an online information provided by the authorizing body. This should be as specific as possible to the validation product. For example, for FIPS 140-2 validated products, the link should point to the specific certificate listing in the NIST Labs database. Additional links may be included, such as for the main page of the validating organization's web site.

# Summary

In this tutorial you learned:

- How to create a validation component.
- How to provide validation details in a validation component.
- How to associate a validation component with another component using a link.
