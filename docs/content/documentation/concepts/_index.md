---
title: Concepts Used in OSCAL
heading: Concepts Used in OSCAL
description: Reviews the control- and assessment-related concepts used within OSCAL.
weight: 10
sidenav:
    title: Concepts Used in OSCAL
    toc:
        headingselectors: h2,h3,h4,h5
        collapsedepth: 4
aliases:
 - /learnmore/concepts/
 - /learnmore/concepts/control/
 - /learnmore/concepts/catalog/
 - /learnmore/concepts/profile/
---

This page reviews the many concepts used in OSCAL, and is organized by the corresponding OSCAL layer where a given concept is first introduced.

The concepts used in OSCAL are organized below into the following groups:

- **Control Definition:** Provides for the shared definition of control information that can be used by multiple organizations when documenting control implementations and performing assessments.
- **Implementation:** Used to express the security and privacy implementation of system or a software, hardware, or service offering.
- **Assessment:** Supports the assessment of controls by humans and through automated mechanisms.

## Control Definition

A variety of organizations define a set of security and privacy requirements, which are represented as [controls](#control), which are grouped together as a control [catalog](#catalog). These catalogs are then used by other organizations to establish security and privacy control [baselines](#baseline) through a process that may aggregate and tailor controls from multiple source catalogs.

### Control

Many privacy and security compliance programs are based on or make use of **controls**. Framework authors provide control requirements, system owners implement the controls, and assessors validate the implemented control against the requirement. 

In OSCAL, a control is *a requirement or guideline, which when implemented will reduce an aspect of risk related to an information system and its information.*

{{% callout %}}
A **security control** is defined in NIST Special Publication (SP) [SP 800-53 revision 5 (draft)](https://doi.org/10.6028/NIST.SP.800-53r5-draft) and the Office of Management and Budget Memorandum Circular [A-130](https://www.whitehouse.gov/sites/whitehouse.gov/files/omb/circulars/A130/a130revised.pdf), *Managing Information as a Strategic Resource*, as:

> The safeguards or countermeasures prescribed for an information system or an organization to protect the confidentiality, integrity, and availability of the system and its information.

These documents also define a **privacy control** as:

> The administrative, technical, and physical safeguards employed within an agency to ensure compliance with applicable privacy requirements and manage privacy risks.

These definitions align well to the control concept in OSCAL.
{{% /callout %}}

Controls are represented in OSCAL as part of the [catalog model](../schema/catalog-layer/catalog/).

{{<todo>}}

#### Control Objective

TODO

#### Parameter

TODO

#### Guidance

TODO

#### Assessment Method

TODO

Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others, like 800-53A, have it separately.

#### References

TODO

{{</todo>}}

#### Examples of Controls and Catalogs

Each control has an associated definition, which defines what aspect of the information system and its information the control addresses. Definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as:

> The organization has an access control policy and procedures.

However, most controls are considerably more involved.

OSCAL has been built for applications of controls that relate to privacy or security safeguards or countermeasures, such as in the two following examples.

TODO: Point to the model documentation to link to the explanation of how a control is represented conceptually in OSCAL.


##### SP 800-53 Revision 4

The following control example is AC-1 from NIST [SP 800-53 Revision 4](https://doi.org/10.6028/NIST.SP.800-53r4):

> **AC-1  ACCESS CONTROL POLICY AND PROCEDURES**
>
> __Control:__ The organization:
> 
> a. Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
>   1. An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
>   2. Procedures to facilitate the implementation of the access control policy and associated access controls; and
>
> b. Reviews and updates the current:
>   1. Access control policy [Assignment: organization-defined frequency]; and
>   2. Access control procedures [Assignment: organization-defined frequency].
>
> __Supplemental Guidance:__  This control addresses the establishment of policy and procedures for the effective implementation of selected security controls and control enhancements in the AC family. Policy and procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards, and guidance. Security program policies and procedures at the organization level may make the need for system-specific policies and procedures unnecessary. The policy can be included as part of the general information security policy for organizations or conversely, can be represented by multiple policies reflecting the complex nature of certain organizations. The procedures can be established for the security program in general and for particular information systems, if needed. The organizational risk management strategy is a key factor in establishing policy and procedures.
> 
> __Related control:__ PM-9.
> 
> __Control Enhancements:__  None.
> 
> __References:__  NIST Special Publications 800-12, 800-100.

This control has a number of high-level components, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, and references. In contrast, the next control is from ISO 27002 on access control policy. It is also detailed in a different way, with an identifier ("9.1.1"), a title ("Access control policy"), control text, lengthy implementation guidance, and other information (additional advice on access control policy).

##### ISO/IEC 27002:2013

The following example is from [ISO/IEC 27002:2013](https://www.iso.org/standard/54533.html):

<blockquote>
    <p><strong>9.1.1 Access control policy</strong></p>
    <p><strong>Control</strong></p>
    <p>An access control policy should be established, documented and reviewed based on business and information security requirements.</p>
    <p><strong>Implementation guidance</strong></p>
    <p>Asset owners should determine appropriate access control rules, access rights and restrictions for specific user roles towards their assets, with the amount of detail and the strictness of the controls reflecting the associated information security risks.</p>
    <p>Access controls are both logical and physical and these should be considered together.</p>
    <p>Users and service providers should be given a clear statement of the business requirements to be met by access controls.
    <p>The policy should take account of the following:
        <ol type="a">
            <li>security requirements of business applications;</li>
            <li>policies for information dissemination and authorization, e.g. the need-to-know principle and information security levels and classification of information;</li>
            <li>consistency between the access rights and information classification policies of systems and networks;</li>
            <li>relevant legislation and any contractual obligations regarding limitation of access to data or services;</li>
            <li>management of access rights in a distributed and networked environment which recognizes all types of connections available;</li>
            <li>segregation of access control roles, e.g. access request, access authorization, access administration;</li>
            <li>requirements for formal authorization of access requests;</li>
            <li>requirements for periodic review of access rights;</li>
            <li>removal of access rights;</li>
            <li>archiving of records of all significant events concerning the use and management of user identities and secret authentication information;</li>
            <li>roles with privileged access.</li>
        </ol>
    </p>
    <p><strong>Other information</strong></p>
    <p>Care should be taken when specifying access control rules to consider:
        <ol type="a">
            <li>establishing rules based on the premise "Everything is generally forbidden unless expressly permitted" rather than the weaker rule "Everything is generally permitted unless expressly forbidden";</li>
            <li>changes in information labels that are initiated automatically by information processing facilities and those initiated at the discretion of a user;</li>
            <li>changes in user permissions that are initiated automatically by the information system and those initiated by an administrator;</li>
            <li>rules which require specific approval before enactment and those which do not.</li>
        </ol>
    </p>
    <p>Access control rules should be supported by formal procedures and defined responsibilities.</p>
    <p>Role based access control is an approach used successfully by many organizations to link access rights with business roles.</p>
    <p>Two of the frequent principles directing the access control policy are:
        <ol type="a">
            <li>Need-to-know: you are only granted access to the information you need to perform your tasks (different tasks/roles mean different need-to-know and hence different access profile);</li>
            <li>Need-to-use: you are only granted access to the information processing facilities (IT equipment, applications, procedures, rooms) you need to perform your task/job/role.</li>
        </ol>
    </p>
</blockquote>

**NOTE:** Some of the reference links have been removed in the above examples as compared to the original source. This was done to simplify the text for illustration.

Comparing the ISO 27002 and NIST SP 800-53 examples illustrates obvious differences. NIST SP 800-53 includes several components, such as references and control enhancements that ISO 27002 does not. NIST SP 800-53's statement of the control itself is also much more detailed and specific than ISO 27002 because it provides those details in its implementation guidance instead of the control text. There are other differences in terminology as well, such as NIST SP 800-53 using the term "supplemental guidance" for roughly what ISO 27002 calls "other information".

To address these differences, OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using the [catalog model](../schema/catalog-layer/catalog/). The OSCAL catalog model defines structured, machine-readable XML, JSON, and YAML representations of the information contained within a control. A control defined using the OSCAL catalog model supports including control statements, guidance, assessment objectives, and many other features. By combining all of this information in a single model, the OSCAL catalog model simplifies the entire control-based operational model.


### Catalog

Framework providers organize control requirements into a **catalog**.
The OSCAL [catalog model](../schema/catalog-layer/catalog/) is designed to represent control requirement information and its catalog organization in a machine-readable format with a high degree of fidelity and granularity.

An OSCAL catalog allows control requirements to be grouped, and allows individual control requirements to contain subordinate control requirements (enhancements), control objectives, assessment methods, references, and other content as may be necessary in some frameworks. 

In OSCAL a control catalog is *an organized collection of controls*.

Typically, catalogs are represented in human readable documentary form, in which controls are represented as parts of a catalog document. Controls, as defined and described in catalogs, may also be referenced and configured in other documents; thus control information must be composed in a way to make it possible to use control information across different types of documents for different purposes, while maintaining a consistent control "identity" and referential integrity for traceability.

Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others, like 800-53A, have it separately.

### Baseline

A baseline, or overlay in other terminology, defines a specific set of selected security control requirements from one or more control catalogs for use in managing risks in an information system. The OSCAL [profile model](../schema/profile-layer/profile/) provides a structured, machine-readable representation of a baseline.

{{<callout>}}NIST Special Publication (SP) [800-37 Revision 2](https://csrc.nist.gov/publications/detail/sp/800-37/rev-2/final) defines a baseline as "the set of controls that are applicable to information or an information system to meet legal, regulatory, or policy requirements, as well as address protection needs for the purpose of managing risk."{{</callout>}}

Using the OSCAL profile model to express a baselines makes the mappings between the control catalog and the profile explicit and machine readable. A single OSCAL profile can reference controls in multiple catalogs. OSCAL permits profiles to use the same interoperable format irrespective of which catalogs are being used.

The figure below uses the NIST SP 800-53 low baseline as an example to sketch how a baseline relates to a catalog. The low baseline indicates which controls from the NIST SP 800-53 catalog are required for compliance with this baseline.

![profile-catalog-mapping](profile-catalog-mapping-trivial-example.png)

{{<todo>}}

## Implementation

TODO

## Assessment

TODO

{{</todo>}}
