---
title: SP800-53 Control Example
heading: "NIST SP 800-53 rev 5 Annotated Example"
weight: 30
sidenav:
  title: SP800-53 Control Example
toc:
  enabled: true
---


{{<callout>}}**Please note:**

- The following commentary uses and shows XML syntax. A later revision will offer JSON and YAML translations.
- Full versions of the NIST SP 800-53 Rev. 5 catalog are available in OSCAL [XML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_catalog.xml), [JSON]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev5/json/NIST_SP-800-53_rev5_catalog.json), and [YAML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev5/yaml/NIST_SP-800-53_rev5_catalog.yaml) formats in the OSCAL content GitHub repository. These examples also include assessment and objective content from NIST SP 800-53A Rev. 5, *not shown here*.
{{</callout>}}

The following is a non-normative, partial illustration showing how control **AC-1** from NIST SP [800-53 Rev. 5](https://doi.org/10.6028/NIST.SP.800-53r5) can be rendered in OSCAL Catalog XML format with a `<control>` element.

First we start with the following control text from SP 800-53. (Formatting adjusted for conciseness and legibility.)

> **AC-1 POLICY AND PROCEDURES**
>
> __Control__:
>
> a. Develop, document, and disseminate to [Assignment: organization-defined personnel or roles]:
>   1. *[Selection (one or more): Organization-level; Mission/business process-level; System-level]* access control policy that:
>     (a) Addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
>     (b) Is consistent with applicable laws, executive orders, directives, regulations, policies, standards, and guidelines; and
>   2. Procedures to facilitate the implementation of the access control policy and the associated access controls;
>
> b. Designate an *[Assignment: organization-defined official]* to manage the development, documentation, and dissemination of the access control policy and procedures; and
>
> c. Review and update the current access control:
>   1. Policy *[Assignment: organization-defined frequency]* and following *[Assignment: organization-defined events]*; and
>   2. Procedures *[Assignment: organization-defined frequency]* and following *[Assignment: organization-defined events]*.
>
> __Discussion__: Access control policy and procedures address the controls in the AC family that are implemented within systems and organizations. The risk management strategy is an important factor in establishing such policies and procedures. Policies and procedures contribute to security and privacy assurance. Therefore, it is important that security and privacy programs collaborate on the development of access control policy and procedures. Security and privacy program policies and procedures at the organization level are preferable, in general, and may obviate the need for mission- or system-specific policies and procedures. The policy can be included as part of the general security and privacy policy or be represented by multiple policies reflecting the complex nature of organizations. Procedures can be established for security and privacy programs, for mission or business processes, and for systems, if needed. Procedures describe how the policies or controls are implemented and can be directed at the individual or role that is the object of the procedure. Procedures can be documented in system security and privacy plans or in one or more separate documents. Events that may precipitate an update to access control policy and procedures include assessment or audit findings, security incidents or breaches, or changes in laws, executive orders, directives, regulations, policies, standards, and guidelines. Simply restating controls does not constitute an organizational policy or procedure.
>
> __Related Controls__: IA-1, PM-9, PM-24, PS-8, SI-12.
>
> __Control Enhancements__: None.
>
> __References__: [OMB A-130], [SP 800-12], [SP 800-30], [SP 800-39], [SP 800-100], [IR 7874].

Encoding this text in OSCAL entails an analysis that turns it "inside out" and exposes the implicit structures (the "bones") as a kind of exoskeleton around the text, using a common and non-proprietary data encoding standard such as XML or JSON to provide the "form" of the cast. Within this organization, all these data points become distinguishable and recognizable to any downstream processor (consumer or partner) who expects OSCAL, or who can interpret it, defining OSCAL both narrowly, in its technical senses, and broadly: as a standard, a set of norms and conventions, a collection of tools, applications and resources, and a community of practice. From the encoded data, the text's "original format" (or something like it) can be restored, but much else can be done as well: the semantics of the information (the set of meaningful discriminations) can be mined, sifted, collated, ranked, annotated, and related to other data points internal or external.

Since OSCAL is designed purposefully to represent such data sets (in a specific semantic domain, namely the [NIST Risk Management Framework](https://csrc.nist.gov/publications/detail/sp/800-37/rev-2/final) or RMF), the casting of this information into OSCAL encoding can be straightforward, economical and clean.

## Control, ID and title

This control has a number of high-level data elements, including a security control identifier ("AC-1"), a title ("POLICY AND PROCEDURES"), the control (text) itself, supplemental guidance, control enhancements (although not in this example), and references.

See the source code as currently available in [raw XML from Github](https://raw.githubusercontent.com/usnistgov/oscal-content/main/nist.gov/SP800-53/rev5/xml/NIST_SP-800-53_rev5_catalog.xml). The control is identified in code with tagging that looks *mainly* as follows, with slight simplifactions. Control AC-1 starts:

{{<highlight xml "nowrap=false" >}}
<control class="SP800-53" id="ac-1">
    <title>Policy and Procedures</title>
{{< / highlight >}}

- The control is assigned a class, "SP800-53". This serves as an indicator to a downstream processor of the control's origin (with respect to the catalog or catalog type), with implications for related expectations, including expectations in detail regarding how the control and its contents may be structured.
- The control ID is "ac-1". All `id` values are unique within the document and serve for addressing and linking. The lexical form of the `id` is designed to be consistent with its formal (conventional) code or label, which is *also* encoded within the control (in this case, "AC-1"). While such regularities are normal and to be expected, this one is a feature of this data set, not a requirement of OSCAL generally.
- The `<title>` of the control captures the text of the control's title as given in display and navigation. Unlike `id` values, titles are not required to be unique, and indeed in this catalog, each family of controls is headed by a control entitled "Policy and Procedures". In an application, the control title can be adjusted for display in any way needed - for example, prepended with the name of the family as **Access Control - Policy and Procedures", or converted into all upper case.

## Parameters

The control continues with `<param>` elements. This is the first place where the electronic file definitively and explicitly captures information about the source data that is left implicit in in its published form (that is, as a document). In this case, the information captured regards options for control configuration (by users of the catalog) in detail, which will subsequently be reflected in the control text as rendered, but which are called out here as first-class objects so that OSCAL consumers can handle them in appropriate ways.

A *parameter* in OSCAL (tagged as `<param>` in XML or, in JSON or YAML, as an object member of a `parameters` array) corresponds to and supports the construct called *controlled parameter value* (CPV) in NIST SP 800-53A, while not being limited exclusively to that use.

*Note*: In this data, they appear with the controls in which they are used, but in OSCAL data, parameters may also be defined elsewhere, including at the group level or across a catalog, thus facilitating their consolidation and reuse.

*Note also*: for succinctness, the code sampled here shows only the first four of the parameters defined for AC-1 in the document (version) it was derived from.

{{<highlight xml "nowrap=false" >}}
<param id="ac-1_prm_1">
    <prop name="aggregates" ns="http://csrc.nist.gov/ns/rmf"
        value="ac-01_odp.01"/>
    <prop name="aggregates" ns="http://csrc.nist.gov/ns/rmf"
        value="ac-01_odp.02"/>
    <label>organization-defined personnel or roles</label>
</param>
<param id="ac-01_odp.01">
    <prop name="label" class="sp800-53a" value="AC-01_ODP[01]"/>
    <label>personnel or roles</label>
    <guideline>
        <p>personnel or roles to whom the access control policy is to be
        disseminated is/are defined;</p>
    </guideline>
</param>
<param id="ac-01_odp.02">
    <prop name="label" class="sp800-53a" value="AC-01_ODP[02]"/>
    <label>personnel or roles</label>
    <guideline>
        <p>personnel or roles to whom the access control procedures are
        to be disseminated is/are defined;</p>
    </guideline>
</param>
<param id="ac-01_odp.03">
    <prop name="alt-identifier" value="ac-1_prm_2"/>
    <prop name="label" class="sp800-53a" value="AC-01_ODP[03]"/>
    <select how-many="one-or-more">
        <choice>organization-level</choice>
        <choice>mission/business process-level</choice>
        <choice>system-level</choice>
    </select>
</param>
[... params ac-01_odp.04 through ac-01_odp.08 ...]
{{< / highlight >}}

`<param>` elements define parameter values for the control that permit (and may require) setting in context. Typically, a catalog will expose parameters where profiling applications are expected either to define appropriate values themselves (that is, values appropriate to a baseline) or to permit setting at higher levels of implementation (such as system plans implementing a baseline). These values are available for reference (and even display) in the language of the control as presented, using corresponding `<insert>` elements, as described in detail below.

OSCAL parameters are worth special coverage as a topic in themselves. As shown here, they can and commonly do have internal structure and properties of their own, sometimes specific to a particular application, requirement or use case. For example, in this data set, `<prop>` elements are given to provide extra information -- `alt-identifier` values -- helping assure parameters' correspondences across versions of SP 800-53. Consumers of OSCAL content can determine where and how such information is useful to them, and ignore or discard it when it constitutes noise.

## Properties

After all parameters are defined, a control may be provided with a set of `<prop>` elements, each one of which specifies a single *property*, representing a name-value pair, in OSCAL. The particular meaning of each property is subject to definition by its originator (who defines the name, namespace and intended use), as interpreted by recipients in their own operational (semantic) context -- and is therefore subject to *negotiation*, *contracting*, and ultimately to *standardization* (external specification by third parties). Industry-standard names and value spaces for common properties -- along with technological platforms for validating them -- are being defined to help OSCAL developers and consumers leverage their common work, while also exploring and describing the problem space.

{{<highlight xml "nowrap=false" >}}
<prop name="label" value="AC-1"/>
<prop name="label" class="sp800-53a" value="AC-01"/>
<prop name="sort-id" value="ac-01"/>
{{< / highlight >}}

In this representation of AC-1, three properties are given by the data publisher. Each of these properties may be fairly considered to be a "convenience value": for example, two properties provides data consumers with reliable values for a control label "as published" in different renditions of the catalog. An extra identifier is also provided for sorting. As shown here, `<prop>` elements can also be qualified by `class` to offer further distinctions from neighbor properties.

In OSCAL, the values of properties must be atomic values, such as strings, numbers or dates, without Markdown (for example) or other kinds of formatting. To extend properties to provide for values with more complex object types represents a challenge to be met, because any representation of data at this level must be in a form as widely accessible as possible across the greatest range of consumers (languages, platforms, serialization formats, and information modeling and programming technologies and paradigms). To mitigate this limitation, where simple qualification by assigning name/value pairs is not enough, controls (and other structures) in OSCAL can also be extended using other generic elements such as `<link>` and `<part>`.

## Links

Following any property sequence come any links proper to this control. Consistently with modern practice, only outbound links are encoded explicitly.

Like parameters and properties, `<link>` elements provide for explicit representation of data given implicitly in published sources. Here, this information is represented by the __Related Controls__ and __References__ sections of the control text. In each case, targets of the links form distinct classes of their own -- they are either cross-referenced controls or enhancements (also `<control>` elements in OSCAL), or references to bibliographic entries listed as back matter. These are distinguished by `rel` values permitting each to be resolved and handled correctly.

On links, `href` follows the semantics of `href` as defined for HTML/HTTP by W3C. `rel` is constrained as an enumerated value by OSCAL.

{{<highlight xml "nowrap=false" >}}
<link rel="reference" href="#27847491-5ce1-4f6a-a1e4-9e483782f0ef"/>
<link rel="reference" href="#c7ac44e8-10db-4b64-b2b9-9e32ec1efed0"/>
<link rel="reference" href="#08b07465-dbdc-48d6-8a0b-37279602ac16"/>
<link rel="reference" href="#cec037f3-8aba-4c97-84b4-4082f9e515d2"/>
<link rel="reference" href="#4c0ec2ee-a0d6-428a-9043-4504bc3ade6f"/>
<link rel="reference" href="#7f473f21-fdbf-4a6c-81a1-0ab95919609d"/>
<link rel="related" href="#ia-1"/>
<link rel="related" href="#pm-9"/>
<link rel="related" href="#pm-24"/>
<link rel="related" href="#ps-8"/>
<link rel="related" href="#si-12"/>
{{< / highlight >}}

No rule in OSCAL prevents a link from targeting any resource or target whatsoever; but catalog authors can be expected to manage their links according to regimes appropriate to their catalogs. In the case of SP 800-53, internal links (from one control to another) are represented as __Related Controls__ in the formatted source. These are easily indicated via `href` fragment identifiers - `#ia-1` referencing the entity with `id` value `ia-1`, which of course happens to be control IA-1.

*References*, however (in contrast to related controls),  function as bibliographic citations, using a code for each reference given in the PDF source. In the OSCAL, the bibliographic items are collected and encoded in the catalog back matter (`<back-matter>`) as `<resource>` elements.

So for example, in its back matter the catalog XML for SP 800-53 may have something like:

{{<highlight xml "nowrap=false" >}}
<resource uuid="27847491-5ce1-4f6a-a1e4-9e483782f0ef">
  <title>OMB A-130</title>
  <citation>
    <text>Office of Management and Budget Memorandum Circular A-130,
    <em>Managing Information as a Strategic Resource</em> , July 2016.</text>
  </citation>
</resource>
{{< / highlight >}}

(*Note*: in the actual data, this resource is also provided with a link, not shown here.)

The `uuid` value on this `<resource>` serves as its ID for internal links targeting this element. Incidentally, a survey of the catalog source data in this case also shows this particular reference is made from 96 different controls.

Note that here, the code phrase used in the source to identify the bibliographic item (such as "OMB A-130") is regarded as a presentational artifact, not as a control point or formal identifier. This allows both freedom and fidelity to anomalous (and potentially conflicting) data sources, while providing for the linkage itself to be robust, expressed by means of a UUID. In rendition or display, any link to this resource can retrieve and show a title, citation text or outbound link as needed, where they are available.

## Parts

After the links come the constituent pieces or `parts` of the control, as `<part>` elements (in JSON or YAML, members of a `parts` array), representing the main text, subordinate text and any subordinate parts or associated information (aside from control enhancements, which are considered controls in themselves, as described below).

Like properties (`<prop>` elements) parts can be distinguished for semantic purposes by their names. Sets of names for known part types can be formalized at the level of either OSCAL or its application(s), or left informal for consumers and interchange partners to detect and respect as appropriate. Like parameters and controls, parts may also have properties and links of their own. In this data, `<prop>` elements are also used at the part level (that is, directly within `<part>`) to capture information sometimes relevant (to the part's rendition, to document and establish fidelity to upstream sources where it appears, or for other reasons). This can also be seen in other examples not shown here, such as the parts given in OSCAL SP 800-53 to describe control assessment objectives, methods and processes.

`statement` is the name assigned to parts that capture the normative text of the control itself. In SP 800-53, some statement parts (control text) appear articulated into grouped and enumerated line items (such as here in AC-1); in others, a simple paragraph or paragraph sequence is given.

Where line items are indicated in the source, the OSCAL also reflects this, showing their logical grouping along with their sequence. Such a hierarchical nesting of `item` parts inside the statement permits capturing and "shredding" the text such that any item at any level can be addressed as a unit, with its subordinate items.

{{<highlight xml "nowrap=false" >}}
<part name="statement" id="ac-1_smt">
  <part name="item" id="ac-1_smt.a">
    <prop name="label" value="a."/>
    <p>Develop, document, and disseminate to <insert type="param"
      id-ref="ac-1_prm_1"/>:</p>
    <part name="item" id="ac-1_smt.a.1">
      <prop name="label" value="1."/>
      <p><insert type="param" id-ref="ac-01_odp.03"/> access control
       policy that:</p>
      <part name="item" id="ac-1_smt.a.1.a">
        <prop name="label" value="(a)"/>
        <p>Addresses purpose, scope, roles, responsibilities, management
        commitment, coordination among organizational entities, and
        compliance; and</p>
      </part>
      <part name="item" id="ac-1_smt.a.1.b">
        <prop name="label" value="(b)"/>
        <p>Is consistent with applicable laws, executive orders,
        directives, regulations, policies, standards, and guidelines;
        and</p>
      </part>
    </part>
    <part name="item" id="ac-1_smt.a.2">
      <prop name="label" value="2."/>
      <p>Procedures to facilitate the implementation of the access control
      policy and the associated access controls;</p>
    </part>
  </part>
  <part name="item" id="ac-1_smt.b">
    <prop name="label" value="b."/>
    <p>Designate an <insert type="param" id-ref="ac-01_odp.04"/> to
    manage the development, documentation, and dissemination of the
    access control policy and procedures; and</p>
  </part>
  <part name="item" id="ac-1_smt.c">
    <prop name="label" value="c."/>
    <p>Review and update the current access control:</p>
    <part name="item" id="ac-1_smt.c.1">
      <prop name="label" value="1."/>
      <p>Policy <insert type="param" id-ref="ac-01_odp.05"/> and
      following <insert type="param" id-ref="ac-01_odp.06"/>; and</p>
    </part>
    <part name="item" id="ac-1_smt.c.2">
      <prop name="label" value="2."/>
      <p>Procedures <insert type="param" id-ref="ac-01_odp.07"/> and
      following <insert type="param" id-ref="ac-01_odp.08"/>.</p>
    </part>
  </part>
</part>
{{< / highlight >}}

Particularly noteworthy within `part` contents are data `<insert>` points. These represent points given in the text, where configured parameter values are to be expanded. Each insert indicates the parameter to which it refers via its `id-ref` -- in other words, somewhere in the document, probably close by (in the same control) will be a `<param>` element, to which reference is being made for the purpose of declaring a dynamic (value or label) insertion, which carries the `id-ref` value on the `insert` as its `id`.

Relatively unstructured text can also be straightforwardly encoded as `<part>` elements, whose contents can include paragraphs and list items as well as their own `<part>` subdivisions. SP 800-53 controls usually have an additional `guidance` section in addition to their statements. Similarly, assessment methods and objectives for each control, as detailed by SP 800-53A **Assessment Procedures**, are encoded in this data as `<part>` elements (not shown).

In the example following, it is worth nothing how part name given, `guidance`, is inconsistent with the way the document is formatted for reading, where for these sections, the PDF shows the title **Discussion**. The name `guidance` here was retained from an earlier version of this data, for purposes of backward compatibility. Where necessary, a processor reading this data and displaying it on the screen can make appropriate adjustments.

{{<highlight xml "nowrap=false" >}}
  <part name="guidance" id="ac-1_gdn">
    <p>Access control policy and procedures address the controls in
    the AC family that are implemented within systems and organizations.
    The risk management strategy is an important factor in establishing
    such policies and procedures. Policies and procedures contribute to
    security and privacy assurance. Therefore, it is important that
    security and privacy programs collaborate on the development of access
    control policy and procedures. Security and privacy program policies
    and procedures at the organization level are preferable, in general,
    and may obviate the need for mission- or system-specific policies and
    procedures. The policy can be included as part of the general security
    and privacy policy or be represented by multiple policies reflecting
    the complex nature of organizations. Procedures can be established for
    security and privacy programs, for mission or business processes, and
    for systems, if needed. Procedures describe how the policies or
    controls are implemented and can be directed at the individual or role
    that is the object of the procedure. Procedures can be documented in
    system security and privacy plans or in one or more separate documents.
    Events that may precipitate an update to access control policy and
    procedures include assessment or audit findings, security incidents
    or breaches, or changes in laws, executive orders, directives,
    regulations, policies, standards, and guidelines. Simply restating
    controls does not constitute an organizational policy or procedure.</p>
  </part>
</control>
{{< / highlight >}}

Note that this code sample ends with the XML closing tag `</control>` for the element, indicating its end. Had this control any enhancements (subcontrols), they would appear here.

## Control enhancements

SP 800-53, for many controls, also describes *enhancements*, which also take the form of controls, whose content serves to restate or recapitulate a control, in part or entirely, potentially as it applies within a particular scope or problem domain. For example if "keep track of the keys" is considered as (part of) a control for physical security ("keep the doors locked" etc.), then "share keys only with authorized personnel" might be an enhancement to that control -- a further refinement of the control, available for use when appropriate. Or a real example: **Update Vulnerabilities To Be Scanned** (RA 5-2) is defined as an enhancement of **Vulnerability Monitoring and Scanning** (RA-5). (As this example illustrates, enhancements are not always just "something extra".)

OSCAL is neutral and agnostic as to whether and what kind of dependency is to be taken as expressed or warranted between controls and their subcontrols, as modeled: it is merely a feature available for use (and an alternative to linking and labeling) by catalog authors, which also reflects the SP 800-53 "two-layered" architecture (while also being extensible to three or more layers). With respect to this aspect of the information modeling, OSCAL tries to stay out of the way, letting the data speak for itself.

As encoded using nested control structures, this organization has the virtue of providing a straightforward "literal" presentation of a control with its enhancements -- both when (re)formatted for reading or reference, and for tools consuming encoded data -- while permitting catalog authors a combination of flexibility and transparency. Another good example of a control with enhancements in SP 800-53 is **AC-2 Account Management**, with enhancements such as **AC-2(1) Automated System Account Management** and **AC 2(5) Inactivity Logout**. Enhancements will ordinarily have their own titles, statements, properties, parameters and links.

{{<todo>}}
## ISO/IEC 27002:2013

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

## Comparing the ISO 27002 and NIST SP 800-53 Examples

Comparing the ISO 27002 and NIST SP 800-53 examples illustrates obvious differences. NIST SP 800-53 includes several components, such as references and control enhancements that ISO 27002 does not. NIST SP 800-53's statement of the control itself is also much more detailed and specific than ISO 27002 because it provides those details in its implementation guidance instead of the control text. There are other differences in terminology as well, such as NIST SP 800-53 using the term "supplemental guidance" for roughly what ISO 27002 calls "other information".

To address these differences, OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using the catalog model. The OSCAL catalog model defines structured, machine-readable XML, JSON, and YAML representations of the information contained within a control. A control defined using the OSCAL catalog model supports including control statements, guidance, assessment objectives, and many other features. By combining all of this information in a single model, the OSCAL catalog model simplifies the entire control-based operational model.

{{</todo>}}

## Related Tutorials

The following tutorial is provided related to the catalog model.

- [Creating a Control Catalog](/learn/tutorials/catalog/): Covers overs creating a basic OSCAL control catalog.
