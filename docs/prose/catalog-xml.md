---
title: OSCAL Controls and Catalogs

language_tabs: # must be one of https://git.io/vQNgJ
  - xml
  - json

toc_footers:
  - <a href='#'>GitHub Repo</a>
  - <a href='#'>NIST.gov</a>

includes:

search: true
---
# XML Representation of OSCAL Catalogs
TBD: add intro

## The &lt;catalog> element
Each OSCAL catalog is defined by a &lt;catalog> element. A &lt;catalog> element may contain the following:
* &lt;title> for the catalog (mandatory)
* [&lt;declarations>](https://github.com/usnistgov/OSCAL/blob/docs/docs/prose/catalog-xml.md#the-declarations-element) (zero or more)
* [&lt;section>](https://github.com/usnistgov/OSCAL/blob/docs/docs/prose/catalog-xml.md#the-section-element), [&lt;group>](https://github.com/usnistgov/OSCAL/blob/docs/docs/prose/catalog-xml.md#the-group-element), and/or [&lt;control>](https://github.com/usnistgov/OSCAL/blob/docs/docs/prose/catalog-xml.md#control-element) definitions (zero or more of each)
* [&lt;references>](https://github.com/usnistgov/OSCAL/blob/docs/docs/prose/catalog-xml.md#the-references-element) (zero or more)

### The &lt;section> element
Catalogs may use &lt;section> elements for catalog partitioning. A &lt;section> element may contain the following:
* &lt;title> (mandatory)
* &lt;prose> (mandatory)
* &lt;section> or &lt;group> (zero or more of each)
* &lt;references> (zero or more)
* @id
* &lt;optionalClass>

### The &lt;group> element
Catalogs may use &lt;group> elements to reference related controls or control groups. &lt;group> elements may be titled and have their own properties, statements, parameters, references, etc., which are inherited by all members of the group.

A &lt;group> element may contain the following:
* &lt;title> (optional)
* &lt;control-components> (mandatory)
* &lt;group> or &lt;control> (one or more total)
* &lt;references> (zero or more)
* @id
* &lt;optionalClass>

### &lt;control-components> element
A &lt;control-components> element may contain the following:
* &lt;prop>, &lt;anyKindofPart>, &lt;link>, and/or &lt;param> elements (zero or more of each)

### &lt;framework> and &lt;worksheet> elements
TBD: figure out where this slots in

The *&lt;framework> element* is used to define a formal framework. OSCAL also offers the *&lt;worksheet> element*, which is used to define an informal, ad hoc framework. The expectation is that the &lt;framework> element will be used when a standards organization or other formal body wants to define a published framework, while the &lt;worksheet> element will be used by organizations creating frameworks for their own use.

Both &lt;framework> and &lt;worksheet> elements may contain the following:
* &lt;title>
* &lt;declarations> (zero or more)
* &lt;section>, &lt;category>, and/or &lt;component> definitions (zero or more of each)
* &lt;references> (zero or more)
* @id
* &lt;optionalClass>

#### &lt;category> element
A &lt;category> element specifies a group of related controls or a group of groups of such controls. A &lt;category> element may contain the following:
* &lt;title> (optional)
* &lt;prop>, &lt;link>, and/or &lt;prose> elements (zero or more of each)
* &lt;category> or &lt;component> elements (one or more total) 
* @id
* &lt;optionalClass>

#### &lt;component> element
A &lt;framework> element or &lt;worksheet> element may contain *&lt;component>* elements. A component references one or more controls. This provides a way to organize the contents of a framework. A &lt;component> element may contain the following:
* &lt;title> (optional)
* &lt;param>, &lt;prop>, &lt;link>, &lt;prose>, and/or &lt;part> elements (zero or more of each)
* &lt;component> elements (zero or more) 
* @id
* &lt;optionalClass>

##### &lt;link> element
A &lt;link> element is a line or paragraph with a hypertext link. A &lt;link> element may contain the following:
* &lt;mix> (mandatory)
* @relAttr and @hrefAttr attributes

##### &lt;param> element
A &lt;param> element is a parameter setting to be propagated to points of insertion. A &lt;param> element may contain the following:
* &lt;desc> (mandatory)
* &lt;value> (mandatory)
* @id
* &lt;optionalClass>

##### &lt;part> element
A &lt;part> element is a partition, piece, or section of a control, subcontrol, component, or part. A &lt;part> element may contain the following:
* &lt;title> (optional)
* &lt;prose> and/or &lt;control-components> elements (zero or more of each)
* @id
* &lt;optionalClass>

##### &lt;prop> element
A &lt;prop> element is a value with a name. It is attributed to the containing control, subcontrol, component, part, or group. A &lt;prop> element may contain the following:
* &lt;requiredClass> (mandatory)

## &lt;control> element
Each security or privacy control within the catalog is defined by a &lt;control> element. A &lt;control> element may contain the following:
* &lt;title> (optional)
* &lt;control-components> and/or &lt;subcontrol> elements (zero or more of each)
* &lt;references> (zero or more)
* @id
* &lt;optionalClass>

## &lt;subcontrol> element
An OSCAL &lt;subcontrol> element is very similar to an OSCAL &lt;control> element in its composition. A &lt;subcontrol> element may contain the following:
* &lt;title> (optional)
* &lt;control-components> element (mandatory)
* &lt;references> (zero or more)
* @id
* &lt;optionalClass>

## The &lt;references> element
A &lt;references> element contains one or more reference descriptions, each contained within a &lt;ref> element. Each &lt;ref> element may contain the following:
* &lt;std> (citation of a form published standard), &lt;citation> (citation of a resource), and/or &lt;prose> elements (zero or more of each)
* @id

## The &lt;declarations> element
TBD

## Examples
TBD

The example below shows the first portion of how the AC1 control from NIST SP 800-53 can be rendered in OSCAL via XML within the &lt;control> element. Here's a high-level explanation of this example:

* The control class is "SP800-53". TBD: explain what this means, or skip it?
* The control id is "ac.1". This is not the "AC-1" identifier specified in NIST SP 800-53; instead, this is an OSCAL-internal identifier. TBD: is that correct? do the class and id work together so that the identifier is unique within the class?
* The *&lt;param> elements* define values (parameters) for the control that OSCAL users can specify. For example, the first parameter, "ac-1_a", is for specifying "organization-defined personnel or roles". The &lt;param> elements are referenced by statements (explained below).
* The *&lt;prop> elements* specify properties, in this case the control name ("AC-1"), priority ("P1"), and baseline impact ("LOW", "MODERATE", and "HIGH").
* The *&lt;part> element* defines a statement. The statement is the control text itself. As the example shows, the statement is defined in several pieces, with each discrete piece of the statement handled separately and assigned its own identifier. Some pieces reference parameter IDs (param-id) to bring in those user-defined values, while others simply contain chunks of the control's text. This modular approach to defining the control text enables granular treatment of each part of the control. For example, an auditor would find it easy to indicate which portions of the control an organization has implemented and which portions it has not.

```xml
      <control class="SP800-53" id="ac.1">
         <title>ACCESS CONTROL POLICY AND PROCEDURES</title>
         <param id="ac-1_a">
            <desc>organization-defined personnel or roles</desc>
            <value>organization-defined personnel or roles</value>
         </param>
         <param id="ac-1_b">
            <desc>organization-defined frequency</desc>
            <value>organization-defined frequency</value>
         </param>
         <param id="ac-1_c">
            <desc>organization-defined frequency</desc>
            <value>organization-defined frequency</value>
         </param>
         <prop class="name">AC-1</prop>
         <prop class="priority">P1</prop>
         <prop class="baseline-impact">LOW</prop>
         <prop class="baseline-impact">MODERATE</prop>
         <prop class="baseline-impact">HIGH</prop>
         <part class="statement">
            <p class="description">The organization:</p>
            <part class="item" id="smm_ac-1a.">
               <prop class="name">AC-1a.</prop>
               <p class="description">Develops, documents, and disseminates to <insert param-id="ac-1_a"/>:</p>
               <part class="item" id="sms_ac-1a.1.">
                  <prop class="name">AC-1a.1.</prop>
                  <p class="description">An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</p>
               </part>
               <part class="item" id="sms_ac-1a.2.">
                  <prop class="name">AC-1a.2.</prop>
                  <p class="description">Procedures to facilitate the implementation of the access control policy and associated access controls; and</p>
               </part>
            </part>
            <part class="item" id="smm_ac-1b.">
               <prop class="name">AC-1b.</prop>
               <p class="description">Reviews and updates the current:</p>
               <part class="item" id="sms_ac-1b.1.">
                  <prop class="name">AC-1b.1.</prop>
                  <p class="description">Access control policy <insert param-id="ac-1_b"/>; and</p>
               </part>
               <part class="item" id="sms_ac-1b.2.">
                  <prop class="name">AC-1b.2.</prop>
                  <p class="description">Access control procedures <insert param-id="ac-1_c"/>.</p>
               </part>
            </part>
         </part>
```

The second part of the example continues where the previous one ended. This example contains the supplemental guidance. Note that unlike the control text in the previous example, which had a highly structured OSCAL XML representation, the supplemental guidance is a simple paragraph. There is no need to structure it because it is meant as background information for a person to read and would not be part of automation.

```xml
         <part class="guidance">
            <p>This control addresses the establishment of policy and procedures for the effective implementation of selected security controls and control enhancements in the AC family. Policy and procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards, and guidance. Security program policies and procedures at the organization level may make the need for system-specific policies and procedures unnecessary. The policy can be included as part of the general information security policy for organizations or conversely, can be represented by multiple policies reflecting the complex nature of certain organizations. The procedures can be established for the security program in general and for particular information systems, if needed. The organizational risk management strategy is a key factor in establishing policy and procedures.</p>
            <link href="#pm.9"/>
         </part>
```

The final part of the example contains the references. These contain hyperlinks to additional sources of information for the control.

```xml
         <references>
            <ref>
                <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-12">NIST Special Publication 800-12</citation>
            </ref>
            <ref>
                <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-100">NIST Special Publication 800-100</citation>
            </ref>
         </references>
      </control>
```

The following shows a brief excerpt of ISO 27002 represented in OSCAL XML. This excerpt contains the definition of control 9.1.1, with text strings replaced with X's and truncated for brevity. Comparing this control definition to the OSCAL XML version of NIST SP 800-53 AC-1, you can see the same elements are used: control class and id, title, number, description, guidance, and information. Both controls are represented using the same structure.

```xml
         <control class="iso-27002" id="c9-1-1">
            <title>Access control policy</title>
            <prop class="number">9.1.1</prop>
            <part class="description">
               <p>XX XXXXXX.</p>
            </part>
            <part class="guidance">
               <p>XXXXXX.</p>
               <p>XXXXXX.</p>
               <p>XXX:</p>
               <ol>
                  <li>XXXXXXXX;</li>
                  <li>XXXXXXXX (XXX <a href="#g8-2">8.2</a>);</li>
                  <li>XXXXXXXXXXX;</li>
                  <li>XXXXXXXXXXXX (XXX <a href="#c9-2-1">9.2.1</a> XXX <a href="#c9-2-2">9.2.2</a>);</li>
                  <li>XXXXXXXXXXXX (XXX <a href="#c9-2-5">9.2.5</a>);</li>
                  <li>XXXXXXX (XXX <a href="#c9-2-6">9.2.6</a>);</li>
                  <li>XXXXXXXXX;</li>
                  <li>XXXXX (XXX <a href="#c9-2-3">9.2.3</a>).</li>
               </ol>
            </part>
            <part class="information">
               <p>XXXX:</p>
               <ol>
                  <li>XXXXXXXXXXXX”;</li>
                  <li>XXXXXXX (XXX <a href="#c8-2-2">8.2.2</a>) XXXX;</li>
                  <li>XXXXXXX;</li>
                  <li>XXXXX.</li>
               </ol>
               <p>XXXXXX (XXX <a href="#g9-2">9.2</a>, <a href="#g9-3">9.3</a>, <a href="#g9-4">9.4</a>) XXX (XXX <a href="#c6-1-1">6.1.1</a>, <a href="#g9-3">9.3</a>).</p>
               <p>XXXX.</p>
               <p>XXX:</p>
               <ol>
                  <li>XXXX-XX-XXXX: XXX);</li>
                  <li>XXXX-XX-XXX: XXX.</li>
               </ol>
            </part>
```
