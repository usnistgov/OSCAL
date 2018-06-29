---
title: Examples

language_tabs: # must be one of https://git.io/vQNgJ
  - xml
  - json
---

# Examples

Here are examples of OSCAL content, with narrative explaining certain aspects of each example.

## Catalog Example 1

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


...


        <part class="guidance">
          <p>This control addresses the establishment of policy and procedures for the effective implementation of selected security controls and control enhancements in the AC family. Policy and procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards, and guidance. Security program policies and procedures at the organization level may make the need for system-specific policies and procedures unnecessary. The policy can be included as part of the general information security policy for organizations or conversely, can be represented by multiple policies reflecting the complex nature of certain organizations. The procedures can be established for the security program in general and for particular information systems, if needed. The organizational risk management strategy is a key factor in establishing policy and procedures.</p>
          <link href="#pm.9"/>
        </part>


...


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

This example shows the first portion of how the AC1 control from NIST SP 800-53 can be rendered in OSCAL via XML within the `<control>` element. Here's a high-level explanation of this example:

* The control class is "SP800-53". TBD: explain what this means, or skip it?
* The control id is "ac.1". This is not the "AC-1" identifier specified in NIST SP 800-53; instead, this is an OSCAL-internal identifier. TBD: is that correct? do the class and id work together so that the identifier is unique within the class?
* The `<param>` elements define values (parameters) for the control that OSCAL users can specify. For example, the first parameter, "ac-1_a", is for specifying "organization-defined personnel or roles". The `<param>` elements are referenced by statements (explained below).
* The `<prop>` elements specify properties, in this case the control name ("AC-1"), priority ("P1"), and baseline impact ("LOW", "MODERATE", and "HIGH").
* The `<part>` element defines a statement. The statement is the control text itself. As the example shows, the statement is defined in several pieces, with each discrete piece of the statement handled separately and assigned its own identifier. Some pieces reference parameter IDs (param-id) to bring in those user-defined values, while others simply contain chunks of the control's text. This modular approach to defining the control text enables granular treatment of each part of the control. For example, an auditor would find it easy to indicate which portions of the control an organization has implemented and which portions it has not.

The second part of the example continues where the previous one ended. This example contains the supplemental guidance. Note that unlike the control text in the previous example, which had a highly structured OSCAL XML representation, the supplemental guidance is a simple paragraph. There is no need to structure it because it is meant as background information for a person to read and would not be part of automation.

The final part of the example contains the references. These contain hyperlinks to additional sources of information for the control.

## Catalog Example 2

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

This example shows a brief excerpt of ISO 27002 represented in OSCAL XML. This excerpt contains the definition of control 9.1.1, with text strings replaced with X's and truncated for brevity. Comparing this control definition to the OSCAL XML version of NIST SP 800-53 AC-1, you can see the same elements are used: control class and id, title, number, description, guidance, and information. Both controls are represented using the same structure.

## Profile Example 1

```xml
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" id="uuid-82bbb8a3-492a-4308-9316-6db230697d00">
   <title>SP800-53 LOW BASELINE IMPACT</title>
   <import href="SP800-53-rev4-catalog.xml">
      <include>
         <call control-id="ac.1"/>
         <call control-id="ac.2"/>
         <call control-id="ac.3"/>
         <call control-id="ac.7"/>
         <call control-id="ac.8"/>
         <call control-id="ac.14"/>
         <call control-id="ac.17"/>
         <call control-id="ac.18"/>
         <call control-id="ac.19"/>
         <call control-id="ac.20"/>
         <call control-id="ac.22"/>
      </include></import>
</profile>
```

This example shows an excerpt of the profile corresponding to the NIST SP 800-53 low baseline. This excerpt omits additional `<call control>` lines but is otherwise complete. This profile has a title, imports the NIST SP 800-53 catalog, and specifies numerous controls from that catalog. This is a very simple example.

## Profile Example 2

```xml
<profile xmlns="http://csrc.nist.gov/ns/oscal/1.0" id="uuid-50756f0d-c37b-494d-b77f-f82d25e9aa15">
   <title>FedRAMP LOW Baseline PROFILE (extracted and aligned, no edits)</title>
   <import href="../SP800-53/SP800-53-LOW-baseline.xml">
      <include>
         <call control-id="ac.1"/>
         <call control-id="ac.2"/>
         <call control-id="ac.3"/>
         <call control-id="ac.7"/>
         <call control-id="ac.8"/>
         <call control-id="ac.14"/>
      </include></import>
   <import href="../SP800-53/SP800-53-MODERATE-baseline.xml">
      <include>
         <call subcontrol-id="ca.2.1."/>
         <call control-id="si.16"/>
      </include></import>
   <merge/>
   <modify>
      <!-- - - - - - -->
      <set-param param-id="ac-1_a">
         <desc>organization-defined personnel or roles</desc>
         <value>organization-defined personnel or roles</value>
      </set-param>
      <set-param param-id="ac-1_b">
         <desc>organization-defined frequency</desc>
         <value>organization-defined frequency</value>
      </set-param>
      <set-param param-id="ac-1_c">
         <desc>organization-defined frequency</desc>
         <value>organization-defined frequency</value>
      </set-param>
      <alter control-id="ac.1">
         <augment>
            <part class="parameters">
               <p>AC-1 (b) (1) [at least every 3 years] AC-1 (b) (2) [at least annually]</p>
            </part>
         </augment>
      </alter>
      <!-- - - - - - -->
   </modify></profile>
```

This example shows an excerpt of a more complex profile than the previous example. This example is based on the FedRAMP low baseline, which can be found at https://www.fedramp.gov/resources/documents-2016/ under Key Cloud Service Provider (CSP) Documents. The first notable difference from the first example is that this profile references two other profiles: SP800-53-LOW-baseline and SP800-53-MODERATE-baseline. A single profile can reference zero or more catalogs and zero or more other profiles. (For brevity, the lists of controls referenced from each profile have been truncated.) The second notable difference is that this profile modifies the controls (via the `<modify>` element) by setting parameters for particular controls (using `<set-param>` elements) and altering the language of other controls (using the `<alter>` and `<augment>` elements). This causes the profile to be customized to meet the specific needs of the parties using it.
