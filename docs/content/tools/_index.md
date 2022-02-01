---
title: Tools
heading: OSCAL Tools
menu:
  primary:
    name: Tools
    weight: 50
toc:
  enabled: true
toc:
  enabled: true
---

The [OSCAL models](/concepts/layer/) provide standardized formats for exchanging control, control implementation, and control assessment information in XML, JSON, and YAML. These formats allow this information to be exchanged between tools and for individual tools to process exchanged data, supporting analytics, user interaction, and increased automation.

Tools exist that support the use of the OSCAL models. These tools are listed below in the following categories:

- OSCAL Project provided tools and libraries
- Open Source Tools provided by 3rd parties

If you have produced a tool that supports the OSCAL formats that you would like to have listed on this page, please [contact us](/contact/).

## Disclaimer

**Certain products may be identified on this web page, but such identification doesn’t imply recommendation by the US National Institute of Standards and Technology or other agencies of the US Government, nor does it imply that the products identified are necessarily the best available for the purpose.**

See the [NIST Software Disclaimer](https://www.nist.gov/disclaimer) for more information.

## OSCAL Tools and Libraries

| Name | Provider/Developer | Description | Type |
|:---|:---|:---|:---|
| [Compliance trestle](https://github.com/IBM/compliance-trestle) | IBM | A python SDK and command line tool which manipulates OSCAL structures and supports transformation of data into OSCAL. | open source |
| [OSCAL Java Library](https://github.com/usnistgov/liboscal-java) | NIST OSCAL Project | A Java-based programming API for reading and writing content conformant to the OSCAL XML, JSON, and YAML based models. | open source |
| [OSCAL React Component Library](https://github.com/EasyDynamics/oscal-react-library) | Easy Dynamics | A library of reusable React components and an [example user interface application](https://oscal-viewer.msd.easydynamics.com/catalog) that provides a direct UI into OSCAL. | open source |
| [OSCAL REST API](https://github.com/EasyDynamics/oscal-rest) |  Easy Dynamics | An initial OpenAPI definition of an OSCAL REST API that describes how systems might manipulate catalogs, profiles, components, and SSPs. | open source |
| [XSLT Tooling](https://github.com/usnistgov/oscal-tools/tree/master/xslt) | NIST OSCAL Project | A variety of Extensible Stylesheet Language (XSL) Transformations (XSLT), Cascading Style Sheets (CSS), and related utilities for authoring, converting, and publishing OSCAL content in various forms. | open source |
| [XML Jelly Sandwich](https://github.com/wendellpiez/XMLjellysandwich) | Wendell Piez (NIST) | Interactive XSLT in the browser includes [OSCAL demonstrations](https://wendellpiez.github.io/XMLjellysandwich/oscal/). | open source |
| [Xacta 360](https://www.telos.com/offerings/xacta-360-continuous-compliance-assessment/) | Telos | Xacta 360 is a cyber risk management and compliance analytics platform that enables users to create and submit FedRAMP system security plans (SSPs) in OSCAL format. Future OSCAL capabilities are forthcoming as the standard evolves. | [license](https://cdn.telos.com/wp-content/uploads/2021/06/22150746/Xacta-360-EULA-US.pdf) |
| [Atlasity: Continuous Compliance Automation](https://atlasity.io/partnership/) | C2 Labs | Atlasity CE (release 2.0) runs in any environment and supports the development of OSCAL v1.0 content for Catalogs, Profiles, System Security Plans and Components. Additional detail can be found in this blog post: [Atlasity Delivers Free Tools to Create OSCAL Content](https://www.c2labs.com/post/atlasity-delivers-free-tools-to-create-oscal-content). | community edition |
| [control_freak](https://controlfreak.risk-redux.io/) | Risk Redux | This tool seeks to provide folks with a searchable and easy-to-navigate reference for NIST SP 800-53 Revision 5. It is [an open-source application from the Risk Redux project](https://github.com/risk-redux/control_freak), built using parsed content directly from the OSCAL repositories. | open-source |
| [DRT Confidence](https://www.drtstrategies.com/drt-confidence-fedramp/) | DRT Strategies Inc. | DRTConfidence is a next generation Governance, Risk and Compliance (GRC) solution to help organizations transition to OSCAL and continuous compliance. DRTConfidence is available in FedRAMP High environments and supports all OSCAL artifacts: Catalogs, Profiles, System Security Plans, Security Assessment Plans, Security Assessment Reports, POAMs and conforms to the OSCAL v1.0.0 specification and its schemas. Additional information can be found at [DRT Confidence for FedRAMP](https://www.drtstrategies.com/drt-confidence-fedramp/). | Commercial License |
