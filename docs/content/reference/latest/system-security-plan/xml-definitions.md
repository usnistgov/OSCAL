---
title: "System Security Plan Model XML Format Metaschema Reference"
heading: OSCAL System Security Plan (SSP) Model XML Metaschema Reference
description: A reference for the XML element and attribute definitions for the OSCAL System Security Plan model derived from this model's metaschema.
weight: 80
sidenav:
  title: XML Metaschema Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
---

The following is a reference for the XML element and attribute definitions derived from this model's metaschema.

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml">
   <p><span class="usa-tag">OSCAL model</span> OSCAL System Security Plan (SSP) Model</p>
   <p><span class="usa-tag">Version</span> 1.0.0-rc2</p>
   <p><span class="usa-tag">Short name</span> oscal-ssp</p>
   <p><span class="usa-tag">XML namespace</span> <code>http://csrc.nist.gov/ns/oscal/1.0</code></p>
   <div class="remarks">
      <p class="p">The OSCAL Control SSP format can be used to describe the information typically specified
         in a system security plan, such as those defined in NIST SP 800-18.</p>
      <p class="p">The root of the OSCAL System Security Plan (SSP) format is <code>system-security-plan</code>. </p>
   </div>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/system-security-plan" class="toc1 head">Assembly
         <code>system-security-plan</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">System Security Plan (SSP)</p>
      <p class="description">A system security plan, such as those described in NIST SP 800-18</p>
      <p class="root-name"><span class="lbl">root-name</span>system-security-plan</p>
      <ul class="model">
         <li id="/assembly/oscal-ssp/system-security-plan/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-ssp/system-security-plan/metadata">Assembly (reference) <code>metadata</code></li>
         <li id="/assembly/oscal-ssp/system-security-plan/import-profile">Assembly (reference) <code>import-profile</code></li>
         <li id="/assembly/oscal-ssp/system-security-plan/system-characteristics">Assembly (reference) <code>system-characteristics</code></li>
         <li id="/assembly/oscal-ssp/system-security-plan/system-implementation">Assembly (reference) <code>system-implementation</code></li>
         <li id="/assembly/oscal-ssp/system-security-plan/control-implementation">Assembly (reference) <code>control-implementation</code></li>
         <li id="/assembly/oscal-ssp/system-security-plan/back-matter">Assembly (reference) <code>back-matter</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan"
                 _metaschema-json-id="/assembly/oscal-ssp/system-security-plan"
                 scope="global"
                 name="system-security-plan"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:system-security-plan"
                 _using-root-name="system-security-plan"&gt;
   &lt;formal-name&gt;System Security Plan (SSP)&lt;/formal-name&gt;
   &lt;description&gt;A system security plan, such as those described in NIST SP 800-18&lt;/description&gt;
   &lt;root-name&gt;system-security-plan&lt;/root-name&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/uuid"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;System Security Plan Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A globally unique identifier for this catalog instance. This UUID should be changed when this document is revised.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;assembly _step="metadata"
                _key="metadata"
                _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/metadata"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/metadata"
                max-occurs="1"
                min-occurs="1"
                ref="metadata"
                _key-ref="oscal-metadata:metadata"
                _using-name="metadata"
                _in-xml-name="metadata"
                _in-json-name="metadata"/&gt;
      &lt;assembly _step="import-profile"
                _key="import-profile"
                _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/import-profile"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/import-profile"
                max-occurs="1"
                min-occurs="1"
                ref="import-profile"
                _key-ref="oscal-ssp:import-profile"
                _using-name="import-profile"
                _in-xml-name="import-profile"
                _in-json-name="import-profile"/&gt;
      &lt;assembly _step="system-characteristics"
                _key="system-characteristics"
                _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/system-characteristics"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/system-characteristics"
                max-occurs="1"
                min-occurs="1"
                ref="system-characteristics"
                _key-ref="oscal-ssp:system-characteristics"
                _using-name="system-characteristics"
                _in-xml-name="system-characteristics"
                _in-json-name="system-characteristics"/&gt;
      &lt;assembly _step="system-implementation"
                _key="system-implementation"
                _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/system-implementation"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/system-implementation"
                max-occurs="1"
                min-occurs="1"
                ref="system-implementation"
                _key-ref="oscal-ssp:system-implementation"
                _using-name="system-implementation"
                _in-xml-name="system-implementation"
                _in-json-name="system-implementation"/&gt;
      &lt;assembly _step="control-implementation"
                _key="control-implementation"
                _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/control-implementation"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/control-implementation"
                max-occurs="1"
                min-occurs="1"
                ref="control-implementation"
                _key-ref="oscal-ssp:control-implementation"
                _using-name="control-implementation"
                _in-xml-name="control-implementation"
                _in-json-name="control-implementation"/&gt;
      &lt;assembly _step="back-matter"
                _key="back-matter"
                _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/back-matter"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/back-matter"
                max-occurs="1"
                min-occurs="0"
                ref="back-matter"
                _key-ref="oscal-metadata:back-matter"
                _using-name="back-matter"
                _in-xml-name="back-matter"
                _in-json-name="back-matter"/&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/import-profile" class="toc1 head">Assembly
         <code>import-profile</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Import Profile</p>
      <p class="description">Used to import the OSCAL profile representing the system's control baseline.</p>
      <ul class="model">
         <li id="/assembly/oscal-ssp/import-profile/href">Flag (defined inline) <code>href</code></li>
         <li id="/assembly/oscal-ssp/import-profile/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/import-profile"
                 _metaschema-json-id="/assembly/oscal-ssp/import-profile"
                 scope="global"
                 name="import-profile"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:import-profile"&gt;
   &lt;formal-name&gt;Import Profile&lt;/formal-name&gt;
   &lt;description&gt;Used to import the OSCAL profile representing the system's control baseline.&lt;/description&gt;
   &lt;define-flag _step="href"
                _key="href"
                _metaschema-xml-id="/assembly/oscal-ssp/import-profile/href"
                _metaschema-json-id="/assembly/oscal-ssp/import-profile/href"
                required="yes"
                as-type="uri-reference"
                name="href"
                _using-name="href"
                _in-xml-name="href"
                _in-json-name="href"&gt;
      &lt;formal-name&gt;Profile Reference&lt;/formal-name&gt;
      &lt;description&gt;A resolvable URL reference to the profile to use as the system's control baseline.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The value of the &lt;code&gt;href&lt;/code&gt; can be an internet resource, or a local reference using a fragment e.g. #fragment that points to a &lt;code&gt;back-matter&lt;/code&gt;
            &lt;code&gt;resource&lt;/code&gt; in the same document.&lt;/p&gt;
         &lt;p&gt;If a local reference using a fragment is used, this will be indicated by a fragment "#" followed by an identifier which references an identified &lt;code&gt;resource&lt;/code&gt; in the document's &lt;code&gt;back-matter&lt;/code&gt; or another object that is within the scope of the containing OSCAL document.&lt;/p&gt;
         &lt;p&gt;If an internet resource is used, the &lt;code&gt;href&lt;/code&gt; value will be an absolute or relative URI pointing to the location of the referenced resource. A relative URI will be resolved relative to the location of the document containing the link.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/import-profile/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/import-profile/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/system-characteristics" class="toc1 head">Assembly
         <code>system-characteristics</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">System Characteristics</p>
      <p class="description">Contains the characteristics of the system, such as its name, purpose, and security
         impact level.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A value of 1, 2, or 3 as defined by <a href="https://doi.org/10.6028/NIST.SP.800-63-3">SP 800-63-3</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>A value of 1, 2, or 3 as defined by <a href="https://doi.org/10.6028/NIST.SP.800-63-3">SP 800-63-3</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>A value of 1, 2, or 3 as defined by <a href="https://doi.org/10.6028/NIST.SP.800-63-3">SP 800-63-3</a>.
               </p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>As defined by <a href="https://doi.org/10.6028/NIST.SP.800-63-3">SP 800-63-3</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>As defined by <a href="https://doi.org/10.6028/NIST.SP.800-63-3">SP 800-63-3</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>As defined by <a href="https://doi.org/10.6028/NIST.SP.800-63-3">SP 800-63-3</a>.
               </p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The associated value is one of: public-cloud, private-cloud, community-cloud, government-only-cloud,
               hybrid-cloud, or other.</p>
            
            <p class="enum"><span class="lbl">enum</span>The associated value is one of: saas, paas, iaas, or other.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The public cloud deployment model as defined by <a href="https://doi.org/10.6028/NIST.SP.800-145">The NIST Definition of Cloud Computing</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>The private cloud deployment model as defined by <a href="https://doi.org/10.6028/NIST.SP.800-145">The NIST Definition of Cloud Computing</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>The community cloud deployment model as defined by <a href="https://doi.org/10.6028/NIST.SP.800-145">The NIST Definition of Cloud Computing</a>.
               </p>
            
            
            <p class="enum"><span class="lbl">enum</span>TODO: define</p>
            
            <p class="enum"><span class="lbl">enum</span>Any other type of cloud deployment model that is exclusive to the other choices.</p>
            
            <div class="remarks">
               <p class="p">The hybrid cloud deployment model, as defined by <a href="https://doi.org/10.6028/NIST.SP.800-145">The NIST Definition of Cloud Computing</a>, can be supported by selecting two or more of the existing deployment models.</p>
            </div>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Software as a service (SaaS) cloud service model as defined by <a href="https://doi.org/10.6028/NIST.SP.800-145">The NIST Definition of Cloud Computing</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>Platform as a service (PaaS) cloud service model as defined by <a href="https://doi.org/10.6028/NIST.SP.800-145">The NIST Definition of Cloud Computing</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>Infrastructure as a service (IaaS) cloud service model as defined by <a href="https://doi.org/10.6028/NIST.SP.800-145">The NIST Definition of Cloud Computing</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>Any other type of cloud service model that is exclusive to the other choices.</p>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>responsible-party</code> associates multiple <code>party-uuid</code> entries with a single <code>role-id</code>, each role-id must be referenced only once.</p>
            </div>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The authorizing official for this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>The authorizing official's designated point of contact (POC) for this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>The executive ultimately accountable for the system.</p>
            
            <p class="enum"><span class="lbl">enum</span>The primary management-level point of contact (POC) for the system.</p>
            
            <p class="enum"><span class="lbl">enum</span>The primary technical point of contact (POC) for the system.</p>
            
            <p class="enum"><span class="lbl">enum</span>Other point of contact (POC) for the system that is not the management or technical
               POC.</p>
            
            <p class="enum"><span class="lbl">enum</span>The primary role responsible for ensuring the organization operates the system securely.</p>
            
            <p class="enum"><span class="lbl">enum</span>The point of contact (POC) responsible for identifying privacy information within
               the system, and ensuring its protection if present.</p>
            
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/system-characteristics/system-id">Field (reference) <code>system-id</code> - grouped as <code>system-ids</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/system-name">Field (defined inline) <code>system-name</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/system-name-short">Field (defined inline) <code>system-name-short</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/date-authorized">Field (reference) <code>date-authorized</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/security-sensitivity-level">Field (defined inline) <code>security-sensitivity-level</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/system-information">Assembly (reference) <code>system-information</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/security-impact-level">Assembly (reference) <code>security-impact-level</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/status">Assembly (reference) <code>status</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/authorization-boundary">Assembly (reference) <code>authorization-boundary</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/network-architecture">Assembly (reference) <code>network-architecture</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/data-flow">Assembly (reference) <code>data-flow</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/responsible-party">Assembly (reference) <code>responsible-party</code> - grouped as <code>responsible-parties</code></li>
         <li id="/assembly/oscal-ssp/system-characteristics/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics"
                 _metaschema-json-id="/assembly/oscal-ssp/system-characteristics"
                 scope="global"
                 name="system-characteristics"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:system-characteristics"&gt;
   &lt;formal-name&gt;System Characteristics&lt;/formal-name&gt;
   &lt;description&gt;Contains the characteristics of the system, such as its name, purpose, and security impact level.&lt;/description&gt;
   &lt;model&gt;
      &lt;field _step="system-id"
             _key="system-ids"
             _group-name="system-ids"
             _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-id"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-ids"
             max-occurs="unbounded"
             min-occurs="1"
             ref="system-id"
             _key-ref="oscal-implementation-common:system-id"
             _using-name="system-id"
             _in-xml-name="system-id"
             _in-json-name="system-ids"&gt;
         &lt;group-as name="system-ids" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;define-field _step="system-name"
                    _key="system-name"
                    _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-name"
                    _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-name"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="string"
                    name="system-name"
                    _using-name="system-name"
                    _in-xml-name="system-name"
                    _in-json-name="system-name"&gt;
         &lt;formal-name&gt;System Name - Full&lt;/formal-name&gt;
         &lt;description&gt;The full name of the system.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="system-name-short"
                    _key="system-name-short"
                    _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-name-short"
                    _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-name-short"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="system-name-short"
                    _using-name="system-name-short"
                    _in-xml-name="system-name-short"
                    _in-json-name="system-name-short"&gt;
         &lt;formal-name&gt;System Name - Short&lt;/formal-name&gt;
         &lt;description&gt;A short name for the system, such as an acronym, that is suitable for display in a data table or summary list.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/description"
                    _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;System Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the system.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/prop"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/link"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="date-authorized"
             _key="date-authorized"
             _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/date-authorized"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/date-authorized"
             max-occurs="1"
             min-occurs="0"
             ref="date-authorized"
             _key-ref="oscal-ssp:date-authorized"
             _using-name="date-authorized"
             _in-xml-name="date-authorized"
             _in-json-name="date-authorized"/&gt;
      &lt;define-field _step="security-sensitivity-level"
                    _key="security-sensitivity-level"
                    _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/security-sensitivity-level"
                    _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/security-sensitivity-level"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="string"
                    name="security-sensitivity-level"
                    _using-name="security-sensitivity-level"
                    _in-xml-name="security-sensitivity-level"
                    _in-json-name="security-sensitivity-level"&gt;
         &lt;formal-name&gt;Security Sensitivity Level&lt;/formal-name&gt;
         &lt;description&gt;The overall information system sensitivity categorization, such as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.199"&gt;FIPS-199&lt;/a&gt;. &lt;/description&gt;
         &lt;remarks&gt;
            &lt;p&gt;Often, organizations require the security sensitivity level to correspond with the highest confidentiality, integrity, or availability level identified by &lt;code&gt;security-impact-level&lt;/code&gt;. &lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="system-information"
                _key="system-information"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-information"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-information"
                max-occurs="1"
                min-occurs="1"
                ref="system-information"
                _key-ref="oscal-ssp:system-information"
                _using-name="system-information"
                _in-xml-name="system-information"
                _in-json-name="system-information"/&gt;
      &lt;assembly _step="security-impact-level"
                _key="security-impact-level"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/security-impact-level"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/security-impact-level"
                max-occurs="1"
                min-occurs="1"
                ref="security-impact-level"
                _key-ref="oscal-ssp:security-impact-level"
                _using-name="security-impact-level"
                _in-xml-name="security-impact-level"
                _in-json-name="security-impact-level"/&gt;
      &lt;assembly _step="status"
                _key="status"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/status"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/status"
                max-occurs="1"
                min-occurs="1"
                ref="status"
                _key-ref="oscal-ssp:status"
                _using-name="status"
                _in-xml-name="status"
                _in-json-name="status"/&gt;
      &lt;assembly _step="authorization-boundary"
                _key="authorization-boundary"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/authorization-boundary"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/authorization-boundary"
                max-occurs="1"
                min-occurs="1"
                ref="authorization-boundary"
                _key-ref="oscal-ssp:authorization-boundary"
                _using-name="authorization-boundary"
                _in-xml-name="authorization-boundary"
                _in-json-name="authorization-boundary"/&gt;
      &lt;assembly _step="network-architecture"
                _key="network-architecture"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/network-architecture"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/network-architecture"
                max-occurs="1"
                min-occurs="0"
                ref="network-architecture"
                _key-ref="oscal-ssp:network-architecture"
                _using-name="network-architecture"
                _in-xml-name="network-architecture"
                _in-json-name="network-architecture"/&gt;
      &lt;assembly _step="data-flow"
                _key="data-flow"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/data-flow"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/data-flow"
                max-occurs="1"
                min-occurs="0"
                ref="data-flow"
                _key-ref="oscal-ssp:data-flow"
                _using-name="data-flow"
                _in-xml-name="data-flow"
                _in-json-name="data-flow"/&gt;
      &lt;assembly _step="responsible-party"
                _key="responsible-parties"
                _group-name="responsible-parties"
                _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/responsible-party"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/responsible-parties"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-party"
                _key-ref="oscal-metadata:responsible-party"
                _using-name="responsible-party"
                _in-xml-name="responsible-party"
                _in-json-name="responsible-parties"&gt;
         &lt;group-as name="responsible-parties" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="identity-assurance-level"&gt;A value of 1, 2, or 3 as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-63-3"&gt;SP 800-63-3&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="authenticator-assurance-level"&gt;A value of 1, 2, or 3 as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-63-3"&gt;SP 800-63-3&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="federation-assurance-level"&gt;A value of 1, 2, or 3 as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-63-3"&gt;SP 800-63-3&lt;/a&gt;.
        &lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name=('identity-assurance-level','authenticator-assurance-level','federation-assurance-level')]/value()"&gt;
         &lt;enum value="1"&gt;As defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-63-3"&gt;SP 800-63-3&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="2"&gt;As defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-63-3"&gt;SP 800-63-3&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="3"&gt;As defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-63-3"&gt;SP 800-63-3&lt;/a&gt;.
        &lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="property/@name" allow-other="yes"&gt;
         &lt;enum value="cloud-deployment-model"&gt;The associated value is one of: public-cloud, private-cloud, community-cloud, government-only-cloud, hybrid-cloud, or other.&lt;/enum&gt;
         &lt;enum value="cloud-service-model"&gt;The associated value is one of: saas, paas, iaas, or other.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='cloud-deployment-model']/value()"&gt;
         &lt;enum value="public-cloud"&gt;The public cloud deployment model as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-145"&gt;The NIST Definition of Cloud Computing&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="private-cloud"&gt;The private cloud deployment model as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-145"&gt;The NIST Definition of Cloud Computing&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="community-cloud"&gt;The community cloud deployment model as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-145"&gt;The NIST Definition of Cloud Computing&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="government-only-cloud"&gt;TODO: define&lt;/enum&gt;
         &lt;enum value="other"&gt;Any other type of cloud deployment model that is exclusive to the other choices.&lt;/enum&gt;
         &lt;remarks&gt;
            &lt;p&gt;The hybrid cloud deployment model, as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-145"&gt;The NIST Definition of Cloud Computing&lt;/a&gt;, can be supported by selecting two or more of the existing deployment models.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='cloud-service-model']/value()"&gt;
         &lt;enum value="saas"&gt;Software as a service (SaaS) cloud service model as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-145"&gt;The NIST Definition of Cloud Computing&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="paas"&gt;Platform as a service (PaaS) cloud service model as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-145"&gt;The NIST Definition of Cloud Computing&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="iaas"&gt;Infrastructure as a service (IaaS) cloud service model as defined by &lt;a href="https://doi.org/10.6028/NIST.SP.800-145"&gt;The NIST Definition of Cloud Computing&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="other"&gt;Any other type of cloud service model that is exclusive to the other choices.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;is-unique name="unique-ssp-system-characteristics-responsible-party"
                 target="responsible-party"&gt;
         &lt;key-field target="@role-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;responsible-party&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
      &lt;allowed-values target="responsible-party/@role-id" allow-other="yes"&gt;
         &lt;enum value="authorizing-official"&gt;The authorizing official for this system.&lt;/enum&gt;
         &lt;enum value="authorizing-official-poc"&gt;The authorizing official's designated point of contact (POC) for this system.&lt;/enum&gt;
         &lt;enum value="system-owner"&gt;The executive ultimately accountable for the system.&lt;/enum&gt;
         &lt;enum value="system-poc-management"&gt;The primary management-level point of contact (POC) for the system.&lt;/enum&gt;
         &lt;enum value="system-poc-technical"&gt;The primary technical point of contact (POC) for the system.&lt;/enum&gt;
         &lt;enum value="system-poc-other"&gt;Other point of contact (POC) for the system that is not the management or technical POC.&lt;/enum&gt;
         &lt;enum value="information-system-security-officer"&gt;The primary role responsible for ensuring the organization operates the system securely.&lt;/enum&gt;
         &lt;enum value="privacy-poc"&gt;The point of contact (POC) responsible for identifying privacy information within the system, and ensuring its protection if present.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/system-information" class="toc1 head">Assembly
         <code>system-information</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">System Information</p>
      <p class="description">Contains details about all information types that are stored, processed, or transmitted
         by the system, such as privacy information, and those defined in <a href="https://doi.org/10.6028/NIST.SP.800-60v2r1">NIST SP 800-60</a>. </p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Is this a privacy sensitive system? yes or no</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The system is privacy sensitive.</p>
            
            <p class="enum"><span class="lbl">enum</span>The system isnot privacy sensitive.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A link to the privacy impact assessment.</p>
            </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A 'low' sensitivity level as defined in <a href="https://doi.org/10.6028/NIST.FIPS.199">FIPS-199</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>A 'moderate' sensitivity level as defined in <a href="https://doi.org/10.6028/NIST.FIPS.199">FIPS-199</a>.
               </p>
            
            <p class="enum"><span class="lbl">enum</span>A 'high' sensitivity level as defined in <a href="https://doi.org/10.6028/NIST.FIPS.199">FIPS-199</a>.
               </p>
            
            <div class="remarks">
               <p class="p">FIPS-199 taxonomy is provided here as a starting point. We will provide other taxonomies
                  based on community requests.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/system-information/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/system-information/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/system-information/information-type">Assembly (defined inline) <code>information-type</code> - grouped as <code>information-types</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/system-information"
                 _metaschema-json-id="/assembly/oscal-ssp/system-information"
                 scope="global"
                 name="system-information"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:system-information"&gt;
   &lt;formal-name&gt;System Information&lt;/formal-name&gt;
   &lt;description&gt;Contains details about all information types that are stored, processed, or transmitted by the system, such as privacy information, and those defined in &lt;a href="https://doi.org/10.6028/NIST.SP.800-60v2r1"&gt;NIST SP 800-60&lt;/a&gt;. &lt;/description&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/system-information/prop"
                _metaschema-json-id="/assembly/oscal-ssp/system-information/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/system-information/link"
                _metaschema-json-id="/assembly/oscal-ssp/system-information/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-assembly _step="information-type"
                       _key="information-types"
                       _group-name="information-types"
                       _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type"
                       _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types"
                       max-occurs="unbounded"
                       min-occurs="1"
                       name="information-type"
                       _using-name="information-type"
                       _in-xml-name="information-type"
                       _in-json-name="information-types"&gt;
         &lt;formal-name&gt;Information Type&lt;/formal-name&gt;
         &lt;description&gt;Contains details about one information type that is stored, processed, or transmitted by the system, such as privacy information, and those defined in &lt;a href="https://doi.org/10.6028/NIST.SP.800-60v2r1"&gt;NIST SP 800-60&lt;/a&gt;. &lt;/description&gt;
         &lt;group-as name="information-types" in-json="ARRAY"/&gt;
         &lt;define-flag _step="uuid"
                      _key="uuid"
                      _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/uuid"
                      _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/uuid"
                      required="no"
                      as-type="uuid"
                      name="uuid"
                      _using-name="uuid"
                      _in-xml-name="uuid"
                      _in-json-name="uuid"&gt;
            &lt;formal-name&gt;Information Type Universally Unique Identifier&lt;/formal-name&gt;
            &lt;description&gt;A globally unique identifier that can be used to reference this information type entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;model&gt;
            &lt;define-field _step="title"
                          _key="title"
                          _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/title"
                          _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/title"
                          max-occurs="1"
                          min-occurs="1"
                          collapsible="no"
                          as-type="markup-line"
                          name="title"
                          _using-name="title"
                          _in-xml-name="title"
                          _in-json-name="title"&gt;
               &lt;formal-name&gt;title field&lt;/formal-name&gt;
               &lt;description&gt;A human readable name for the information type. This title should be meaningful within the context of the system.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;define-field _step="description"
                          _key="description"
                          _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/description"
                          _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/description"
                          max-occurs="1"
                          min-occurs="1"
                          in-xml="WITH_WRAPPER"
                          collapsible="no"
                          as-type="markup-multiline"
                          name="description"
                          _using-name="description"
                          _in-xml-name="description"
                          _in-json-name="description"&gt;
               &lt;formal-name&gt;Information Type Description&lt;/formal-name&gt;
               &lt;description&gt;A summary of how this information type is used within the system.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;define-assembly _step="categorization"
                             _key="categorizations"
                             _group-name="categorizations"
                             _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/categorization"
                             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/categorizations"
                             max-occurs="unbounded"
                             min-occurs="0"
                             name="categorization"
                             _using-name="categorization"
                             _in-xml-name="categorization"
                             _in-json-name="categorizations"&gt;
               &lt;formal-name&gt;Information Type Categorization&lt;/formal-name&gt;
               &lt;description&gt;A set of information type identifiers qualified by the given identification &lt;code&gt;system&lt;/code&gt; used, such as NIST SP 800-60.&lt;/description&gt;
               &lt;group-as name="categorizations" in-json="ARRAY"/&gt;
               &lt;define-flag _step="system"
                            _key="system"
                            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/categorization/system"
                            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/categorizations/system"
                            required="yes"
                            as-type="uri"
                            name="system"
                            _using-name="system"
                            _in-xml-name="system"
                            _in-json-name="system"&gt;
                  &lt;formal-name&gt;Information Type Identification System&lt;/formal-name&gt;
                  &lt;description&gt;Specifies the information type identification system used.&lt;/description&gt;
                  &lt;constraint&gt;
                     &lt;allowed-values allow-other="yes"&gt;
                        &lt;enum value="https://doi.org/10.6028/NIST.SP.800-60v2r1"&gt;Based on the section identifiers in NIST &lt;a href="https://doi.org/10.6028/NIST.SP.800-60v2r1"&gt;Special Publication 800-60 Volume II Revision 1&lt;/a&gt;.
                  &lt;/enum&gt;
                     &lt;/allowed-values&gt;
                  &lt;/constraint&gt;
               &lt;/define-flag&gt;
               &lt;model&gt;
                  &lt;define-field _step="information-type-id"
                                _key="information-type-ids"
                                _group-name="information-type-ids"
                                _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/categorization/information-type-id"
                                _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/categorizations/information-type-ids"
                                max-occurs="unbounded"
                                min-occurs="0"
                                collapsible="no"
                                as-type="string"
                                name="information-type-id"
                                _using-name="information-type-id"
                                _in-xml-name="information-type-id"
                                _in-json-name="information-type-ids"&gt;
                     &lt;formal-name&gt;Information Type Systematized Identifier&lt;/formal-name&gt;
                     &lt;description&gt;An identifier qualified by the given identification &lt;code&gt;system&lt;/code&gt; used, such as NIST SP 800-60.&lt;/description&gt;
                     &lt;json-value-key&gt;id&lt;/json-value-key&gt;
                     &lt;group-as name="information-type-ids" in-json="ARRAY"/&gt;
                  &lt;/define-field&gt;
               &lt;/model&gt;
            &lt;/define-assembly&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/prop"
                      _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="link"
                      _key="links"
                      _group-name="links"
                      _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/link"
                      _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/links"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="link"
                      _key-ref="oscal-metadata:link"
                      _using-name="link"
                      _in-xml-name="link"
                      _in-json-name="links"&gt;
               &lt;group-as name="links" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;define-assembly _step="confidentiality-impact"
                             _key="confidentiality-impact"
                             _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact"
                             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact"
                             max-occurs="1"
                             min-occurs="1"
                             name="confidentiality-impact"
                             _using-name="confidentiality-impact"
                             _in-xml-name="confidentiality-impact"
                             _in-json-name="confidentiality-impact"&gt;
               &lt;formal-name&gt;Confidentiality Impact Level&lt;/formal-name&gt;
               &lt;description&gt;The expected level of impact resulting from the unauthorized disclosure of the described information.&lt;/description&gt;
               &lt;model&gt;
                  &lt;assembly _step="prop"
                            _key="props"
                            _group-name="props"
                            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/prop"
                            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/props"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="property"
                            _key-ref="oscal-metadata:property"
                            _using-name="prop"
                            _in-xml-name="prop"
                            _in-json-name="props"&gt;
                     &lt;group-as name="props" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;assembly _step="link"
                            _key="links"
                            _group-name="links"
                            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/link"
                            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/links"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="link"
                            _key-ref="oscal-metadata:link"
                            _using-name="link"
                            _in-xml-name="link"
                            _in-json-name="links"&gt;
                     &lt;group-as name="links" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;field _step="base"
                         _key="base"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/base"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/base"
                         max-occurs="1"
                         min-occurs="1"
                         ref="base"
                         _key-ref="oscal-ssp:base"
                         _using-name="base"
                         _in-xml-name="base"
                         _in-json-name="base"/&gt;
                  &lt;field _step="selected"
                         _key="selected"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/selected"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/selected"
                         max-occurs="1"
                         min-occurs="0"
                         ref="selected"
                         _key-ref="oscal-ssp:selected"
                         _using-name="selected"
                         _in-xml-name="selected"
                         _in-json-name="selected"/&gt;
                  &lt;field _step="adjustment-justification"
                         _key="adjustment-justification"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/adjustment-justification"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/adjustment-justification"
                         max-occurs="1"
                         min-occurs="0"
                         ref="adjustment-justification"
                         _key-ref="oscal-ssp:adjustment-justification"
                         in-xml="WITH_WRAPPER"
                         _using-name="adjustment-justification"
                         _in-xml-name="adjustment-justification"
                         _in-json-name="adjustment-justification"/&gt;
               &lt;/model&gt;
            &lt;/define-assembly&gt;
            &lt;define-assembly _step="integrity-impact"
                             _key="integrity-impact"
                             _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact"
                             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact"
                             max-occurs="1"
                             min-occurs="1"
                             name="integrity-impact"
                             _using-name="integrity-impact"
                             _in-xml-name="integrity-impact"
                             _in-json-name="integrity-impact"&gt;
               &lt;formal-name&gt;Integrity Impact Level&lt;/formal-name&gt;
               &lt;description&gt;The expected level of impact resulting from the unauthorized modification of the described information.&lt;/description&gt;
               &lt;model&gt;
                  &lt;assembly _step="prop"
                            _key="props"
                            _group-name="props"
                            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/prop"
                            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/props"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="property"
                            _key-ref="oscal-metadata:property"
                            _using-name="prop"
                            _in-xml-name="prop"
                            _in-json-name="props"&gt;
                     &lt;group-as name="props" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;assembly _step="link"
                            _key="links"
                            _group-name="links"
                            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/link"
                            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/links"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="link"
                            _key-ref="oscal-metadata:link"
                            _using-name="link"
                            _in-xml-name="link"
                            _in-json-name="links"&gt;
                     &lt;group-as name="links" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;field _step="base"
                         _key="base"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/base"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/base"
                         max-occurs="1"
                         min-occurs="1"
                         ref="base"
                         _key-ref="oscal-ssp:base"
                         _using-name="base"
                         _in-xml-name="base"
                         _in-json-name="base"/&gt;
                  &lt;field _step="selected"
                         _key="selected"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/selected"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/selected"
                         max-occurs="1"
                         min-occurs="0"
                         ref="selected"
                         _key-ref="oscal-ssp:selected"
                         _using-name="selected"
                         _in-xml-name="selected"
                         _in-json-name="selected"/&gt;
                  &lt;field _step="adjustment-justification"
                         _key="adjustment-justification"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/adjustment-justification"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/adjustment-justification"
                         max-occurs="1"
                         min-occurs="0"
                         ref="adjustment-justification"
                         _key-ref="oscal-ssp:adjustment-justification"
                         in-xml="WITH_WRAPPER"
                         _using-name="adjustment-justification"
                         _in-xml-name="adjustment-justification"
                         _in-json-name="adjustment-justification"/&gt;
               &lt;/model&gt;
            &lt;/define-assembly&gt;
            &lt;define-assembly _step="availability-impact"
                             _key="availability-impact"
                             _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact"
                             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact"
                             max-occurs="1"
                             min-occurs="1"
                             name="availability-impact"
                             _using-name="availability-impact"
                             _in-xml-name="availability-impact"
                             _in-json-name="availability-impact"&gt;
               &lt;formal-name&gt;Availability Impact Level&lt;/formal-name&gt;
               &lt;description&gt;The expected level of impact resulting from the disruption of access to or use of the described information or the information system.&lt;/description&gt;
               &lt;model&gt;
                  &lt;assembly _step="prop"
                            _key="props"
                            _group-name="props"
                            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/prop"
                            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/props"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="property"
                            _key-ref="oscal-metadata:property"
                            _using-name="prop"
                            _in-xml-name="prop"
                            _in-json-name="props"&gt;
                     &lt;group-as name="props" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;assembly _step="link"
                            _key="links"
                            _group-name="links"
                            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/link"
                            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/links"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="link"
                            _key-ref="oscal-metadata:link"
                            _using-name="link"
                            _in-xml-name="link"
                            _in-json-name="links"&gt;
                     &lt;group-as name="links" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;field _step="base"
                         _key="base"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/base"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/base"
                         max-occurs="1"
                         min-occurs="1"
                         ref="base"
                         _key-ref="oscal-ssp:base"
                         _using-name="base"
                         _in-xml-name="base"
                         _in-json-name="base"/&gt;
                  &lt;field _step="selected"
                         _key="selected"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/selected"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/selected"
                         max-occurs="1"
                         min-occurs="0"
                         ref="selected"
                         _key-ref="oscal-ssp:selected"
                         _using-name="selected"
                         _in-xml-name="selected"
                         _in-json-name="selected"/&gt;
                  &lt;field _step="adjustment-justification"
                         _key="adjustment-justification"
                         _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/adjustment-justification"
                         _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/adjustment-justification"
                         max-occurs="1"
                         min-occurs="0"
                         ref="adjustment-justification"
                         _key-ref="oscal-ssp:adjustment-justification"
                         in-xml="WITH_WRAPPER"
                         _using-name="adjustment-justification"
                         _in-xml-name="adjustment-justification"
                         _in-json-name="adjustment-justification"/&gt;
               &lt;/model&gt;
            &lt;/define-assembly&gt;
         &lt;/model&gt;
      &lt;/define-assembly&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="privacy-designation"&gt;Is this a privacy sensitive system? yes or no&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='privacy-designation']/value()"&gt;
         &lt;enum value="yes"&gt;The system is privacy sensitive.&lt;/enum&gt;
         &lt;enum value="no"&gt;The system isnot privacy sensitive.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="link/@rel"&gt;
         &lt;enum value="privacy-impact-assessment"&gt;A link to the privacy impact assessment.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;matches target="link[@rel='privacy-impact-assessment']/@href[starts-with(.,'#')]"
               datatype="uri-reference"/&gt;
      &lt;index-has-key name="index-back-matter-resource"
                     target="link[@rel='privacy-impact-assessment' and [starts-with(@href,'#')]]"&gt;
         &lt;key-field target="@href" pattern="#(.*)"/&gt;
      &lt;/index-has-key&gt;
      &lt;matches target="link[@rel='privacy-impact-assessment']/@href[not(starts-with(.,'#'))]"
               datatype="uri"/&gt;
      &lt;allowed-values target="security-sensitivity-level|security-impact-level/(security-objective-confidentiality|security-objective-integrity|security-objective-availability)|system-information/information-type/(confidentiality-impact|integrity-impact|availability-impact)/(base|selected}"&gt;
         &lt;enum value="fips-199-low"&gt;A 'low' sensitivity level as defined in &lt;a href="https://doi.org/10.6028/NIST.FIPS.199"&gt;FIPS-199&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="fips-199-moderate"&gt;A 'moderate' sensitivity level as defined in &lt;a href="https://doi.org/10.6028/NIST.FIPS.199"&gt;FIPS-199&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;enum value="fips-199-high"&gt;A 'high' sensitivity level as defined in &lt;a href="https://doi.org/10.6028/NIST.FIPS.199"&gt;FIPS-199&lt;/a&gt;.
        &lt;/enum&gt;
         &lt;remarks&gt;
            &lt;p&gt;FIPS-199 taxonomy is provided here as a starting point. We will provide other taxonomies based on community requests.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-ssp/base" class="toc1 head">Field <code>base</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Base Level (Confidentiality, Integrity, or Availability)</p>
      <p class="description">The prescribed base (Confidentiality, Integrity, or Availability) security impact
         level.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-ssp/base"
              _metaschema-json-id="/field/oscal-ssp/base"
              collapsible="no"
              as-type="string"
              scope="local"
              name="base"
              module="oscal-ssp"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
              _key-name="oscal-ssp:base"&gt;
   &lt;formal-name&gt;Base Level (Confidentiality, Integrity, or Availability)&lt;/formal-name&gt;
   &lt;description&gt;The prescribed base (Confidentiality, Integrity, or Availability) security impact level.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-ssp/selected" class="toc1 head">Field <code>selected</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Selected Level (Confidentiality, Integrity, or Availability)</p>
      <p class="description">The selected (Confidentiality, Integrity, or Availability) security impact level.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-ssp/selected"
              _metaschema-json-id="/field/oscal-ssp/selected"
              collapsible="no"
              as-type="string"
              scope="local"
              name="selected"
              module="oscal-ssp"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
              _key-name="oscal-ssp:selected"&gt;
   &lt;formal-name&gt;Selected Level (Confidentiality, Integrity, or Availability)&lt;/formal-name&gt;
   &lt;description&gt;The selected (Confidentiality, Integrity, or Availability) security impact level.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-ssp/adjustment-justification" class="toc1 head">Field <code>adjustment-justification</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Adjustment Justification</p>
      <p class="description">If the selected security level is different from the base security level, this contains
         the justification for the change.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-ssp/adjustment-justification"
              _metaschema-json-id="/field/oscal-ssp/adjustment-justification"
              in-xml="WITH_WRAPPER"
              collapsible="no"
              as-type="markup-multiline"
              scope="local"
              name="adjustment-justification"
              module="oscal-ssp"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
              _key-name="oscal-ssp:adjustment-justification"&gt;
   &lt;formal-name&gt;Adjustment Justification&lt;/formal-name&gt;
   &lt;description&gt;If the selected security level is different from the base security level, this contains the justification for the change.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/security-impact-level" class="toc1 head">Assembly
         <code>security-impact-level</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Security Impact Level</p>
      <p class="description">The overall level of expected impact resulting from unauthorized disclosure, modification,
         or loss of access to information.</p>
      <ul class="model">
         <li id="/assembly/oscal-ssp/security-impact-level/security-objective-confidentiality">Field (defined inline) <code>security-objective-confidentiality</code></li>
         <li id="/assembly/oscal-ssp/security-impact-level/security-objective-integrity">Field (defined inline) <code>security-objective-integrity</code></li>
         <li id="/assembly/oscal-ssp/security-impact-level/security-objective-availability">Field (defined inline) <code>security-objective-availability</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/security-impact-level"
                 _metaschema-json-id="/assembly/oscal-ssp/security-impact-level"
                 scope="global"
                 name="security-impact-level"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:security-impact-level"&gt;
   &lt;formal-name&gt;Security Impact Level&lt;/formal-name&gt;
   &lt;description&gt;The overall level of expected impact resulting from unauthorized disclosure, modification, or loss of access to information.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="security-objective-confidentiality"
                    _key="security-objective-confidentiality"
                    _metaschema-xml-id="/assembly/oscal-ssp/security-impact-level/security-objective-confidentiality"
                    _metaschema-json-id="/assembly/oscal-ssp/security-impact-level/security-objective-confidentiality"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="string"
                    name="security-objective-confidentiality"
                    _using-name="security-objective-confidentiality"
                    _in-xml-name="security-objective-confidentiality"
                    _in-json-name="security-objective-confidentiality"&gt;
         &lt;formal-name&gt;Security Objective: Confidentiality&lt;/formal-name&gt;
         &lt;description&gt;A target-level of confidentiality for the system, based on the sensitivity of information within the system.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="security-objective-integrity"
                    _key="security-objective-integrity"
                    _metaschema-xml-id="/assembly/oscal-ssp/security-impact-level/security-objective-integrity"
                    _metaschema-json-id="/assembly/oscal-ssp/security-impact-level/security-objective-integrity"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="string"
                    name="security-objective-integrity"
                    _using-name="security-objective-integrity"
                    _in-xml-name="security-objective-integrity"
                    _in-json-name="security-objective-integrity"&gt;
         &lt;formal-name&gt;Security Objective: Integrity&lt;/formal-name&gt;
         &lt;description&gt;A target-level of integrity for the system, based on the sensitivity of information within the system.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="security-objective-availability"
                    _key="security-objective-availability"
                    _metaschema-xml-id="/assembly/oscal-ssp/security-impact-level/security-objective-availability"
                    _metaschema-json-id="/assembly/oscal-ssp/security-impact-level/security-objective-availability"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="string"
                    name="security-objective-availability"
                    _using-name="security-objective-availability"
                    _in-xml-name="security-objective-availability"
                    _in-json-name="security-objective-availability"&gt;
         &lt;formal-name&gt;Security Objective: Availability&lt;/formal-name&gt;
         &lt;description&gt;A target-level of availability for the system, based on the sensitivity of information within the system.&lt;/description&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/status" class="toc1 head">Assembly
         <code>status</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Status</p>
      <p class="description">Describes the operational status of the system.</p>
      <div class="remarks">
         <p class="p">If 'other' is selected, a remark must be included to describe the current state.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/status/state">Flag (defined inline) <code>state</code></li>
         <li id="/assembly/oscal-ssp/status/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/status"
                 _metaschema-json-id="/assembly/oscal-ssp/status"
                 scope="local"
                 name="status"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:status"&gt;
   &lt;formal-name&gt;Status&lt;/formal-name&gt;
   &lt;description&gt;Describes the operational status of the system.&lt;/description&gt;
   &lt;define-flag _step="state"
                _key="state"
                _metaschema-xml-id="/assembly/oscal-ssp/status/state"
                _metaschema-json-id="/assembly/oscal-ssp/status/state"
                required="yes"
                as-type="string"
                name="state"
                _using-name="state"
                _in-xml-name="state"
                _in-json-name="state"&gt;
      &lt;formal-name&gt;State&lt;/formal-name&gt;
      &lt;description&gt;The current operating status.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values&gt;
            &lt;enum value="operational"&gt;The system is currently operating in production.&lt;/enum&gt;
            &lt;enum value="under-development"&gt;The system is being designed, developed, or implemented&lt;/enum&gt;
            &lt;enum value="under-major-modification"&gt;The system is undergoing a major change, development, or transition.&lt;/enum&gt;
            &lt;enum value="disposition"&gt;The system is no longer operational.&lt;/enum&gt;
            &lt;enum value="other"&gt;Some other state.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/status/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/status/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;If 'other' is selected, a remark must be included to describe the current state.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-ssp/date-authorized" class="toc1 head">Field <code>date-authorized</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">System Authorization Date</p>
      <p class="description">The date the system received its authorization.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-ssp/date-authorized"
              _metaschema-json-id="/field/oscal-ssp/date-authorized"
              collapsible="no"
              as-type="date"
              scope="local"
              name="date-authorized"
              module="oscal-ssp"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
              _key-name="oscal-ssp:date-authorized"&gt;
   &lt;formal-name&gt;System Authorization Date&lt;/formal-name&gt;
   &lt;description&gt;The date the system received its authorization.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/authorization-boundary" class="toc1 head">Assembly
         <code>authorization-boundary</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Authorization Boundary</p>
      <p class="description">A description of this system's authorization boundary, optionally supplemented by
         diagrams that illustrate the authorization boundary.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">A given <code>uuid</code> must be assigned only once to a diagram.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/authorization-boundary/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-ssp/authorization-boundary/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/authorization-boundary/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/authorization-boundary/diagram">Assembly (reference) <code>diagram</code> - grouped as <code>diagrams</code></li>
         <li id="/assembly/oscal-ssp/authorization-boundary/remarks">Field (defined inline) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary"
                 _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary"
                 scope="global"
                 name="authorization-boundary"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:authorization-boundary"&gt;
   &lt;formal-name&gt;Authorization Boundary&lt;/formal-name&gt;
   &lt;description&gt;A description of this system's authorization boundary, optionally supplemented by diagrams that illustrate the authorization boundary.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/description"
                    _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Authorization Boundary Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the system's authorization boundary.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/prop"
                _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/link"
                _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="diagram"
                _key="diagrams"
                _group-name="diagrams"
                _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/diagram"
                _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/diagrams"
                max-occurs="unbounded"
                min-occurs="0"
                ref="diagram"
                _key-ref="oscal-ssp:diagram"
                _using-name="diagram"
                _in-xml-name="diagram"
                _in-json-name="diagrams"&gt;
         &lt;group-as name="diagrams" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A visual depiction of the system's authorization boundary.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
      &lt;define-field _step="remarks"
                    _key="remarks"
                    _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/remarks"
                    _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/remarks"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="remarks"
                    _using-name="remarks"
                    _in-xml-name="remarks"
                    _in-json-name="remarks"&gt;
         &lt;formal-name&gt;remarks field&lt;/formal-name&gt;
         &lt;description&gt;Commentary about the system's authorization boundary that enhances the diagram.&lt;/description&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;is-unique name="unique-ssp-authorization-boundary-diagram" target="diagram"&gt;
         &lt;key-field target="@uuid"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A given &lt;code&gt;uuid&lt;/code&gt; must be assigned only once to a diagram.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/diagram" class="toc1 head">Assembly
         <code>diagram</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Diagram</p>
      <p class="description">A graphic that provides a visual representation the system, or some aspect of it.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A reference to the diagram image.</p>
            </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         </div>
      <div class="remarks">
         <p class="p">A diagram must include a <code>link</code> with a rel value of "diagram", who's href references a remote URI or an internal
            reference within this document containing the diagram.</p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <div class="remarks">
            <p class="p">The internal reference "#diagram1" points to an attached resource defined in the <code>back-matter</code> as a <code>resource</code>. The <code>media-type</code> indicates that the image is a Portable Network Graphics (PNG) image.</p>
         </div>
         
         <div class="diagram">
            <p class="element-label"><span class="lbl">diagram</span></p>
            
            <p class="description"><span class="lbl">description</span>A boundary diagram.</p>
            
            <div class="link">
               <p class="element-label"><span class="lbl">link</span></p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/diagram/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-ssp/diagram/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-ssp/diagram/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/diagram/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/diagram/caption">Field (defined inline) <code>caption</code></li>
         <li id="/assembly/oscal-ssp/diagram/remarks">Field (defined inline) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/diagram"
                 _metaschema-json-id="/assembly/oscal-ssp/diagram"
                 scope="global"
                 name="diagram"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:diagram"&gt;
   &lt;formal-name&gt;Diagram&lt;/formal-name&gt;
   &lt;description&gt;A graphic that provides a visual representation the system, or some aspect of it.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-ssp/diagram/uuid"
                _metaschema-json-id="/assembly/oscal-ssp/diagram/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Diagram ID&lt;/formal-name&gt;
      &lt;description&gt;The identifier for this diagram.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-ssp/diagram/description"
                    _metaschema-json-id="/assembly/oscal-ssp/diagram/description"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Diagram Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the diagram.&lt;/description&gt;
         &lt;remarks&gt;
            &lt;p&gt;This description is intended to be used as alternate text to support compliance with requirements from &lt;a href="https://www.section508.gov/manage/laws-and-policies"&gt;Section 508 of the United States Workforce Rehabilitation Act of 1973&lt;/a&gt;. &lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/diagram/prop"
                _metaschema-json-id="/assembly/oscal-ssp/diagram/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/diagram/link"
                _metaschema-json-id="/assembly/oscal-ssp/diagram/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-field _step="caption"
                    _key="caption"
                    _metaschema-xml-id="/assembly/oscal-ssp/diagram/caption"
                    _metaschema-json-id="/assembly/oscal-ssp/diagram/caption"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="caption"
                    _using-name="caption"
                    _in-xml-name="caption"
                    _in-json-name="caption"&gt;
         &lt;formal-name&gt;Caption&lt;/formal-name&gt;
         &lt;description&gt;A brief caption to annotate the diagram.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="remarks"
                    _key="remarks"
                    _metaschema-xml-id="/assembly/oscal-ssp/diagram/remarks"
                    _metaschema-json-id="/assembly/oscal-ssp/diagram/remarks"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="remarks"
                    _using-name="remarks"
                    _in-xml-name="remarks"
                    _in-json-name="remarks"&gt;
         &lt;formal-name&gt;remarks field&lt;/formal-name&gt;
         &lt;description&gt;Commentary about the diagram that enhances it.&lt;/description&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="link/@rel"&gt;
         &lt;enum value="diagram"&gt;A reference to the diagram image.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;matches target="link[@rel='diagramn']/@href[starts-with(.,'#')]"
               datatype="uri-reference"/&gt;
      &lt;index-has-key name="index-back-matter-resource"
                     target="link[@rel='diagram' and [starts-with(@href,'#')]]"&gt;
         &lt;key-field target="@href" pattern="#(.*)"/&gt;
      &lt;/index-has-key&gt;
      &lt;matches target="link[@rel='diagram']/@href[not(starts-with(.,'#'))]"
               datatype="uri"/&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;A diagram must include a &lt;code&gt;link&lt;/code&gt; with a rel value of "diagram", who's href references a remote URI or an internal reference within this document containing the diagram.&lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;remarks&gt;
         &lt;p&gt;The internal reference "#diagram1" points to an attached resource defined in the &lt;code&gt;back-matter&lt;/code&gt; as a &lt;code&gt;resource&lt;/code&gt;. The &lt;code&gt;media-type&lt;/code&gt; indicates that the image is a Portable Network Graphics (PNG) image.&lt;/p&gt;
      &lt;/remarks&gt;
      &lt;diagram xmlns="http://csrc.nist.gov/ns/oscal/1.0" id="boundary-diagram-1"&gt;
         &lt;description&gt;A boundary diagram.&lt;/description&gt;
         &lt;link rel="diagram" href="#diagram1" media-type="image/png"/&gt;
      &lt;/diagram&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/network-architecture" class="toc1 head">Assembly
         <code>network-architecture</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Network Architecture</p>
      <p class="description">A description of the system's network architecture, optionally supplemented by diagrams
         that illustrate the network architecture.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">A given <code>uuid</code> must be assigned only once to a diagram.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/network-architecture/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-ssp/network-architecture/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/network-architecture/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/network-architecture/diagram">Assembly (reference) <code>diagram</code> - grouped as <code>diagrams</code></li>
         <li id="/assembly/oscal-ssp/network-architecture/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/network-architecture"
                 _metaschema-json-id="/assembly/oscal-ssp/network-architecture"
                 scope="global"
                 name="network-architecture"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:network-architecture"&gt;
   &lt;formal-name&gt;Network Architecture&lt;/formal-name&gt;
   &lt;description&gt;A description of the system's network architecture, optionally supplemented by diagrams that illustrate the network architecture.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-ssp/network-architecture/description"
                    _metaschema-json-id="/assembly/oscal-ssp/network-architecture/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Network Architecture Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the system's network architecture.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/network-architecture/prop"
                _metaschema-json-id="/assembly/oscal-ssp/network-architecture/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/network-architecture/link"
                _metaschema-json-id="/assembly/oscal-ssp/network-architecture/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="diagram"
                _key="diagrams"
                _group-name="diagrams"
                _metaschema-xml-id="/assembly/oscal-ssp/network-architecture/diagram"
                _metaschema-json-id="/assembly/oscal-ssp/network-architecture/diagrams"
                max-occurs="unbounded"
                min-occurs="0"
                ref="diagram"
                _key-ref="oscal-ssp:diagram"
                _using-name="diagram"
                _in-xml-name="diagram"
                _in-json-name="diagrams"&gt;
         &lt;group-as name="diagrams" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/network-architecture/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/network-architecture/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;is-unique name="unique-ssp-network-architecture-diagram" target="diagram"&gt;
         &lt;key-field target="@uuid"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A given &lt;code&gt;uuid&lt;/code&gt; must be assigned only once to a diagram.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/data-flow" class="toc1 head">Assembly
         <code>data-flow</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Data Flow</p>
      <p class="description">A description of the logical flow of information within the system and across its
         boundaries, optionally supplemented by diagrams that illustrate these flows.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">A given <code>uuid</code> must be assigned only once to a diagram.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/data-flow/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-ssp/data-flow/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/data-flow/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/data-flow/diagram">Assembly (reference) <code>diagram</code> - grouped as <code>diagrams</code></li>
         <li id="/assembly/oscal-ssp/data-flow/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/data-flow"
                 _metaschema-json-id="/assembly/oscal-ssp/data-flow"
                 scope="global"
                 name="data-flow"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:data-flow"&gt;
   &lt;formal-name&gt;Data Flow&lt;/formal-name&gt;
   &lt;description&gt;A description of the logical flow of information within the system and across its boundaries, optionally supplemented by diagrams that illustrate these flows.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-ssp/data-flow/description"
                    _metaschema-json-id="/assembly/oscal-ssp/data-flow/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Data Flow Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the system's data flow.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/data-flow/prop"
                _metaschema-json-id="/assembly/oscal-ssp/data-flow/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/data-flow/link"
                _metaschema-json-id="/assembly/oscal-ssp/data-flow/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="diagram"
                _key="diagrams"
                _group-name="diagrams"
                _metaschema-xml-id="/assembly/oscal-ssp/data-flow/diagram"
                _metaschema-json-id="/assembly/oscal-ssp/data-flow/diagrams"
                max-occurs="unbounded"
                min-occurs="0"
                ref="diagram"
                _key-ref="oscal-ssp:diagram"
                _using-name="diagram"
                _in-xml-name="diagram"
                _in-json-name="diagrams"&gt;
         &lt;group-as name="diagrams" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/data-flow/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/data-flow/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;is-unique name="unique-ssp-data-flow-diagram" target="diagram"&gt;
         &lt;key-field target="@uuid"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A given &lt;code&gt;uuid&lt;/code&gt; must be assigned only once to a diagram.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/system-implementation" class="toc1 head">Assembly
         <code>system-implementation</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">System Implementation</p>
      <p class="description">Provides information as to how the system is implemented.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The component allows an authenticated scan.</p>
            
            <p class="enum"><span class="lbl">enum</span>The component does not allow an authenticated scan.</p>
            </div>
         
         
         
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">A given <code>uuid</code> must be assigned only once to a user.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/system-implementation/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/system-implementation/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/system-implementation/leveraged-authorization">Assembly (defined inline) <code>leveraged-authorization</code> - grouped as <code>leveraged-authorizations</code></li>
         <li id="/assembly/oscal-ssp/system-implementation/user">Assembly (reference) <code>system-user</code> - using name <code>user</code> - grouped as <code>users</code></li>
         <li id="/assembly/oscal-ssp/system-implementation/component">Assembly (reference) <code>system-component</code> - using name <code>component</code> - grouped as <code>components</code></li>
         <li id="/assembly/oscal-ssp/system-implementation/inventory-item">Assembly (reference) <code>inventory-item</code> - grouped as <code>inventory-items</code></li>
         <li id="/assembly/oscal-ssp/system-implementation/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/system-implementation"
                 _metaschema-json-id="/assembly/oscal-ssp/system-implementation"
                 scope="global"
                 name="system-implementation"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:system-implementation"&gt;
   &lt;formal-name&gt;System Implementation&lt;/formal-name&gt;
   &lt;description&gt;Provides information as to how the system is implemented.&lt;/description&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/prop"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/link"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-assembly _step="leveraged-authorization"
                       _key="leveraged-authorizations"
                       _group-name="leveraged-authorizations"
                       _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization"
                       _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="leveraged-authorization"
                       _using-name="leveraged-authorization"
                       _in-xml-name="leveraged-authorization"
                       _in-json-name="leveraged-authorizations"&gt;
         &lt;formal-name&gt;Leveraged Authorization&lt;/formal-name&gt;
         &lt;description&gt;A description of another authorized system from which this system inherits capabilities that satisfy security requirements. Another term for this concept is a &lt;em&gt;common control provider&lt;/em&gt;. &lt;/description&gt;
         &lt;group-as name="leveraged-authorizations" in-json="ARRAY"/&gt;
         &lt;define-flag _step="uuid"
                      _key="uuid"
                      _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/uuid"
                      _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/uuid"
                      required="yes"
                      as-type="uuid"
                      name="uuid"
                      _using-name="uuid"
                      _in-xml-name="uuid"
                      _in-json-name="uuid"&gt;
            &lt;formal-name&gt;Leveraged Authorization Universally Unique Identifier&lt;/formal-name&gt;
            &lt;description&gt;A globally unique identifier that can be used to reference this leveraged authorization entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;model&gt;
            &lt;define-field _step="title"
                          _key="title"
                          _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/title"
                          _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/title"
                          max-occurs="1"
                          min-occurs="1"
                          collapsible="no"
                          as-type="markup-line"
                          name="title"
                          _using-name="title"
                          _in-xml-name="title"
                          _in-json-name="title"&gt;
               &lt;formal-name&gt;title field&lt;/formal-name&gt;
               &lt;description&gt;A human readable name for the leveraged authorization in the context of the system.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/prop"
                      _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="link"
                      _key="links"
                      _group-name="links"
                      _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/link"
                      _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/links"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="link"
                      _key-ref="oscal-metadata:link"
                      _using-name="link"
                      _in-xml-name="link"
                      _in-json-name="links"&gt;
               &lt;group-as name="links" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;define-field _step="party-uuid"
                          _key="party-uuid"
                          _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/party-uuid"
                          _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/party-uuid"
                          max-occurs="1"
                          min-occurs="1"
                          collapsible="no"
                          as-type="uuid"
                          name="party-uuid"
                          _using-name="party-uuid"
                          _in-xml-name="party-uuid"
                          _in-json-name="party-uuid"&gt;
               &lt;formal-name&gt;party-uuid field&lt;/formal-name&gt;
               &lt;description&gt;A reference to the party that manages the leveraged system.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;field _step="date-authorized"
                   _key="date-authorized"
                   _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/date-authorized"
                   _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/date-authorized"
                   max-occurs="1"
                   min-occurs="1"
                   ref="date-authorized"
                   _key-ref="oscal-ssp:date-authorized"
                   _using-name="date-authorized"
                   _in-xml-name="date-authorized"
                   _in-json-name="date-authorized"/&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/remarks"
                   _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;allowed-values target="link/@rel"&gt;
               &lt;enum value="system-security-plan"&gt;A reference to the system security plan for the leveraged authorization.&lt;/enum&gt;
            &lt;/allowed-values&gt;
            &lt;matches target="link[@rel='system-security-plan']/@href[starts-with(.,'#')]"
                     datatype="uri-reference"/&gt;
            &lt;index-has-key name="index-back-matter-resource"
                           target="link[@rel='system-security-plan' and [starts-with(@href,'#')]]"&gt;
               &lt;key-field target="@href" pattern="#(.*)"/&gt;
            &lt;/index-has-key&gt;
            &lt;matches target="link[@rel='system-security-plan']/@href[not(starts-with(.,'#'))]"
                     datatype="uri"/&gt;
         &lt;/constraint&gt;
      &lt;/define-assembly&gt;
      &lt;assembly _step="user"
                _key="users"
                _group-name="users"
                _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/user"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/users"
                max-occurs="unbounded"
                min-occurs="1"
                ref="system-user"
                _key-ref="oscal-implementation-common:system-user"
                _using-name="user"
                _in-xml-name="user"
                _in-json-name="users"&gt;
         &lt;use-name&gt;user&lt;/use-name&gt;
         &lt;group-as name="users" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="component"
                _key="components"
                _group-name="components"
                _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/component"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/components"
                max-occurs="unbounded"
                min-occurs="1"
                ref="system-component"
                _key-ref="oscal-implementation-common:system-component"
                _using-name="component"
                _in-xml-name="component"
                _in-json-name="components"&gt;
         &lt;use-name&gt;component&lt;/use-name&gt;
         &lt;group-as name="components" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="inventory-item"
                _key="inventory-items"
                _group-name="inventory-items"
                _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/inventory-item"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/inventory-items"
                max-occurs="unbounded"
                min-occurs="0"
                ref="inventory-item"
                _key-ref="oscal-implementation-common:inventory-item"
                _using-name="inventory-item"
                _in-xml-name="inventory-item"
                _in-json-name="inventory-items"&gt;
         &lt;group-as name="inventory-items" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A set of &lt;code&gt;inventory-item&lt;/code&gt; entries that represent the managed inventory instances of the system.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/system-implementation/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;index name="index-system-implementation-leveraged-authorization-uuid"
             target="leveraged-authorization"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index-has-key name="index-system-implementation-leveraged-authorization-uuid"
                     target="component/prop[@name='leveraged-authorization-uuid']"&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
      &lt;index name="index-system-implementation-component-uuid" target="component"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index-has-key name="index-system-implementation-component-uuid"
                     target="component/link[@rel='depends-on']"&gt;
         &lt;key-field target="@href"/&gt;
      &lt;/index-has-key&gt;
      &lt;index name="index-system-implementation-component-uuid-validation"
             target="component[@type='validation']"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index-has-key name="index-system-implementation-component-uuid-validation"
                     target="component/link[@rel='validated-by']"&gt;
         &lt;key-field target="@href"/&gt;
      &lt;/index-has-key&gt;
      &lt;index-has-key name="index-system-implementation-component-uuid-validation"
                     target="component/link[@rel='proof-of-compliance']"&gt;
         &lt;key-field target="@href"/&gt;
      &lt;/index-has-key&gt;
      &lt;index name="index-system-implementation-component-uuid-service"
             target="component[@type='service']"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index-has-key name="index-system-implementation-component-uuid-service"
                     target="component/link[@rel='uses-service']"&gt;
         &lt;key-field target="@href"/&gt;
      &lt;/index-has-key&gt;
      &lt;index name="index-system-implementation-component-uuid-software"
             target="component[@type='service']"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index-has-key name="index-system-implementation-component-uuid-software"
                     target="component[@type='service']/link[@rel='provided-by']"&gt;
         &lt;key-field target="@href"/&gt;
      &lt;/index-has-key&gt;
      &lt;allowed-values target="(component | inventory-item)/prop[@name='allows-authenticated-scan']/@value"&gt;
         &lt;enum value="yes"&gt;The component allows an authenticated scan.&lt;/enum&gt;
         &lt;enum value="no"&gt;The component does not allow an authenticated scan.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;is-unique name="unique-ssp-system-implementation-user" target="user"&gt;
         &lt;key-field target="@uuid"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A given &lt;code&gt;uuid&lt;/code&gt; must be assigned only once to a user.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/control-implementation" class="toc1 head">Assembly
         <code>control-implementation</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Control Implementation</p>
      <p class="description">Describes how the system satisfies a set of controls.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since multiple <code>set-parameter</code> entries can be provided, each parameter must be set only once.</p>
            </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">Use of <code>set-parameter</code> in this context, sets the parameter for all related controls referenced in an <code>implemented-requirement</code>. If the same parameter is also set in a specific <code>implemented-requirement</code>, then the new value will override this value.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/control-implementation/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-ssp/control-implementation/set-parameter">Assembly (reference) <code>set-parameter</code> - grouped as <code>set-parameters</code></li>
         <li id="/assembly/oscal-ssp/control-implementation/implemented-requirement">Assembly (reference) <code>implemented-requirement</code> - grouped as <code>implemented-requirements</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/control-implementation"
                 _metaschema-json-id="/assembly/oscal-ssp/control-implementation"
                 scope="local"
                 name="control-implementation"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:control-implementation"&gt;
   &lt;formal-name&gt;Control Implementation&lt;/formal-name&gt;
   &lt;description&gt;Describes how the system satisfies a set of controls.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-ssp/control-implementation/description"
                    _metaschema-json-id="/assembly/oscal-ssp/control-implementation/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Control Implementation Description&lt;/formal-name&gt;
         &lt;description&gt;A statement describing important things to know about how this set of control satisfaction documentation is approached.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="set-parameter"
                _key="set-parameters"
                _group-name="set-parameters"
                _metaschema-xml-id="/assembly/oscal-ssp/control-implementation/set-parameter"
                _metaschema-json-id="/assembly/oscal-ssp/control-implementation/set-parameters"
                max-occurs="unbounded"
                min-occurs="0"
                ref="set-parameter"
                _key-ref="oscal-implementation-common:set-parameter"
                _using-name="set-parameter"
                _in-xml-name="set-parameter"
                _in-json-name="set-parameters"&gt;
         &lt;group-as name="set-parameters" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="implemented-requirement"
                _key="implemented-requirements"
                _group-name="implemented-requirements"
                _metaschema-xml-id="/assembly/oscal-ssp/control-implementation/implemented-requirement"
                _metaschema-json-id="/assembly/oscal-ssp/control-implementation/implemented-requirements"
                max-occurs="unbounded"
                min-occurs="1"
                ref="implemented-requirement"
                _key-ref="oscal-ssp:implemented-requirement"
                _using-name="implemented-requirement"
                _in-xml-name="implemented-requirement"
                _in-json-name="implemented-requirements"&gt;
         &lt;group-as name="implemented-requirements" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;is-unique name="unique-ssp-control-implementation-set-parameter"
                 target="set-parameter"&gt;
         &lt;key-field target="@param-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since multiple &lt;code&gt;set-parameter&lt;/code&gt; entries can be provided, each parameter must be set only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;Use of &lt;code&gt;set-parameter&lt;/code&gt; in this context, sets the parameter for all related controls referenced in an &lt;code&gt;implemented-requirement&lt;/code&gt;. If the same parameter is also set in a specific &lt;code&gt;implemented-requirement&lt;/code&gt;, then the new value will override this value.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/implemented-requirement" class="toc1 head">Assembly
         <code>implemented-requirement</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Control-based Requirement</p>
      <p class="description">Describes how the system satisfies an individual control.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Identifies the source of the implemented control.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The control is implemented by the organization owning the system, but is not specific
               to the system itself.</p>
            
            <p class="enum"><span class="lbl">enum</span>The control is implemented specifically to this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>The control is provided by the system, but must be configured by the customer.</p>
            
            <p class="enum"><span class="lbl">enum</span>The control must be implemented by the customer.</p>
            
            <p class="enum"><span class="lbl">enum</span>This control is inherited from an underlying system.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Indicates all or some portion of this control is inherited from an underlying authorized
               system.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Accountable for ensuring the asset is managed in accordance with organizational policies
               and procedures.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for administering a set of assets.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the security operations center (SOC).</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the network operations center (NOC).</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for responding to an event that could lead to loss of, or disruption to,
               an organization's operations, services or functions.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for providing information and support to users.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the configuration management processes governing changes to the asset.</p>
            
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="has-cardinality">
            <p class="element-label"><span class="lbl">has-cardinality</span></p>
            
            <div class="remarks">
               <p class="p">Since all implementation statements are defined at the by-component level (e.g., type=this-system),
                  there must be at least one by-component.</p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since multiple <code>set-parameter</code> entries can be provided, each parameter must be set only once.</p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>responsible-role</code> associates multiple <code>party-uuid</code> entries with a single <code>role-id</code>, each role-id must be referenced only once.</p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>statement</code> entries can be referenced using the statement's statement-id, each statement must
                  be referenced only once.</p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>by-component</code> can reference <code>component</code> entries using the component's uuid, each component must be referenced only once.
                  This ensures that all implementation statements are contained in the same <code>by-component</code> entry.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/implemented-requirement/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/control-id">Flag (reference) <code>control-id</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/set-parameter">Assembly (reference) <code>set-parameter</code> - grouped as <code>set-parameters</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/responsible-role">Assembly (reference) <code>responsible-role</code> - grouped as <code>responsible-roles</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/statement">Assembly (reference) <code>statement</code> - grouped as <code>statements</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/by-component">Assembly (reference) <code>by-component</code> - grouped as <code>by-components</code></li>
         <li id="/assembly/oscal-ssp/implemented-requirement/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement"
                 _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement"
                 scope="local"
                 name="implemented-requirement"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:implemented-requirement"&gt;
   &lt;formal-name&gt;Control-based Requirement&lt;/formal-name&gt;
   &lt;description&gt;Describes how the system satisfies an individual control.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/uuid"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Control Requirement Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A globally unique identifier that can be used to reference this control requirement entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;flag _step="control-id"
         _key="control-id"
         _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/control-id"
         _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/control-id"
         as-type="NCName"
         required="yes"
         ref="control-id"
         _key-ref="oscal-catalog-common:control-id"
         _using-name="control-id"
         _in-xml-name="control-id"
         _in-json-name="control-id"/&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/prop"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/link"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="set-parameter"
                _key="set-parameters"
                _group-name="set-parameters"
                _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/set-parameter"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/set-parameters"
                max-occurs="unbounded"
                min-occurs="0"
                ref="set-parameter"
                _key-ref="oscal-implementation-common:set-parameter"
                _using-name="set-parameter"
                _in-xml-name="set-parameter"
                _in-json-name="set-parameters"&gt;
         &lt;group-as name="set-parameters" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="responsible-role"
                _key="responsible-roles"
                _group-name="responsible-roles"
                _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/responsible-role"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/responsible-roles"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-role"
                _key-ref="oscal-metadata:responsible-role"
                _using-name="responsible-role"
                _in-xml-name="responsible-role"
                _in-json-name="responsible-roles"&gt;
         &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="statement"
                _key="statements"
                _group-name="statements"
                _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/statement"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/statements"
                max-occurs="unbounded"
                min-occurs="0"
                ref="statement"
                _key-ref="oscal-ssp:statement"
                _using-name="statement"
                _in-xml-name="statement"
                _in-json-name="statements"&gt;
         &lt;group-as name="statements" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="by-component"
                _key="by-components"
                _group-name="by-components"
                _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/by-component"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/by-components"
                max-occurs="unbounded"
                min-occurs="0"
                ref="by-component"
                _key-ref="oscal-ssp:by-component"
                _using-name="by-component"
                _in-xml-name="by-component"
                _in-json-name="by-components"&gt;
         &lt;group-as name="by-components" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="control-origination"&gt;Identifies the source of the implemented control.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='control-origination']/@value"&gt;
         &lt;enum value="organization"&gt;The control is implemented by the organization owning the system, but is not specific to the system itself.&lt;/enum&gt;
         &lt;enum value="system-specific"&gt;The control is implemented specifically to this system.&lt;/enum&gt;
         &lt;enum value="customer-configured"&gt;The control is provided by the system, but must be configured by the customer.&lt;/enum&gt;
         &lt;enum value="customer-provided"&gt;The control must be implemented by the customer.&lt;/enum&gt;
         &lt;enum value="inherited"&gt;This control is inherited from an underlying system.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="leveraged-authorization"&gt;Indicates all or some portion of this control is inherited from an underlying authorized system.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="responsible-role/@role-id" allow-other="yes"&gt;
         &lt;enum value="asset-owner"&gt;Accountable for ensuring the asset is managed in accordance with organizational policies and procedures.&lt;/enum&gt;
         &lt;enum value="asset-administrator"&gt;Responsible for administering a set of assets.&lt;/enum&gt;
         &lt;enum value="security-operations"&gt;Members of the security operations center (SOC).&lt;/enum&gt;
         &lt;enum value="network-operations"&gt;Members of the network operations center (NOC).&lt;/enum&gt;
         &lt;enum value="incident-response"&gt;Responsible for responding to an event that could lead to loss of, or disruption to, an organization's operations, services or functions.&lt;/enum&gt;
         &lt;enum value="help-desk"&gt;Responsible for providing information and support to users.&lt;/enum&gt;
         &lt;enum value="configuration-management"&gt;Responsible for the configuration management processes governing changes to the asset.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;index-has-key name="index-metadata-role-id"
                     target="responsible-role|statement/responsible-role|.//by-component//responsible-role"&gt;
         &lt;key-field target="@role-id"/&gt;
      &lt;/index-has-key&gt;
      &lt;index-has-key name="index-metadata-party-uuid"
                     target="responsible-role|statement/responsible-role|.//by-component//responsible-role"&gt;
         &lt;key-field target="@party-uuid"/&gt;
      &lt;/index-has-key&gt;
      &lt;has-cardinality target=".//by-component" min-occurs="1"&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since all implementation statements are defined at the by-component level (e.g., type=this-system), there must be at least one by-component.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/has-cardinality&gt;
      &lt;is-unique name="unique-ssp-implemented-requirement-set-parameter"
                 target="set-parameter"&gt;
         &lt;key-field target="@param-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since multiple &lt;code&gt;set-parameter&lt;/code&gt; entries can be provided, each parameter must be set only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
      &lt;is-unique name="unique-ssp-implemented-requirement-responsible-role"
                 target="responsible-role"&gt;
         &lt;key-field target="@role-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;responsible-role&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
      &lt;is-unique name="unique-ssp-implemented-requirement-statement" target="statement"&gt;
         &lt;key-field target="@statement-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;statement&lt;/code&gt; entries can be referenced using the statement's statement-id, each statement must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
      &lt;is-unique name="unique-ssp-implemented-requirement-by-component"
                 target="by-component"&gt;
         &lt;key-field target="@component-uuid"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;by-component&lt;/code&gt; can reference &lt;code&gt;component&lt;/code&gt; entries using the component's uuid, each component must be referenced only once. This ensures that all implementation statements are contained in the same &lt;code&gt;by-component&lt;/code&gt; entry.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/statement" class="toc1 head">Assembly
         <code>statement</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Specific Control Statement</p>
      <p class="description">Identifies which statements within a control are addressed.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Accountable for ensuring the asset is managed in accordance with organizational policies
               and procedures.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for administering a set of assets.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the security operations center (SOC).</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the network operations center (NOC).</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for responding to an event that could lead to loss of, or disruption to,
               an organization's operations, services or functions.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for providing information and support to users.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the configuration management processes governing changes to the asset.</p>
            
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>responsible-role</code> associates multiple <code>party-uuid</code> entries with a single <code>role-id</code>, each role-id must be referenced only once.</p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>by-component</code> can reference <code>component</code> entries using the component's uuid, each component must be referenced only once.
                  This ensures that all implementation statements are contained in the same <code>by-component</code> entry.</p>
            </div>
            </div>
         
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/statement/statement-id">Flag (reference) <code>statement-id</code></li>
         <li id="/assembly/oscal-ssp/statement/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-ssp/statement/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/statement/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/statement/responsible-role">Assembly (reference) <code>responsible-role</code> - grouped as <code>responsible-roles</code></li>
         <li id="/assembly/oscal-ssp/statement/by-component">Assembly (reference) <code>by-component</code> - grouped as <code>by-components</code></li>
         <li id="/assembly/oscal-ssp/statement/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/statement"
                 _metaschema-json-id="/assembly/oscal-ssp/statement"
                 scope="local"
                 name="statement"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:statement"&gt;
   &lt;formal-name&gt;Specific Control Statement&lt;/formal-name&gt;
   &lt;description&gt;Identifies which statements within a control are addressed.&lt;/description&gt;
   &lt;flag _step="statement-id"
         _key="statement-id"
         _metaschema-xml-id="/assembly/oscal-ssp/statement/statement-id"
         _metaschema-json-id="/assembly/oscal-ssp/statement/statement-id"
         as-type="NCName"
         required="yes"
         ref="statement-id"
         _key-ref="oscal-implementation-common:statement-id"
         _using-name="statement-id"
         _in-xml-name="statement-id"
         _in-json-name="statement-id"&gt;
      &lt;remarks&gt;
         &lt;p&gt;A reference to the specific implemented statement associated with a control.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/flag&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-ssp/statement/uuid"
                _metaschema-json-id="/assembly/oscal-ssp/statement/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Control Statement Reference Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A globally unique identifier that can be used to reference this control statement entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/statement/prop"
                _metaschema-json-id="/assembly/oscal-ssp/statement/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/statement/link"
                _metaschema-json-id="/assembly/oscal-ssp/statement/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="responsible-role"
                _key="responsible-roles"
                _group-name="responsible-roles"
                _metaschema-xml-id="/assembly/oscal-ssp/statement/responsible-role"
                _metaschema-json-id="/assembly/oscal-ssp/statement/responsible-roles"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-role"
                _key-ref="oscal-metadata:responsible-role"
                _using-name="responsible-role"
                _in-xml-name="responsible-role"
                _in-json-name="responsible-roles"&gt;
         &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="by-component"
                _key="by-components"
                _group-name="by-components"
                _metaschema-xml-id="/assembly/oscal-ssp/statement/by-component"
                _metaschema-json-id="/assembly/oscal-ssp/statement/by-components"
                max-occurs="unbounded"
                min-occurs="0"
                ref="by-component"
                _key-ref="oscal-ssp:by-component"
                _using-name="by-component"
                _in-xml-name="by-component"
                _in-json-name="by-components"&gt;
         &lt;group-as name="by-components" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/statement/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/statement/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="responsible-role/@role-id" allow-other="yes"&gt;
         &lt;enum value="asset-owner"&gt;Accountable for ensuring the asset is managed in accordance with organizational policies and procedures.&lt;/enum&gt;
         &lt;enum value="asset-administrator"&gt;Responsible for administering a set of assets.&lt;/enum&gt;
         &lt;enum value="security-operations"&gt;Members of the security operations center (SOC).&lt;/enum&gt;
         &lt;enum value="network-operations"&gt;Members of the network operations center (NOC).&lt;/enum&gt;
         &lt;enum value="incident-response"&gt;Responsible for responding to an event that could lead to loss of, or disruption to, an organization's operations, services or functions.&lt;/enum&gt;
         &lt;enum value="help-desk"&gt;Responsible for providing information and support to users.&lt;/enum&gt;
         &lt;enum value="configuration-management"&gt;Responsible for the configuration management processes governing changes to the asset.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;is-unique name="unique-ssp-statement-responsible-role" target="responsible-role"&gt;
         &lt;key-field target="@role-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;responsible-role&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
      &lt;is-unique name="unique-ssp-implemented-requirement-statement-by-component"
                 target="by-component"&gt;
         &lt;key-field target="@component-uuid"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;by-component&lt;/code&gt; can reference &lt;code&gt;component&lt;/code&gt; entries using the component's uuid, each component must be referenced only once. This ensures that all implementation statements are contained in the same &lt;code&gt;by-component&lt;/code&gt; entry.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-ssp/by-component" class="toc1 head">Assembly
         <code>by-component</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Component Control Implementation</p>
      <p class="description">Defines how the referenced component implements a set of controls.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Accountable for ensuring the asset is managed in accordance with organizational policies
               and procedures.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for administering a set of assets.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the security operations center (SOC).</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the network operations center (NOC).</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for responding to an event that could lead to loss of, or disruption to,
               an organization's operations, services or functions.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for providing information and support to users.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the configuration management processes governing changes to the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the creation and maintenance of a component.</p>
            
            <p class="enum"><span class="lbl">enum</span>Organization responsible for providing the component, if this is different from the
               "maintainer" (e.g., a reseller).</p>
            
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since multiple <code>set-parameter</code> entries can be provided, each parameter must be set only once.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-ssp/by-component/component-uuid">Flag (defined inline) <code>component-uuid</code></li>
         <li id="/assembly/oscal-ssp/by-component/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-ssp/by-component/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-ssp/by-component/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-ssp/by-component/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-ssp/by-component/set-parameter">Assembly (reference) <code>set-parameter</code> - grouped as <code>set-parameters</code></li>
         <li id="/assembly/oscal-ssp/by-component/implementation-status">Assembly (reference) <code>implementation-status</code></li>
         <li id="/assembly/oscal-ssp/by-component/export">Assembly (defined inline) <code>export</code></li>
         <li id="/assembly/oscal-ssp/by-component/inherited">Assembly (defined inline) <code>inherited</code> - grouped as <code>inherited</code></li>
         <li id="/assembly/oscal-ssp/by-component/satisfied">Assembly (defined inline) <code>satisfied</code> - grouped as <code>satisfied</code></li>
         <li id="/assembly/oscal-ssp/by-component/responsible-role">Assembly (reference) <code>responsible-role</code> - grouped as <code>responsible-roles</code></li>
         <li id="/assembly/oscal-ssp/by-component/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-ssp/by-component"
                 _metaschema-json-id="/assembly/oscal-ssp/by-component"
                 scope="global"
                 name="by-component"
                 module="oscal-ssp"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
                 _key-name="oscal-ssp:by-component"&gt;
   &lt;formal-name&gt;Component Control Implementation&lt;/formal-name&gt;
   &lt;description&gt;Defines how the referenced component implements a set of controls.&lt;/description&gt;
   &lt;define-flag _step="component-uuid"
                _key="component-uuid"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/component-uuid"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/component-uuid"
                required="yes"
                as-type="uuid"
                name="component-uuid"
                _using-name="component-uuid"
                _in-xml-name="component-uuid"
                _in-json-name="component-uuid"&gt;
      &lt;formal-name&gt;Component Universally Unique Identifier Reference&lt;/formal-name&gt;
      &lt;description&gt;A reference to the component that is implementing a given control or control statement.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/uuid"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;By-Component Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A globally unique identifier that can be used to reference this by-component entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-ssp/by-component/description"
                    _metaschema-json-id="/assembly/oscal-ssp/by-component/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Control Implementation Description&lt;/formal-name&gt;
         &lt;description&gt;An implementation statement that describes how a control or a control statement is implemented within the referenced system component.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/prop"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/link"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="set-parameter"
                _key="set-parameters"
                _group-name="set-parameters"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/set-parameter"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/set-parameters"
                max-occurs="unbounded"
                min-occurs="0"
                ref="set-parameter"
                _key-ref="oscal-implementation-common:set-parameter"
                _using-name="set-parameter"
                _in-xml-name="set-parameter"
                _in-json-name="set-parameters"&gt;
         &lt;group-as name="set-parameters" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="implementation-status"
                _key="implementation-status"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/implementation-status"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/implementation-status"
                max-occurs="1"
                min-occurs="0"
                ref="implementation-status"
                _key-ref="oscal-implementation-common:implementation-status"
                _using-name="implementation-status"
                _in-xml-name="implementation-status"
                _in-json-name="implementation-status"&gt;
         &lt;remarks&gt;
            &lt;p&gt;The &lt;code&gt;implementation-status&lt;/code&gt; is used to qualify the &lt;code&gt;status&lt;/code&gt; value to indicate the degree to which the control is implemented.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
      &lt;define-assembly _step="export"
                       _key="export"
                       _metaschema-xml-id="/assembly/oscal-ssp/by-component/export"
                       _metaschema-json-id="/assembly/oscal-ssp/by-component/export"
                       max-occurs="1"
                       min-occurs="0"
                       name="export"
                       _using-name="export"
                       _in-xml-name="export"
                       _in-json-name="export"&gt;
         &lt;formal-name&gt;Export&lt;/formal-name&gt;
         &lt;description&gt;Identifies content intended for external consumption, such as with leveraged organizations.&lt;/description&gt;
         &lt;model&gt;
            &lt;define-field _step="description"
                          _key="description"
                          _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/description"
                          _metaschema-json-id="/assembly/oscal-ssp/by-component/export/description"
                          max-occurs="1"
                          min-occurs="0"
                          in-xml="WITH_WRAPPER"
                          collapsible="no"
                          as-type="markup-multiline"
                          name="description"
                          _using-name="description"
                          _in-xml-name="description"
                          _in-json-name="description"&gt;
               &lt;formal-name&gt;Control Implementation Export Description&lt;/formal-name&gt;
               &lt;description&gt;An implementation statement that describes the aspects of the control or control statement implementation that can be available to another system leveraging this system.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/prop"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/export/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="link"
                      _key="links"
                      _group-name="links"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/link"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/export/links"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="link"
                      _key-ref="oscal-metadata:link"
                      _using-name="link"
                      _in-xml-name="link"
                      _in-json-name="links"&gt;
               &lt;group-as name="links" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;define-assembly _step="provided"
                             _key="provided"
                             _group-name="provided"
                             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided"
                             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided"
                             max-occurs="unbounded"
                             min-occurs="0"
                             name="provided"
                             _using-name="provided"
                             _in-xml-name="provided"
                             _in-json-name="provided"&gt;
               &lt;formal-name&gt;Provided Control Implementation&lt;/formal-name&gt;
               &lt;description&gt;Describes a capability which may be inherited by a leveraging system.&lt;/description&gt;
               &lt;group-as name="provided" in-json="ARRAY"/&gt;
               &lt;define-flag _step="uuid"
                            _key="uuid"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/uuid"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/uuid"
                            required="yes"
                            as-type="uuid"
                            name="uuid"
                            _using-name="uuid"
                            _in-xml-name="uuid"
                            _in-json-name="uuid"&gt;
                  &lt;formal-name&gt;Provided Universally Unique Identifier&lt;/formal-name&gt;
                  &lt;description&gt;A globally unique identifier that can be used to reference this provided entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
               &lt;/define-flag&gt;
               &lt;model&gt;
                  &lt;define-field _step="description"
                                _key="description"
                                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/description"
                                _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/description"
                                max-occurs="1"
                                min-occurs="1"
                                in-xml="WITH_WRAPPER"
                                collapsible="no"
                                as-type="markup-multiline"
                                name="description"
                                _using-name="description"
                                _in-xml-name="description"
                                _in-json-name="description"&gt;
                     &lt;formal-name&gt;Provided Control Implementation Description&lt;/formal-name&gt;
                     &lt;description&gt;An implementation statement that describes the aspects of the control or control statement implementation that can be provided to another system leveraging this system.&lt;/description&gt;
                  &lt;/define-field&gt;
                  &lt;assembly _step="prop"
                            _key="props"
                            _group-name="props"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/prop"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/props"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="property"
                            _key-ref="oscal-metadata:property"
                            _using-name="prop"
                            _in-xml-name="prop"
                            _in-json-name="props"&gt;
                     &lt;group-as name="props" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;assembly _step="link"
                            _key="links"
                            _group-name="links"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/link"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/links"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="link"
                            _key-ref="oscal-metadata:link"
                            _using-name="link"
                            _in-xml-name="link"
                            _in-json-name="links"&gt;
                     &lt;group-as name="links" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;assembly _step="responsible-role"
                            _key="responsible-roles"
                            _group-name="responsible-roles"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/responsible-role"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/responsible-roles"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="responsible-role"
                            _key-ref="oscal-metadata:responsible-role"
                            _using-name="responsible-role"
                            _in-xml-name="responsible-role"
                            _in-json-name="responsible-roles"&gt;
                     &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;field _step="remarks"
                         _key="remarks"
                         _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/remarks"
                         _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/remarks"
                         max-occurs="1"
                         min-occurs="0"
                         ref="remarks"
                         _key-ref="oscal-metadata:remarks"
                         in-xml="WITH_WRAPPER"
                         _using-name="remarks"
                         _in-xml-name="remarks"
                         _in-json-name="remarks"/&gt;
               &lt;/model&gt;
               &lt;constraint&gt;
                  &lt;is-unique name="unique-provided-responsible-role" target="responsible-role"&gt;
                     &lt;key-field target="@role-id"/&gt;
                     &lt;remarks&gt;
                        &lt;p&gt;Since &lt;code&gt;responsible-role&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
                     &lt;/remarks&gt;
                  &lt;/is-unique&gt;
               &lt;/constraint&gt;
            &lt;/define-assembly&gt;
            &lt;define-assembly _step="responsibility"
                             _key="responsibilities"
                             _group-name="responsibilities"
                             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility"
                             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities"
                             max-occurs="unbounded"
                             min-occurs="0"
                             name="responsibility"
                             _using-name="responsibility"
                             _in-xml-name="responsibility"
                             _in-json-name="responsibilities"&gt;
               &lt;formal-name&gt;Control Implementation Responsibility&lt;/formal-name&gt;
               &lt;description&gt;Describes a control implementation responsibility imposed on a leveraging system.&lt;/description&gt;
               &lt;group-as name="responsibilities" in-json="ARRAY"/&gt;
               &lt;define-flag _step="uuid"
                            _key="uuid"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/uuid"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/uuid"
                            required="yes"
                            as-type="uuid"
                            name="uuid"
                            _using-name="uuid"
                            _in-xml-name="uuid"
                            _in-json-name="uuid"&gt;
                  &lt;formal-name&gt;Responsibility Universally Unique Identifier&lt;/formal-name&gt;
                  &lt;description&gt;A globally unique identifier that can be used to reference this responsibility entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
               &lt;/define-flag&gt;
               &lt;flag _step="provided-uuid"
                     _key="provided-uuid"
                     _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/provided-uuid"
                     _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/provided-uuid"
                     as-type="uuid"
                     required="no"
                     ref="provided-uuid"
                     _key-ref="oscal-ssp:provided-uuid"
                     _using-name="provided-uuid"
                     _in-xml-name="provided-uuid"
                     _in-json-name="provided-uuid"/&gt;
               &lt;model&gt;
                  &lt;define-field _step="description"
                                _key="description"
                                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/description"
                                _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/description"
                                max-occurs="1"
                                min-occurs="1"
                                in-xml="WITH_WRAPPER"
                                collapsible="no"
                                as-type="markup-multiline"
                                name="description"
                                _using-name="description"
                                _in-xml-name="description"
                                _in-json-name="description"&gt;
                     &lt;formal-name&gt;Control Implementation Responsibility Description&lt;/formal-name&gt;
                     &lt;description&gt;An implementation statement that describes the aspects of the control or control statement implementation that a leveraging system must implement to satisfy the control provided by a leveraged system.&lt;/description&gt;
                  &lt;/define-field&gt;
                  &lt;assembly _step="prop"
                            _key="props"
                            _group-name="props"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/prop"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/props"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="property"
                            _key-ref="oscal-metadata:property"
                            _using-name="prop"
                            _in-xml-name="prop"
                            _in-json-name="props"&gt;
                     &lt;group-as name="props" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;assembly _step="link"
                            _key="links"
                            _group-name="links"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/link"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/links"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="link"
                            _key-ref="oscal-metadata:link"
                            _using-name="link"
                            _in-xml-name="link"
                            _in-json-name="links"&gt;
                     &lt;group-as name="links" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;assembly _step="responsible-role"
                            _key="responsible-roles"
                            _group-name="responsible-roles"
                            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/responsible-role"
                            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/responsible-roles"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="responsible-role"
                            _key-ref="oscal-metadata:responsible-role"
                            _using-name="responsible-role"
                            _in-xml-name="responsible-role"
                            _in-json-name="responsible-roles"&gt;
                     &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
                     &lt;remarks&gt;
                        &lt;p&gt;A role defined at the by-component level takes precedence over the same role defined on the parent implemented-requirement or on the referenced component. &lt;/p&gt;
                     &lt;/remarks&gt;
                  &lt;/assembly&gt;
                  &lt;field _step="remarks"
                         _key="remarks"
                         _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/remarks"
                         _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/remarks"
                         max-occurs="1"
                         min-occurs="0"
                         ref="remarks"
                         _key-ref="oscal-metadata:remarks"
                         in-xml="WITH_WRAPPER"
                         _using-name="remarks"
                         _in-xml-name="remarks"
                         _in-json-name="remarks"/&gt;
               &lt;/model&gt;
               &lt;constraint&gt;
                  &lt;is-unique name="unique-responsibility-responsible-role" target="responsible-role"&gt;
                     &lt;key-field target="@role-id"/&gt;
                     &lt;remarks&gt;
                        &lt;p&gt;Since &lt;code&gt;responsible-role&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
                     &lt;/remarks&gt;
                  &lt;/is-unique&gt;
               &lt;/constraint&gt;
            &lt;/define-assembly&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/remarks"
                   _metaschema-json-id="/assembly/oscal-ssp/by-component/export/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;has-cardinality target="provided|responsibility" min-occurs="1"/&gt;
            &lt;index name="by-component-export-provided-uuid" target=""&gt;
               &lt;key-field target="@uuid"/&gt;
            &lt;/index&gt;
            &lt;index-has-key name="by-component-export-provided-uuid" target="responsibility"&gt;
               &lt;key-field target="@provided-uuid"/&gt;
            &lt;/index-has-key&gt;
         &lt;/constraint&gt;
      &lt;/define-assembly&gt;
      &lt;define-assembly _step="inherited"
                       _key="inherited"
                       _group-name="inherited"
                       _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited"
                       _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="inherited"
                       _using-name="inherited"
                       _in-xml-name="inherited"
                       _in-json-name="inherited"&gt;
         &lt;formal-name&gt;Inherited Control Implementation&lt;/formal-name&gt;
         &lt;description&gt;Describes a control implementation inherited by a leveraging system.&lt;/description&gt;
         &lt;group-as name="inherited" in-json="ARRAY"/&gt;
         &lt;define-flag _step="uuid"
                      _key="uuid"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/uuid"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/uuid"
                      required="yes"
                      as-type="uuid"
                      name="uuid"
                      _using-name="uuid"
                      _in-xml-name="uuid"
                      _in-json-name="uuid"&gt;
            &lt;formal-name&gt;Inherited Universally Unique Identifier&lt;/formal-name&gt;
            &lt;description&gt;A globally unique identifier that can be used to reference this inherited entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;flag _step="provided-uuid"
               _key="provided-uuid"
               _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/provided-uuid"
               _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/provided-uuid"
               as-type="uuid"
               required="no"
               ref="provided-uuid"
               _key-ref="oscal-ssp:provided-uuid"
               _using-name="provided-uuid"
               _in-xml-name="provided-uuid"
               _in-json-name="provided-uuid"/&gt;
         &lt;model&gt;
            &lt;define-field _step="description"
                          _key="description"
                          _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/description"
                          _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/description"
                          max-occurs="1"
                          min-occurs="1"
                          in-xml="WITH_WRAPPER"
                          collapsible="no"
                          as-type="markup-multiline"
                          name="description"
                          _using-name="description"
                          _in-xml-name="description"
                          _in-json-name="description"&gt;
               &lt;formal-name&gt;Inherited Control Implementation Description&lt;/formal-name&gt;
               &lt;description&gt;An implementation statement that describes the aspects of a control or control statement implementation that a leveraging system is inheriting from a leveraged system.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/prop"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="link"
                      _key="links"
                      _group-name="links"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/link"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/links"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="link"
                      _key-ref="oscal-metadata:link"
                      _using-name="link"
                      _in-xml-name="link"
                      _in-json-name="links"&gt;
               &lt;group-as name="links" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="responsible-role"
                      _key="responsible-roles"
                      _group-name="responsible-roles"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/responsible-role"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/responsible-roles"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="responsible-role"
                      _key-ref="oscal-metadata:responsible-role"
                      _using-name="responsible-role"
                      _in-xml-name="responsible-role"
                      _in-json-name="responsible-roles"&gt;
               &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;is-unique name="unique-inherited-responsible-role" target="responsible-role"&gt;
               &lt;key-field target="@role-id"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Since &lt;code&gt;responsible-role&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
         &lt;/constraint&gt;
      &lt;/define-assembly&gt;
      &lt;define-assembly _step="satisfied"
                       _key="satisfied"
                       _group-name="satisfied"
                       _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied"
                       _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="satisfied"
                       _using-name="satisfied"
                       _in-xml-name="satisfied"
                       _in-json-name="satisfied"&gt;
         &lt;formal-name&gt;Satisfied Control Implementation Responsibility&lt;/formal-name&gt;
         &lt;description&gt;Describes how this system satisfies a responsibility imposed by a leveraged system.&lt;/description&gt;
         &lt;group-as name="satisfied" in-json="ARRAY"/&gt;
         &lt;define-flag _step="uuid"
                      _key="uuid"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/uuid"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/uuid"
                      required="yes"
                      as-type="uuid"
                      name="uuid"
                      _using-name="uuid"
                      _in-xml-name="uuid"
                      _in-json-name="uuid"&gt;
            &lt;formal-name&gt;Satisfied Universally Unique Identifier&lt;/formal-name&gt;
            &lt;description&gt;A globally unique identifier that can be used to reference this satisfied entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;flag _step="responsibility-uuid"
               _key="responsibility-uuid"
               _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/responsibility-uuid"
               _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/responsibility-uuid"
               as-type="uuid"
               required="no"
               ref="responsibility-uuid"
               _key-ref="oscal-ssp:responsibility-uuid"
               _using-name="responsibility-uuid"
               _in-xml-name="responsibility-uuid"
               _in-json-name="responsibility-uuid"/&gt;
         &lt;model&gt;
            &lt;define-field _step="description"
                          _key="description"
                          _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/description"
                          _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/description"
                          max-occurs="1"
                          min-occurs="1"
                          in-xml="WITH_WRAPPER"
                          collapsible="no"
                          as-type="markup-multiline"
                          name="description"
                          _using-name="description"
                          _in-xml-name="description"
                          _in-json-name="description"&gt;
               &lt;formal-name&gt;Satisfied Control Implementation Responsibility Description&lt;/formal-name&gt;
               &lt;description&gt;An implementation statement that describes the aspects of a control or control statement implementation that a leveraging system is implementing based on a requirement from a leveraged system.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/prop"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="link"
                      _key="links"
                      _group-name="links"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/link"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/links"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="link"
                      _key-ref="oscal-metadata:link"
                      _using-name="link"
                      _in-xml-name="link"
                      _in-json-name="links"&gt;
               &lt;group-as name="links" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="responsible-role"
                      _key="responsible-roles"
                      _group-name="responsible-roles"
                      _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/responsible-role"
                      _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/responsible-roles"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="responsible-role"
                      _key-ref="oscal-metadata:responsible-role"
                      _using-name="responsible-role"
                      _in-xml-name="responsible-role"
                      _in-json-name="responsible-roles"&gt;
               &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/remarks"
                   _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;is-unique name="unique-satisfied-responsible-role" target="responsible-role"&gt;
               &lt;key-field target="@role-id"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Since &lt;code&gt;responsible-role&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
         &lt;/constraint&gt;
      &lt;/define-assembly&gt;
      &lt;assembly _step="responsible-role"
                _key="responsible-roles"
                _group-name="responsible-roles"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/responsible-role"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/responsible-roles"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-role"
                _key-ref="oscal-metadata:responsible-role"
                _using-name="responsible-role"
                _in-xml-name="responsible-role"
                _in-json-name="responsible-roles"&gt;
         &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target=".//responsible-role/@role-id" allow-other="yes"&gt;
         &lt;enum value="asset-owner"&gt;Accountable for ensuring the asset is managed in accordance with organizational policies and procedures.&lt;/enum&gt;
         &lt;enum value="asset-administrator"&gt;Responsible for administering a set of assets.&lt;/enum&gt;
         &lt;enum value="security-operations"&gt;Members of the security operations center (SOC).&lt;/enum&gt;
         &lt;enum value="network-operations"&gt;Members of the network operations center (NOC).&lt;/enum&gt;
         &lt;enum value="incident-response"&gt;Responsible for responding to an event that could lead to loss of, or disruption to, an organization's operations, services or functions.&lt;/enum&gt;
         &lt;enum value="help-desk"&gt;Responsible for providing information and support to users.&lt;/enum&gt;
         &lt;enum value="configuration-management"&gt;Responsible for the configuration management processes governing changes to the asset.&lt;/enum&gt;
         &lt;enum value="maintainer"&gt;Responsible for the creation and maintenance of a component.&lt;/enum&gt;
         &lt;enum value="provider"&gt;Organization responsible for providing the component, if this is different from the "maintainer" (e.g., a reseller).&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;is-unique name="unique-ssp-by-component-set-parameter" target="set-parameter"&gt;
         &lt;key-field target="@param-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since multiple &lt;code&gt;set-parameter&lt;/code&gt; entries can be provided, each parameter must be set only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-ssp/provided-uuid" class="toc1 head">Flag <code>provided-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Provided UUID</p>
      <p class="description">Identifies a 'provided' assembly associated with this assembly.</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-ssp/provided-uuid"
             _metaschema-json-id="/flag/oscal-ssp/provided-uuid"
             as-type="uuid"
             scope="local"
             name="provided-uuid"
             module="oscal-ssp"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:provided-uuid"&gt;
   &lt;formal-name&gt;Provided UUID&lt;/formal-name&gt;
   &lt;description&gt;Identifies a 'provided' assembly associated with this assembly.&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-ssp/responsibility-uuid" class="toc1 head">Flag <code>responsibility-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Provided UUID</p>
      <p class="description">Identifies a 'provided' assembly associated with this assembly.</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-ssp/responsibility-uuid"
             _metaschema-json-id="/flag/oscal-ssp/responsibility-uuid"
             as-type="uuid"
             scope="local"
             name="responsibility-uuid"
             module="oscal-ssp"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:responsibility-uuid"&gt;
   &lt;formal-name&gt;Provided UUID&lt;/formal-name&gt;
   &lt;description&gt;Identifies a 'provided' assembly associated with this assembly.&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/metadata" class="toc1 head">Assembly
         <code>metadata</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Publication metadata</p>
      <p class="description">Provides information about the publication and availability of the containing document.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>responsible-party</code> associates multiple <code>party-uuid</code> entries with a single <code>role-id</code>, each role-id must be referenced only once.</p>
            </div>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Indicates the organization that created this content.</p>
            
            <p class="enum"><span class="lbl">enum</span>Indicates the organization for which this content was created.</p>
            
            <p class="enum"><span class="lbl">enum</span>Indicates the organization responsible for all content represented in the "document".</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies the authoritative location for this file. Defined by <a href="https://tools.ietf.org/html/rfc6596">RFC 6596</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies an alternative location or format for this file. Defined by <a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes">the HTML Living Standard</a></p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the latest version in the version history.
               Defined by <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by  <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/metadata/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/metadata/published">Field (reference) <code>published</code></li>
         <li id="/assembly/oscal-metadata/metadata/last-modified">Field (reference) <code>last-modified</code></li>
         <li id="/assembly/oscal-metadata/metadata/version">Field (reference) <code>version</code></li>
         <li id="/assembly/oscal-metadata/metadata/oscal-version">Field (reference) <code>oscal-version</code></li>
         <li id="/assembly/oscal-metadata/metadata/revisions/revision">Assembly (reference) <code>revision</code> - grouped as <code>revisions</code></li>
         <li id="/assembly/oscal-metadata/metadata/document-id">Field (reference) <code>document-id</code> - grouped as <code>document-ids</code></li>
         <li id="/assembly/oscal-metadata/metadata/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/metadata/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/metadata/role">Assembly (reference) <code>role</code> - grouped as <code>roles</code></li>
         <li id="/assembly/oscal-metadata/metadata/location">Assembly (reference) <code>location</code> - grouped as <code>locations</code></li>
         <li id="/assembly/oscal-metadata/metadata/party">Assembly (reference) <code>party</code> - grouped as <code>parties</code></li>
         <li id="/assembly/oscal-metadata/metadata/responsible-party">Assembly (reference) <code>responsible-party</code> - grouped as <code>responsible-parties</code></li>
         <li id="/assembly/oscal-metadata/metadata/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/metadata"
                 _metaschema-json-id="/assembly/oscal-metadata/metadata"
                 scope="global"
                 name="metadata"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:metadata"&gt;
   &lt;formal-name&gt;Publication metadata&lt;/formal-name&gt;
   &lt;description&gt;Provides information about the publication and availability of the containing document.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/metadata/title"
                    _metaschema-json-id="/assembly/oscal-metadata/metadata/title"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Document Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the document, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;field _step="published"
             _key="published"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/published"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/published"
             max-occurs="1"
             min-occurs="0"
             ref="published"
             _key-ref="oscal-metadata:published"
             _using-name="published"
             _in-xml-name="published"
             _in-json-name="published"/&gt;
      &lt;field _step="last-modified"
             _key="last-modified"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/last-modified"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/last-modified"
             max-occurs="1"
             min-occurs="1"
             ref="last-modified"
             _key-ref="oscal-metadata:last-modified"
             _using-name="last-modified"
             _in-xml-name="last-modified"
             _in-json-name="last-modified"/&gt;
      &lt;field _step="version"
             _key="version"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/version"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/version"
             max-occurs="1"
             min-occurs="1"
             ref="version"
             _key-ref="oscal-metadata:version"
             _using-name="version"
             _in-xml-name="version"
             _in-json-name="version"/&gt;
      &lt;field _step="oscal-version"
             _key="oscal-version"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/oscal-version"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/oscal-version"
             max-occurs="1"
             min-occurs="1"
             ref="oscal-version"
             _key-ref="oscal-metadata:oscal-version"
             _using-name="oscal-version"
             _in-xml-name="oscal-version"
             _in-json-name="oscal-version"/&gt;
      &lt;assembly _step="revisions/revision"
                _key="revisions"
                _group-name="revisions"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/revisions/revision"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/revisions"
                max-occurs="unbounded"
                min-occurs="0"
                ref="revision"
                _key-ref="oscal-metadata:revision"
                _using-name="revision"
                _in-xml-name="revision"
                _in-json-name="revisions"&gt;
         &lt;group-as name="revisions" in-xml="GROUPED" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="document-id"
             _key="document-ids"
             _group-name="document-ids"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/document-id"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/document-ids"
             max-occurs="unbounded"
             min-occurs="0"
             ref="document-id"
             _key-ref="oscal-metadata:document-id"
             _using-name="document-id"
             _in-xml-name="document-id"
             _in-json-name="document-ids"&gt;
         &lt;group-as name="document-ids" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/prop"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/link"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="role"
                _key="roles"
                _group-name="roles"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/role"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/roles"
                max-occurs="unbounded"
                min-occurs="0"
                ref="role"
                _key-ref="oscal-metadata:role"
                _using-name="role"
                _in-xml-name="role"
                _in-json-name="roles"&gt;
         &lt;group-as name="roles" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="location"
                _key="locations"
                _group-name="locations"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/location"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/locations"
                max-occurs="unbounded"
                min-occurs="0"
                ref="location"
                _key-ref="oscal-metadata:location"
                _using-name="location"
                _in-xml-name="location"
                _in-json-name="locations"&gt;
         &lt;group-as name="locations" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="party"
                _key="parties"
                _group-name="parties"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/party"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/parties"
                max-occurs="unbounded"
                min-occurs="0"
                ref="party"
                _key-ref="oscal-metadata:party"
                _using-name="party"
                _in-xml-name="party"
                _in-json-name="parties"&gt;
         &lt;group-as name="parties" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="responsible-party"
                _key="responsible-parties"
                _group-name="responsible-parties"
                _metaschema-xml-id="/assembly/oscal-metadata/metadata/responsible-party"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/responsible-parties"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-party"
                _key-ref="oscal-metadata:responsible-party"
                _using-name="responsible-party"
                _in-xml-name="responsible-party"
                _in-json-name="responsible-parties"&gt;
         &lt;group-as name="responsible-parties" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;index id="index-metadata-roles"
             name="index-metadata-role-ids"
             target="role"&gt;
         &lt;key-field target="@id"/&gt;
      &lt;/index&gt;
      &lt;is-unique id="unique-metadata-doc-id"
                 name="unique-metadata-doc-id"
                 target="document-id"&gt;
         &lt;key-field target="@scheme"/&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/is-unique&gt;
      &lt;is-unique id="unique-metadata-property"
                 name="unique-metadata-property"
                 target="prop"&gt;
         &lt;key-field target="@name"/&gt;
         &lt;key-field target="@ns"/&gt;
         &lt;key-field target="@class"/&gt;
         &lt;key-field target="@value"/&gt;
      &lt;/is-unique&gt;
      &lt;index id="index-metadata-property-id"
             name="index-metadata-property-id"
             target=".//prop"&gt;
         &lt;key-field target="@id"/&gt;
      &lt;/index&gt;
      &lt;is-unique id="unique-metadata-link" name="unique-metadata-link" target="link"&gt;
         &lt;key-field target="@href"/&gt;
         &lt;key-field target="@rel"/&gt;
         &lt;key-field target="@media-type"/&gt;
      &lt;/is-unique&gt;
      &lt;index id="index-metadata-role-id"
             name="index-metadata-role-id"
             target="role"&gt;
         &lt;key-field target="@id"/&gt;
      &lt;/index&gt;
      &lt;index id="index-metadata-location-uuid"
             name="index-metadata-location-uuid"
             target="location"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index id="index-metadata-party-uuid"
             name="index-metadata-party-uuid"
             target="party"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;index id="index-metadata-party-organizations-uuid"
             name="index-metadata-party-organizations-uuid"
             target="party[@type='organization']"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
      &lt;is-unique name="unique-metadata-responsible-party" target="responsible-party"&gt;
         &lt;key-field target="@role-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;responsible-party&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
      &lt;allowed-values id="allowed-metadata-responsibe-party-role-ids"
                      target="responsible-party/@role-id"
                      allow-other="yes"&gt;
         &lt;enum value="prepared-by"&gt;Indicates the organization that created this content.&lt;/enum&gt;
         &lt;enum value="prepared-for"&gt;Indicates the organization for which this content was created.&lt;/enum&gt;
         &lt;enum value="content-approver"&gt;Indicates the organization responsible for all content represented in the "document".&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="link/@rel" allow-other="yes"&gt;
         &lt;enum value="canonical"&gt;The link identifies the authoritative location for this file. Defined by &lt;a href="https://tools.ietf.org/html/rfc6596"&gt;RFC 6596&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="alternate"&gt;The link identifies an alternative location or format for this file. Defined by &lt;a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes"&gt;the HTML Living Standard&lt;/a&gt;
         &lt;/enum&gt;
         &lt;enum value="latest-version"&gt;This link identifies a resource containing the latest version in the version history. Defined by &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="predecessor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by  &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="successor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/revision" class="toc1 head">Assembly
         <code>revision</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Revision History Entry</p>
      <p class="description">An entry in a sequential list of revisions to the containing document in reverse chronological
         order (i.e., most recent previous revision first).</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="has-cardinality">
            <p class="element-label"><span class="lbl">has-cardinality</span></p>
         </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies the authoritative location for this file. Defined by <a href="https://tools.ietf.org/html/rfc6596">RFC 6596</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>The link identifies an alternative location or format for this file. Defined by <a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes">the HTML Living Standard</a></p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by  <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            
            <p class="enum"><span class="lbl">enum</span>This link identifies a resource containing the predecessor version in the version
               history. Defined by <a href="https://tools.ietf.org/html/rfc5829">RFC 5829</a>.</p>
            </div>
         </div>
      <div class="remarks">
         <p class="p">While <code>published</code>, <code>last-modified</code>, <code>oscal-version</code>, and <code>version</code> are not required, values for these entries should be provided if the information
            is known. For a revision entry to be considered valid, at least one of the following
            items must be provided: <code>published</code>, <code>last-modified</code>, <code>version</code>, or a <code>link</code> with a <code>rel</code> of <q>source</q>.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/revision/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/revision/published">Field (reference) <code>published</code></li>
         <li id="/assembly/oscal-metadata/revision/last-modified">Field (reference) <code>last-modified</code></li>
         <li id="/assembly/oscal-metadata/revision/version">Field (reference) <code>version</code></li>
         <li id="/assembly/oscal-metadata/revision/oscal-version">Field (reference) <code>oscal-version</code></li>
         <li id="/assembly/oscal-metadata/revision/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/revision/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/revision/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/revision"
                 _metaschema-json-id="/assembly/oscal-metadata/revision"
                 scope="local"
                 name="revision"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:revision"&gt;
   &lt;formal-name&gt;Revision History Entry&lt;/formal-name&gt;
   &lt;description&gt;An entry in a sequential list of revisions to the containing document in reverse chronological order (i.e., most recent previous revision first).&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/revision/title"
                    _metaschema-json-id="/assembly/oscal-metadata/revision/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Document Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the document revision, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;field _step="published"
             _key="published"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/published"
             _metaschema-json-id="/assembly/oscal-metadata/revision/published"
             max-occurs="1"
             min-occurs="0"
             ref="published"
             _key-ref="oscal-metadata:published"
             _using-name="published"
             _in-xml-name="published"
             _in-json-name="published"/&gt;
      &lt;field _step="last-modified"
             _key="last-modified"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/last-modified"
             _metaschema-json-id="/assembly/oscal-metadata/revision/last-modified"
             max-occurs="1"
             min-occurs="0"
             ref="last-modified"
             _key-ref="oscal-metadata:last-modified"
             _using-name="last-modified"
             _in-xml-name="last-modified"
             _in-json-name="last-modified"/&gt;
      &lt;field _step="version"
             _key="version"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/version"
             _metaschema-json-id="/assembly/oscal-metadata/revision/version"
             max-occurs="1"
             min-occurs="0"
             ref="version"
             _key-ref="oscal-metadata:version"
             _using-name="version"
             _in-xml-name="version"
             _in-json-name="version"/&gt;
      &lt;field _step="oscal-version"
             _key="oscal-version"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/oscal-version"
             _metaschema-json-id="/assembly/oscal-metadata/revision/oscal-version"
             max-occurs="1"
             min-occurs="0"
             ref="oscal-version"
             _key-ref="oscal-metadata:oscal-version"
             _using-name="oscal-version"
             _in-xml-name="oscal-version"
             _in-json-name="oscal-version"/&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/revision/prop"
                _metaschema-json-id="/assembly/oscal-metadata/revision/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/revision/link"
                _metaschema-json-id="/assembly/oscal-metadata/revision/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/revision/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;has-cardinality target="published|last-modified|version|link[@rel='canonical']"
                       min-occurs="1"/&gt;
      &lt;allowed-values target="link/@rel" allow-other="yes"&gt;
         &lt;enum value="canonical"&gt;The link identifies the authoritative location for this file. Defined by &lt;a href="https://tools.ietf.org/html/rfc6596"&gt;RFC 6596&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="alternate"&gt;The link identifies an alternative location or format for this file. Defined by &lt;a href="https://html.spec.whatwg.org/multipage/links.html#linkTypes"&gt;the HTML Living Standard&lt;/a&gt;
         &lt;/enum&gt;
         &lt;enum value="predecessor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by  &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
         &lt;enum value="successor-version"&gt;This link identifies a resource containing the predecessor version in the version history. Defined by &lt;a href="https://tools.ietf.org/html/rfc5829"&gt;RFC 5829&lt;/a&gt;.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;While &lt;code&gt;published&lt;/code&gt;, &lt;code&gt;last-modified&lt;/code&gt;, &lt;code&gt;oscal-version&lt;/code&gt;, and &lt;code&gt;version&lt;/code&gt; are not required, values for these entries should be provided if the information is known. For a revision entry to be considered valid, at least one of the following items must be provided: &lt;code&gt;published&lt;/code&gt;, &lt;code&gt;last-modified&lt;/code&gt;, &lt;code&gt;version&lt;/code&gt;, or a &lt;code&gt;link&lt;/code&gt; with a &lt;code&gt;rel&lt;/code&gt; of &lt;q&gt;source&lt;/q&gt;.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/location" class="toc1 head">Assembly
         <code>location</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Location</p>
      <p class="description">A location, with associated metadata that can be referenced.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Characterizes the kind of location.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A location that contains computing assets. A <code>class</code> can be used to indicate a subclass of data-center.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The location is a data-center used for normal operations.</p>
            
            <p class="enum"><span class="lbl">enum</span>The location is a data-center used for fail-over or backup operations.</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/location/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-metadata/location/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/location/address">Assembly (reference) <code>address</code></li>
         <li id="/assembly/oscal-metadata/location/email-address">Field (reference) <code>email-address</code> - grouped as <code>email-addresses</code></li>
         <li id="/assembly/oscal-metadata/location/telephone-number">Field (reference) <code>telephone-number</code> - grouped as <code>telephone-numbers</code></li>
         <li id="/assembly/oscal-metadata/location/url">Field (defined inline) <code>url</code> - grouped as <code>urls</code></li>
         <li id="/assembly/oscal-metadata/location/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/location/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/location/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/location"
                 _metaschema-json-id="/assembly/oscal-metadata/location"
                 scope="global"
                 name="location"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:location"&gt;
   &lt;formal-name&gt;Location&lt;/formal-name&gt;
   &lt;description&gt;A location, with associated metadata that can be referenced.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-metadata/location/uuid"
                _metaschema-json-id="/assembly/oscal-metadata/location/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Location Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier that can be used to reference this defined location elsewhere in an OSCAL document. A UUID should be consistently used for a given location across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/location/title"
                    _metaschema-json-id="/assembly/oscal-metadata/location/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Location Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the location, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="address"
                _key="address"
                _metaschema-xml-id="/assembly/oscal-metadata/location/address"
                _metaschema-json-id="/assembly/oscal-metadata/location/address"
                max-occurs="1"
                min-occurs="1"
                ref="address"
                _key-ref="oscal-metadata:address"
                _using-name="address"
                _in-xml-name="address"
                _in-json-name="address"&gt;
         &lt;remarks&gt;
            &lt;p&gt;Typically, the physical address of the location will be used here. If this information is sensitive, then a mailing address can be used instead.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
      &lt;field _step="email-address"
             _key="email-addresses"
             _group-name="email-addresses"
             _metaschema-xml-id="/assembly/oscal-metadata/location/email-address"
             _metaschema-json-id="/assembly/oscal-metadata/location/email-addresses"
             max-occurs="unbounded"
             min-occurs="0"
             ref="email-address"
             _key-ref="oscal-metadata:email-address"
             _using-name="email-address"
             _in-xml-name="email-address"
             _in-json-name="email-addresses"&gt;
         &lt;group-as name="email-addresses" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;This is a contact email associated with the location.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;field _step="telephone-number"
             _key="telephone-numbers"
             _group-name="telephone-numbers"
             _metaschema-xml-id="/assembly/oscal-metadata/location/telephone-number"
             _metaschema-json-id="/assembly/oscal-metadata/location/telephone-numbers"
             max-occurs="unbounded"
             min-occurs="0"
             ref="telephone-number"
             _key-ref="oscal-metadata:telephone-number"
             _using-name="telephone-number"
             _in-xml-name="telephone-number"
             _in-json-name="telephone-numbers"&gt;
         &lt;group-as name="telephone-numbers" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A phone number used to contact the location.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;define-field _step="url"
                    _key="urls"
                    _group-name="urls"
                    _metaschema-xml-id="/assembly/oscal-metadata/location/url"
                    _metaschema-json-id="/assembly/oscal-metadata/location/urls"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="uri"
                    name="url"
                    _using-name="url"
                    _in-xml-name="url"
                    _in-json-name="urls"&gt;
         &lt;formal-name&gt;Location URL&lt;/formal-name&gt;
         &lt;description&gt;The uniform resource locator (URL) for a web site or Internet presence associated with the location.&lt;/description&gt;
         &lt;group-as name="urls" in-json="ARRAY"/&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/location/prop"
                _metaschema-json-id="/assembly/oscal-metadata/location/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/location/link"
                _metaschema-json-id="/assembly/oscal-metadata/location/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/location/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/location/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="type"&gt;Characterizes the kind of location.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='type']/@value" allow-other="yes"&gt;
         &lt;enum value="data-center"&gt;A location that contains computing assets. A &lt;code&gt;class&lt;/code&gt; can be used to indicate a subclass of data-center.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='type' and @value='data-center']/@class"
                      allow-other="yes"&gt;
         &lt;enum value="primary"&gt;The location is a data-center used for normal operations.&lt;/enum&gt;
         &lt;enum value="alternate"&gt;The location is a data-center used for fail-over or backup operations.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-metadata/location-uuid" class="toc1 head">Flag <code>location-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Location Reference</p>
      <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-metadata/location-uuid"
             _metaschema-json-id="/flag/oscal-metadata/location-uuid"
             as-type="uuid"
             scope="global"
             name="location-uuid"
             module="oscal-metadata"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:location-uuid"&gt;
   &lt;formal-name&gt;Location Reference&lt;/formal-name&gt;
   &lt;description&gt;References a &lt;code&gt;location&lt;/code&gt; defined in &lt;code&gt;metadata&lt;/code&gt;. &lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-location-uuid" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/location-uuid" class="toc1 head">Field <code>location-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Location Reference</p>
      <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/location-uuid"
              _metaschema-json-id="/field/oscal-metadata/location-uuid"
              collapsible="no"
              as-type="uuid"
              scope="global"
              name="location-uuid"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:location-uuid"&gt;
   &lt;formal-name&gt;Location Reference&lt;/formal-name&gt;
   &lt;description&gt;References a &lt;code&gt;location&lt;/code&gt; defined in &lt;code&gt;metadata&lt;/code&gt;. &lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-location-uuid" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/party" class="toc1 head">Assembly
         <code>party</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Party (organization or person)</p>
      <p class="description">A responsible entity which is either a person or an organization.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A mail stop associated with the party.</p>
            
            <p class="enum"><span class="lbl">enum</span>The name or number of the party's office.</p>
            
            <p class="enum"><span class="lbl">enum</span>The formal job title of a person.</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/party/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-metadata/party/type">Flag (defined inline) <code>type</code></li>
         <li id="/assembly/oscal-metadata/party/name">Field (defined inline) <code>name</code></li>
         <li id="/assembly/oscal-metadata/party/short-name">Field (defined inline) <code>short-name</code></li>
         <li id="/assembly/oscal-metadata/party/external-id">Field (defined inline) <code>external-id</code> - grouped as <code>external-ids</code></li>
         <li id="/assembly/oscal-metadata/party/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/party/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/party/email-address">Field (reference) <code>email-address</code> - grouped as <code>email-addresses</code></li>
         <li id="/assembly/oscal-metadata/party/telephone-number">Field (reference) <code>telephone-number</code> - grouped as <code>telephone-numbers</code></li>
         <li id="/assembly/oscal-metadata/party/address">Assembly (reference) <code>address</code> - grouped as <code>addresses</code></li>
         <li id="/assembly/oscal-metadata/party/location-uuid">Field (reference) <code>location-uuid</code> - grouped as <code>location-uuids</code></li>
         <li id="/assembly/oscal-metadata/party/member-of-organization">Field (defined inline) <code>member-of-organization</code> - grouped as <code>member-of-organizations</code></li>
         <li id="/assembly/oscal-metadata/party/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/party"
                 _metaschema-json-id="/assembly/oscal-metadata/party"
                 scope="global"
                 name="party"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:party"&gt;
   &lt;formal-name&gt;Party (organization or person)&lt;/formal-name&gt;
   &lt;description&gt;A responsible entity which is either a person or an organization.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-metadata/party/uuid"
                _metaschema-json-id="/assembly/oscal-metadata/party/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Party Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier that can be used to reference this defined location elsewhere in an OSCAL document. A UUID should be consistently used for a given party across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="type"
                _key="type"
                _metaschema-xml-id="/assembly/oscal-metadata/party/type"
                _metaschema-json-id="/assembly/oscal-metadata/party/type"
                required="yes"
                as-type="string"
                name="type"
                _using-name="type"
                _in-xml-name="type"
                _in-json-name="type"&gt;
      &lt;formal-name&gt;Party Type&lt;/formal-name&gt;
      &lt;description&gt;A category describing the kind of party the object describes.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="no"&gt;
            &lt;enum value="person"&gt;An individual.&lt;/enum&gt;
            &lt;enum value="organization"&gt;A group of individuals formed for a specific purpose.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="name"
                    _key="name"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/name"
                    _metaschema-json-id="/assembly/oscal-metadata/party/name"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="name"
                    _using-name="name"
                    _in-xml-name="name"
                    _in-json-name="name"&gt;
         &lt;formal-name&gt;Party Name&lt;/formal-name&gt;
         &lt;description&gt;The full name of the party. This is typically the legal name associated with the party.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="short-name"
                    _key="short-name"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/short-name"
                    _metaschema-json-id="/assembly/oscal-metadata/party/short-name"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="short-name"
                    _using-name="short-name"
                    _in-xml-name="short-name"
                    _in-json-name="short-name"&gt;
         &lt;formal-name&gt;Party Short Name&lt;/formal-name&gt;
         &lt;description&gt;A short common name, abbreviation, or acronym for the party.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="external-id"
                    _key="external-ids"
                    _group-name="external-ids"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/external-id"
                    _metaschema-json-id="/assembly/oscal-metadata/party/external-ids"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="external-id"
                    _using-name="external-id"
                    _in-xml-name="external-id"
                    _in-json-name="external-ids"&gt;
         &lt;formal-name&gt;Party External Identifier&lt;/formal-name&gt;
         &lt;description&gt;An identifier for a person or organization using a designated scheme. e.g. an Open Researcher and Contributor ID (ORCID)&lt;/description&gt;
         &lt;json-value-key&gt;id&lt;/json-value-key&gt;
         &lt;group-as name="external-ids" in-json="ARRAY"/&gt;
         &lt;define-flag _step="scheme"
                      _key="scheme"
                      _metaschema-xml-id="/assembly/oscal-metadata/party/external-id/scheme"
                      _metaschema-json-id="/assembly/oscal-metadata/party/external-ids/scheme"
                      required="yes"
                      as-type="uri"
                      name="scheme"
                      _using-name="scheme"
                      _in-xml-name="scheme"
                      _in-json-name="scheme"&gt;
            &lt;formal-name&gt;External Identifier Schema&lt;/formal-name&gt;
            &lt;description&gt;Indicates the type of external identifier.&lt;/description&gt;
            &lt;constraint&gt;
               &lt;allowed-values allow-other="yes"&gt;
                  &lt;enum value="https://orcid.org/"&gt;The identifier is Open Researcher and Contributor ID (ORCID).&lt;/enum&gt;
               &lt;/allowed-values&gt;
            &lt;/constraint&gt;
         &lt;/define-flag&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/party/prop"
                _metaschema-json-id="/assembly/oscal-metadata/party/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/party/link"
                _metaschema-json-id="/assembly/oscal-metadata/party/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="email-address"
             _key="email-addresses"
             _group-name="email-addresses"
             _metaschema-xml-id="/assembly/oscal-metadata/party/email-address"
             _metaschema-json-id="/assembly/oscal-metadata/party/email-addresses"
             max-occurs="unbounded"
             min-occurs="0"
             ref="email-address"
             _key-ref="oscal-metadata:email-address"
             _using-name="email-address"
             _in-xml-name="email-address"
             _in-json-name="email-addresses"&gt;
         &lt;group-as name="email-addresses" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;This is a contact email associated with the party.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;field _step="telephone-number"
             _key="telephone-numbers"
             _group-name="telephone-numbers"
             _metaschema-xml-id="/assembly/oscal-metadata/party/telephone-number"
             _metaschema-json-id="/assembly/oscal-metadata/party/telephone-numbers"
             max-occurs="unbounded"
             min-occurs="0"
             ref="telephone-number"
             _key-ref="oscal-metadata:telephone-number"
             _using-name="telephone-number"
             _in-xml-name="telephone-number"
             _in-json-name="telephone-numbers"&gt;
         &lt;group-as name="telephone-numbers" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;A phone number used to contact the party.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;choice&gt;
         &lt;assembly _step="address"
                   _key="addresses"
                   _group-name="addresses"
                   _metaschema-xml-id="/assembly/oscal-metadata/party/address"
                   _metaschema-json-id="/assembly/oscal-metadata/party/addresses"
                   max-occurs="unbounded"
                   min-occurs="0"
                   ref="address"
                   _key-ref="oscal-metadata:address"
                   _using-name="address"
                   _in-xml-name="address"
                   _in-json-name="addresses"&gt;
            &lt;group-as name="addresses" in-json="ARRAY"/&gt;
         &lt;/assembly&gt;
         &lt;field _step="location-uuid"
                _key="location-uuids"
                _group-name="location-uuids"
                _metaschema-xml-id="/assembly/oscal-metadata/party/location-uuid"
                _metaschema-json-id="/assembly/oscal-metadata/party/location-uuids"
                as-type="uuid"
                max-occurs="unbounded"
                min-occurs="0"
                ref="location-uuid"
                _key-ref="oscal-metadata:location-uuid"
                _using-name="location-uuid"
                _in-xml-name="location-uuid"
                _in-json-name="location-uuids"&gt;
            &lt;group-as name="location-uuids" in-json="ARRAY"/&gt;
         &lt;/field&gt;
      &lt;/choice&gt;
      &lt;define-field _step="member-of-organization"
                    _key="member-of-organizations"
                    _group-name="member-of-organizations"
                    _metaschema-xml-id="/assembly/oscal-metadata/party/member-of-organization"
                    _metaschema-json-id="/assembly/oscal-metadata/party/member-of-organizations"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="uuid"
                    name="member-of-organization"
                    _using-name="member-of-organization"
                    _in-xml-name="member-of-organization"
                    _in-json-name="member-of-organizations"&gt;
         &lt;formal-name&gt;Organizational Affiliation&lt;/formal-name&gt;
         &lt;description&gt;Identifies that the party object is a member of the organization associated with the provided UUID.&lt;/description&gt;
         &lt;group-as name="member-of-organizations" in-json="ARRAY"/&gt;
         &lt;constraint&gt;
            &lt;index-has-key name="index-metadata-party-organizations-uuid" target="."&gt;
               &lt;key-field target="value()"/&gt;
            &lt;/index-has-key&gt;
         &lt;/constraint&gt;
         &lt;remarks&gt;
            &lt;p&gt;Parties of both the &lt;code&gt;person&lt;/code&gt; or &lt;code&gt;organization&lt;/code&gt; type can be associated with an organization using the &lt;code&gt;member-of-organization&lt;/code&gt;. &lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-field&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/party/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/party/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name"&gt;
         &lt;enum value="mail-stop"&gt;A mail stop associated with the party.&lt;/enum&gt;
         &lt;enum value="office"&gt;The name or number of the party's office.&lt;/enum&gt;
         &lt;enum value="job-title"&gt;The formal job title of a person.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/party-uuid" class="toc1 head">Field <code>party-uuid</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Party Reference</p>
      <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/party-uuid"
              _metaschema-json-id="/field/oscal-metadata/party-uuid"
              collapsible="no"
              as-type="uuid"
              scope="global"
              name="party-uuid"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:party-uuid"&gt;
   &lt;formal-name&gt;Party Reference&lt;/formal-name&gt;
   &lt;description&gt;References a &lt;code&gt;party&lt;/code&gt; defined in &lt;code&gt;metadata&lt;/code&gt;. &lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-party-uuid" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/role" class="toc1 head">Assembly
         <code>role</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Role</p>
      <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
      <div class="remarks">
         <p class="p">Permissible values to be determined closer to the application (e.g. by a receiving
            authority).</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/role/id">Flag (defined inline) <code>id</code></li>
         <li id="/assembly/oscal-metadata/role/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-metadata/role/short-name">Field (defined inline) <code>short-name</code></li>
         <li id="/assembly/oscal-metadata/role/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-metadata/role/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/role/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/role/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/role"
                 _metaschema-json-id="/assembly/oscal-metadata/role"
                 scope="global"
                 name="role"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:role"&gt;
   &lt;formal-name&gt;Role&lt;/formal-name&gt;
   &lt;description&gt;Defines a function assumed or expected to be assumed by a party in a specific situation.&lt;/description&gt;
   &lt;define-flag _step="id"
                _key="id"
                _metaschema-xml-id="/assembly/oscal-metadata/role/id"
                _metaschema-json-id="/assembly/oscal-metadata/role/id"
                required="yes"
                as-type="NCName"
                name="id"
                _using-name="id"
                _in-xml-name="id"
                _in-json-name="id"&gt;
      &lt;formal-name&gt;Role Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier for a specific role instance. This identifier's uniqueness is document scoped and is intended to be consistent for the same role across minor revisions of the document.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;OSCAL has defined a set of standardized roles for consistent use in OSCAL documents. This allows tools consuming OSCAL content to infer specific semantics when these roles are used. These roles are documented in the specific contexts of their use (e.g., responsible-party, responsible-role). When using such a role, it is necessary to define these roles in this list, which will then allow such a role to be referenced.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-metadata/role/title"
                    _metaschema-json-id="/assembly/oscal-metadata/role/title"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Role Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the role, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="short-name"
                    _key="short-name"
                    _metaschema-xml-id="/assembly/oscal-metadata/role/short-name"
                    _metaschema-json-id="/assembly/oscal-metadata/role/short-name"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="short-name"
                    _using-name="short-name"
                    _in-xml-name="short-name"
                    _in-json-name="short-name"&gt;
         &lt;formal-name&gt;Role Short Name&lt;/formal-name&gt;
         &lt;description&gt;A short common name, abbreviation, or acronym for the role.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-metadata/role/description"
                    _metaschema-json-id="/assembly/oscal-metadata/role/description"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Role Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the role's purpose and associated responsibilities.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/role/prop"
                _metaschema-json-id="/assembly/oscal-metadata/role/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/role/link"
                _metaschema-json-id="/assembly/oscal-metadata/role/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/role/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/role/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;Permissible values to be determined closer to the application (e.g. by a receiving authority).&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/role-id" class="toc1 head">Field <code>role-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Role Identifier Reference</p>
      <p class="description">A reference to the roles served by the user.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/role-id"
              _metaschema-json-id="/field/oscal-metadata/role-id"
              collapsible="no"
              as-type="NCName"
              scope="global"
              name="role-id"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:role-id"&gt;
   &lt;formal-name&gt;Role Identifier Reference&lt;/formal-name&gt;
   &lt;description&gt;A reference to the roles served by the user.&lt;/description&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-role-id" target="."&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/back-matter" class="toc1 head">Assembly
         <code>back-matter</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Back matter</p>
      <p class="description">A collection of resources, which may be included directly or by reference.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index">
            <p class="element-label"><span class="lbl">index</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">Provides a collection of identified <code>resource</code> objects that can be referenced by a <code>link</code> with a <code>rel</code> value of "reference" and an <code>href</code> value that is a fragment "#" followed by a reference to a reference identifier. Other
            specialized link "rel" values also use this pattern when indicated in that context
            of use.</p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         
         <p class="description">Use of link, citation, and resource</p>
         
         <div class="remarks">
            <p class="p">The following is a contrived example to show the use of link, citation, and resource.</p>
         </div>
         
         <div class="profile">
            <p class="element-label"><span class="lbl">profile</span></p>
            
            <div class="metadata">
               <p class="element-label"><span class="lbl">metadata</span></p>
               
               <p class="link"><span class="lbl">link</span>My citation</p>
               </div>
            
            <div class="back-matter">
               <p class="element-label"><span class="lbl">back-matter</span></p>
               
               <div class="resource">
                  <p class="element-label"><span class="lbl">resource</span></p>
                  
                  <div class="rlink">
                     <p class="element-label"><span class="lbl">rlink</span></p>
                  </div>
                  </div>
               </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/back-matter/resource">Assembly (defined inline) <code>resource</code> - grouped as <code>resources</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/back-matter"
                 _metaschema-json-id="/assembly/oscal-metadata/back-matter"
                 scope="global"
                 name="back-matter"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:back-matter"&gt;
   &lt;formal-name&gt;Back matter&lt;/formal-name&gt;
   &lt;description&gt;A collection of resources, which may be included directly or by reference.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-assembly _step="resource"
                       _key="resources"
                       _group-name="resources"
                       _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource"
                       _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="resource"
                       _using-name="resource"
                       _in-xml-name="resource"
                       _in-json-name="resources"&gt;
         &lt;formal-name&gt;Resource&lt;/formal-name&gt;
         &lt;description&gt;A resource associated with content in the containing document. A resource may be directly included in the document base64 encoded or may point to one or more equivalent internet resources.&lt;/description&gt;
         &lt;group-as name="resources" in-json="ARRAY"/&gt;
         &lt;define-flag _step="uuid"
                      _key="uuid"
                      _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/uuid"
                      _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/uuid"
                      required="yes"
                      as-type="uuid"
                      name="uuid"
                      _using-name="uuid"
                      _in-xml-name="uuid"
                      _in-json-name="uuid"&gt;
            &lt;formal-name&gt;Resource Universally Unique Identifier&lt;/formal-name&gt;
            &lt;description&gt;A globally unique identifier that can be used to reference this defined resource elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;model&gt;
            &lt;define-field _step="title"
                          _key="title"
                          _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/title"
                          _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/title"
                          max-occurs="1"
                          min-occurs="0"
                          collapsible="no"
                          as-type="markup-line"
                          name="title"
                          _using-name="title"
                          _in-xml-name="title"
                          _in-json-name="title"&gt;
               &lt;formal-name&gt;Resource Title&lt;/formal-name&gt;
               &lt;description&gt;A name given to the resource, which may be used by a tool for display and navigation.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;define-field _step="description"
                          _key="description"
                          _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/description"
                          _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/description"
                          max-occurs="1"
                          min-occurs="0"
                          in-xml="WITH_WRAPPER"
                          collapsible="no"
                          as-type="markup-multiline"
                          name="description"
                          _using-name="description"
                          _in-xml-name="description"
                          _in-json-name="description"&gt;
               &lt;formal-name&gt;Resource Description&lt;/formal-name&gt;
               &lt;description&gt;A short summary of the resource used to indicate the purpose of the resource.&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/prop"
                      _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;field _step="document-id"
                   _key="document-ids"
                   _group-name="document-ids"
                   _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/document-id"
                   _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/document-ids"
                   max-occurs="unbounded"
                   min-occurs="0"
                   ref="document-id"
                   _key-ref="oscal-metadata:document-id"
                   _using-name="document-id"
                   _in-xml-name="document-id"
                   _in-json-name="document-ids"&gt;
               &lt;group-as name="document-ids" in-json="ARRAY"/&gt;
            &lt;/field&gt;
            &lt;define-assembly _step="citation"
                             _key="citation"
                             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation"
                             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation"
                             max-occurs="1"
                             min-occurs="0"
                             name="citation"
                             _using-name="citation"
                             _in-xml-name="citation"
                             _in-json-name="citation"&gt;
               &lt;formal-name&gt;Citation&lt;/formal-name&gt;
               &lt;description&gt;A citation consisting of end note text and optional structured bibliographic data.&lt;/description&gt;
               &lt;model&gt;
                  &lt;define-field _step="text"
                                _key="text"
                                _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation/text"
                                _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation/text"
                                max-occurs="1"
                                min-occurs="1"
                                collapsible="no"
                                as-type="markup-line"
                                name="text"
                                _using-name="text"
                                _in-xml-name="text"
                                _in-json-name="text"&gt;
                     &lt;formal-name&gt;Citation Text&lt;/formal-name&gt;
                     &lt;description&gt;A line of citation text.&lt;/description&gt;
                  &lt;/define-field&gt;
                  &lt;assembly _step="prop"
                            _key="props"
                            _group-name="props"
                            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation/prop"
                            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation/props"
                            max-occurs="unbounded"
                            min-occurs="0"
                            ref="property"
                            _key-ref="oscal-metadata:property"
                            _using-name="prop"
                            _in-xml-name="prop"
                            _in-json-name="props"&gt;
                     &lt;group-as name="props" in-json="ARRAY"/&gt;
                  &lt;/assembly&gt;
                  &lt;define-assembly _step="biblio"
                                   _key="biblio"
                                   _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation/biblio"
                                   _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation/biblio"
                                   max-occurs="1"
                                   min-occurs="0"
                                   name="biblio"
                                   _using-name="biblio"
                                   _in-xml-name="biblio"
                                   _in-json-name="biblio"&gt;
                     &lt;formal-name&gt;Bibliographic Definition&lt;/formal-name&gt;
                     &lt;description&gt;A container for structured bibliographic information. The model of this information is undefined by OSCAL.&lt;/description&gt;
                     &lt;model&gt;
                        &lt;any/&gt;
                     &lt;/model&gt;
                  &lt;/define-assembly&gt;
               &lt;/model&gt;
               &lt;remarks&gt;
                  &lt;p&gt;The &lt;code&gt;text&lt;/code&gt; is used to define the endnote text, without any required bibliographic structure. If structured bibliographic data is needed, then the &lt;code&gt;biblio&lt;/code&gt; can be used for this purpose.&lt;/p&gt;
                  &lt;p&gt;A &lt;code&gt;biblio&lt;/code&gt; can be used to capture a structured bibliographical citation in an appropriate format.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/define-assembly&gt;
            &lt;define-assembly _step="rlink"
                             _key="rlinks"
                             _group-name="rlinks"
                             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink"
                             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks"
                             max-occurs="unbounded"
                             min-occurs="0"
                             name="rlink"
                             _using-name="rlink"
                             _in-xml-name="rlink"
                             _in-json-name="rlinks"&gt;
               &lt;formal-name&gt;Resource link&lt;/formal-name&gt;
               &lt;description&gt;A pointer to an external resource with an optional hash for verification and change detection.&lt;/description&gt;
               &lt;group-as name="rlinks" in-json="ARRAY"/&gt;
               &lt;define-flag _step="href"
                            _key="href"
                            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/href"
                            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/href"
                            required="yes"
                            as-type="uri-reference"
                            name="href"
                            _using-name="href"
                            _in-xml-name="href"
                            _in-json-name="href"&gt;
                  &lt;formal-name&gt;Hypertext Reference&lt;/formal-name&gt;
                  &lt;description&gt;A resolvable URI reference to a resource.&lt;/description&gt;
               &lt;/define-flag&gt;
               &lt;flag _step="media-type"
                     _key="media-type"
                     _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/media-type"
                     _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/media-type"
                     as-type="string"
                     required="no"
                     ref="media-type"
                     _key-ref="oscal-metadata:media-type"
                     _using-name="media-type"
                     _in-xml-name="media-type"
                     _in-json-name="media-type"/&gt;
               &lt;model&gt;
                  &lt;field _step="hash"
                         _key="hashes"
                         _group-name="hashes"
                         _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/hash"
                         _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/hashes"
                         max-occurs="unbounded"
                         min-occurs="0"
                         ref="hash"
                         _key-ref="oscal-metadata:hash"
                         _using-name="hash"
                         _in-xml-name="hash"
                         _in-json-name="hashes"&gt;
                     &lt;group-as name="hashes" in-json="ARRAY"/&gt;
                     &lt;remarks&gt;
                        &lt;p&gt;When appearing as part of a &lt;code&gt;resource/rlink&lt;/code&gt;, the hash applies to the resource referenced by the &lt;code&gt;href&lt;/code&gt;. &lt;/p&gt;
                     &lt;/remarks&gt;
                  &lt;/field&gt;
               &lt;/model&gt;
               &lt;remarks&gt;
                  &lt;p&gt;This construct is different from &lt;code&gt;link&lt;/code&gt;, which makes no provision for a hash or formal title.&lt;/p&gt;
                  &lt;p&gt;Multiple &lt;code&gt;rlink&lt;/code&gt; can be included for a resource. In such a case, all provided &lt;code&gt;rlink&lt;/code&gt; items are intended to be equivalent in content, but may differ in structure. A &lt;code&gt;media-type&lt;/code&gt; is used to identify the format of a given rlink, and can be used to differentiate a items in a collection of rlinks. The &lt;code&gt;media-type&lt;/code&gt; also provides a hint to the OSCAL document consumer about the structure of the resource referenced by the &lt;code&gt;rlink&lt;/code&gt;. &lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/define-assembly&gt;
            &lt;define-field _step="base64"
                          _key="base64"
                          _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64"
                          _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64"
                          max-occurs="1"
                          min-occurs="0"
                          collapsible="no"
                          as-type="base64Binary"
                          name="base64"
                          _using-name="base64"
                          _in-xml-name="base64"
                          _in-json-name="base64"&gt;
               &lt;formal-name&gt;Base64&lt;/formal-name&gt;
               &lt;description&gt;The Base64 alphabet in RFC 2045 - aligned with XSD.&lt;/description&gt;
               &lt;json-value-key&gt;value&lt;/json-value-key&gt;
               &lt;define-flag _step="filename"
                            _key="filename"
                            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64/filename"
                            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64/filename"
                            required="no"
                            as-type="uri-reference"
                            name="filename"
                            _using-name="filename"
                            _in-xml-name="filename"
                            _in-json-name="filename"&gt;
                  &lt;formal-name&gt;File Name&lt;/formal-name&gt;
                  &lt;description&gt;Name of the file before it was encoded as Base64 to be embedded in a &lt;code&gt;resource&lt;/code&gt;. This is the name that will be assigned to the file when the file is decoded.&lt;/description&gt;
               &lt;/define-flag&gt;
               &lt;flag _step="media-type"
                     _key="media-type"
                     _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64/media-type"
                     _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64/media-type"
                     as-type="string"
                     required="no"
                     ref="media-type"
                     _key-ref="oscal-metadata:media-type"
                     _using-name="media-type"
                     _in-xml-name="media-type"
                     _in-json-name="media-type"/&gt;
            &lt;/define-field&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/remarks"
                   _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;allowed-values target="prop/@name"&gt;
               &lt;enum value="type"&gt;Identifies the type of resource represented.&lt;/enum&gt;
               &lt;enum value="version"&gt;For resources representing a published document, this represents the version number of that document.&lt;/enum&gt;
               &lt;enum value="published"&gt;For resources representing a published document, this represents the publication date of that document.&lt;/enum&gt;
            &lt;/allowed-values&gt;
            &lt;matches target="prop[(not(exists(@ns)) or @ns='http://csrc.nist.gov/ns/oscal') and @name='published']/@value"
                     datatype="dateTime"/&gt;
            &lt;allowed-values target="prop[@name='type']/@value" allow-other="yes"&gt;
               &lt;enum value="logo"&gt;Indicates the resource is an organization's logo.&lt;/enum&gt;
               &lt;enum value="image"&gt;Indicates the resource represents an image.&lt;/enum&gt;
               &lt;enum value="screen-shot"&gt;Indicates the resource represents an image of screen content. &lt;/enum&gt;
               &lt;enum value="law"&gt;Indicates the resource represents an applicable law.&lt;/enum&gt;
               &lt;enum value="regulation"&gt;Indicates the resource represents an applicable regulation.&lt;/enum&gt;
               &lt;enum value="standard"&gt;Indicates the resource represents an applicable standard.&lt;/enum&gt;
               &lt;enum value="external-guidance"&gt;Indicates the resource represents applicable guidance.&lt;/enum&gt;
               &lt;enum value="acronyms"&gt;Indicates the resource provides a list of relevant acronyms.&lt;/enum&gt;
               &lt;enum value="citation"&gt;Indicates the resource cites relevant information.&lt;/enum&gt;
               &lt;enum value="policy"&gt;Indicates the resource is a policy.&lt;/enum&gt;
               &lt;enum value="procedure"&gt;Indicates the resource is a procedure.&lt;/enum&gt;
               &lt;enum value="system-guide"&gt;Indicates the resource is guidance document related to the subject system of an SSP.&lt;/enum&gt;
               &lt;enum value="users-guide"&gt;Indicates the resource is guidance document a user's guide or administrator's guide.&lt;/enum&gt;
               &lt;enum value="administrators-guide"&gt;Indicates the resource is guidance document a administrator's guide.&lt;/enum&gt;
               &lt;enum value="rules-of-behavior"&gt;Indicates the resource represents rules of behavior content.&lt;/enum&gt;
               &lt;enum value="plan"&gt;Indicates the resource represents a plan.&lt;/enum&gt;
               &lt;enum value="artifact"&gt;Indicates the resource represents an artifact, such as may be reviewed by an assessor.&lt;/enum&gt;
               &lt;enum value="evidence"&gt;Indicates the resource represents evidence, such as to support an assessment findiing.&lt;/enum&gt;
               &lt;enum value="tool-output"&gt;Indicates the resource represents output from a tool.&lt;/enum&gt;
               &lt;enum value="raw-data"&gt;Indicates the resource represents machine data, which may require a tool or analysis for interpretation or presentation.&lt;/enum&gt;
               &lt;enum value="interview-notes"&gt;Indicates the resource represents notes from an interview, such as may be collected during an assessment.&lt;/enum&gt;
               &lt;enum value="questionnaire"&gt;Indicates the resource is a set of questions, possibly with responses.&lt;/enum&gt;
               &lt;enum value="report"&gt;Indicates the resource is a report.&lt;/enum&gt;
               &lt;enum value="agreement"&gt;Indicates the resource is a formal agreement between two or more parties.&lt;/enum&gt;
            &lt;/allowed-values&gt;
            &lt;has-cardinality target="rlink|base64" min-occurs="1"/&gt;
            &lt;is-unique name="unique-resource-rlink-href" target="rlink"&gt;
               &lt;key-field target="@href"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Ensures that each rlink item references a unique resource.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
            &lt;is-unique name="unique-resource-base64-filename" target="base64"&gt;
               &lt;key-field target="@filename"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Ensures that all base64 resources have a unique &lt;code&gt;filename&lt;/code&gt;. &lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
            &lt;require when="citation"&gt;
               &lt;has-cardinality target="title" min-occurs="1"&gt;
                  &lt;remarks&gt;
                     &lt;p&gt;A &lt;code&gt;title&lt;/code&gt; is required when a citation is provided.&lt;/p&gt;
                  &lt;/remarks&gt;
               &lt;/has-cardinality&gt;
            &lt;/require&gt;
         &lt;/constraint&gt;
         &lt;remarks&gt;
            &lt;p&gt;A resource can be used in two ways. 1) it may point to an specific retrievable network resource using a &lt;code&gt;rlink&lt;/code&gt;, or 2) it may be included as an attachment using a &lt;code&gt;base64&lt;/code&gt;. A resource may contain multiple &lt;code&gt;rlink&lt;/code&gt; and &lt;code&gt;base64&lt;/code&gt; entries that represent alternative download locations (rlink) and attachments (base64) for the same resource. Both rlink and base64 allow for a &lt;code&gt;media-type&lt;/code&gt; to be specified, which is used to distinguish between different representations of the same resource (e.g., Microsoft Word, PDF). When multiple &lt;code&gt;rlink&lt;/code&gt; and &lt;code&gt;base64&lt;/code&gt; items are included for a given resource, all items must contain equivalent information. This allows the document consumer to choose a preferred item to process based on a the selected item's &lt;code&gt;media-type&lt;/code&gt;. This is extremely important when the items represent OSCAL content that is represented in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed from any of the available formats indicated by the items.&lt;/p&gt;
            &lt;p&gt;When a resource includes a citation, then the &lt;code&gt;title&lt;/code&gt; and &lt;code&gt;citation&lt;/code&gt; properties must both be included.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-assembly&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;index name="index-back-matter-resource" target="resource"&gt;
         &lt;key-field target="@uuid"/&gt;
      &lt;/index&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;Provides a collection of identified &lt;code&gt;resource&lt;/code&gt; objects that can be referenced by a &lt;code&gt;link&lt;/code&gt; with a &lt;code&gt;rel&lt;/code&gt; value of "reference" and an &lt;code&gt;href&lt;/code&gt; value that is a fragment "#" followed by a reference to a reference identifier. Other specialized link "rel" values also use this pattern when indicated in that context of use.&lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;description&gt;Use of link, citation, and resource&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The following is a contrived example to show the use of link, citation, and resource.&lt;/p&gt;
      &lt;/remarks&gt;
      &lt;profile xmlns="http://csrc.nist.gov/ns/oscal/1.0"&gt;
         &lt;metadata&gt;
            &lt;link rel="citation" href="#resource1"&gt;My citation&lt;/link&gt;
         &lt;/metadata&gt;
         &lt;back-matter&gt;
            &lt;resource id="resource1"&gt;
               &lt;rlink href="https://example.org/some-resource"/&gt;
            &lt;/resource&gt;
         &lt;/back-matter&gt;
      &lt;/profile&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/property" class="toc1 head">Assembly
         <code>property</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Property</p>
      <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
         qualified name/value pair. The value of a property is a simple scalar value, which
         may be expressed as a list of values.</p>
      <p class="use-name"><span class="lbl">use-name</span>prop</p>
      <div class="remarks">
         <p class="p">Properties permit the deployment and management of arbitrary controlled values, within
            OSCAL objects. A property can be included for any purpose useful to an application
            or implementation. Typically, properties will be used to sort, filter, select, order,
            and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
            an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
            lexical composition of properties may be constrained by external processes to ensure
            consistency.</p>
         <p class="p">Property allows for associated remarks that describe why the specific property value
            was applied to the containing object, or the significance of the value in the context
            of the containing object.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/property/name">Flag (defined inline) <code>name</code></li>
         <li id="/assembly/oscal-metadata/property/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-metadata/property/ns">Flag (defined inline) <code>ns</code></li>
         <li id="/assembly/oscal-metadata/property/value">Flag (defined inline) <code>value</code></li>
         <li id="/assembly/oscal-metadata/property/class">Flag (defined inline) <code>class</code></li>
         <li id="/assembly/oscal-metadata/property/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/property"
                 _metaschema-json-id="/assembly/oscal-metadata/property"
                 scope="global"
                 name="property"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:property"&gt;
   &lt;formal-name&gt;Property&lt;/formal-name&gt;
   &lt;description&gt;An attribute, characteristic, or quality of the containing object expressed as a namespace qualified name/value pair. The value of a property is a simple scalar value, which may be expressed as a list of values.&lt;/description&gt;
   &lt;use-name&gt;prop&lt;/use-name&gt;
   &lt;define-flag _step="name"
                _key="name"
                _metaschema-xml-id="/assembly/oscal-metadata/property/name"
                _metaschema-json-id="/assembly/oscal-metadata/property/name"
                required="yes"
                as-type="NCName"
                name="name"
                _using-name="name"
                _in-xml-name="name"
                _in-json-name="name"&gt;
      &lt;formal-name&gt;Property Name&lt;/formal-name&gt;
      &lt;description&gt;A textual label that uniquely identifies a specific attribute, characteristic, or quality of the property's containing object.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="marking"&gt;A label or descriptor that is tied to a sensitivity or classification marking system. An optional class can be used to define the specific marking system used for the associated value.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-metadata/property/uuid"
                _metaschema-json-id="/assembly/oscal-metadata/property/uuid"
                required="no"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Property Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier that can be used to reference this property elsewhere in an OSCAL document. A UUID should be consistently used for a given location across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="ns"
                _key="ns"
                _metaschema-xml-id="/assembly/oscal-metadata/property/ns"
                _metaschema-json-id="/assembly/oscal-metadata/property/ns"
                required="no"
                as-type="uri"
                name="ns"
                _using-name="ns"
                _in-xml-name="ns"
                _in-json-name="ns"&gt;
      &lt;formal-name&gt;Property Namespace&lt;/formal-name&gt;
      &lt;description&gt;A namespace qualifying the property's name. This allows different organizations to associate distinct semantics with the same name.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;Provides a means to segment the value space for the &lt;code&gt;name&lt;/code&gt;, so that different organizations and individuals can assert control over the allowed names and associated values used in a property. This allows the semantics associated with a given name/value pair to be defined on an organization-by-organization basis.&lt;/p&gt;
         &lt;p&gt;An organization MUST use a URI that they have control over. e.g., a domain registered to the organization in a URI, a registered uniform resource names (URN) namespace.&lt;/p&gt;
         &lt;p&gt;When a &lt;code&gt;ns&lt;/code&gt; is not provided, its value should be assumed to be &lt;code&gt;http://csrc.nist.gov/ns/oscal&lt;/code&gt; and the name should be a name defined by the associated OSCAL model.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="value"
                _key="value"
                _metaschema-xml-id="/assembly/oscal-metadata/property/value"
                _metaschema-json-id="/assembly/oscal-metadata/property/value"
                required="yes"
                as-type="string"
                name="value"
                _using-name="value"
                _in-xml-name="value"
                _in-json-name="value"&gt;
      &lt;formal-name&gt;Property Value&lt;/formal-name&gt;
      &lt;description&gt;Indicates the value of the attribute, characteristic, or quality.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="class"
                _key="class"
                _metaschema-xml-id="/assembly/oscal-metadata/property/class"
                _metaschema-json-id="/assembly/oscal-metadata/property/class"
                required="no"
                as-type="NCName"
                name="class"
                _using-name="class"
                _in-xml-name="class"
                _in-json-name="class"&gt;
      &lt;formal-name&gt;Property Class&lt;/formal-name&gt;
      &lt;description&gt;A textual label that provides a sub-type or characterization of the property's &lt;code&gt;name&lt;/code&gt;. This can be used to further distinguish or discriminate between the semantics of multiple properties of the same object with the same &lt;code&gt;name&lt;/code&gt; and &lt;code&gt;ns&lt;/code&gt;. &lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/property/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/property/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;Properties permit the deployment and management of arbitrary controlled values, within OSCAL objects. A property can be included for any purpose useful to an application or implementation. Typically, properties will be used to sort, filter, select, order, and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the lexical composition of properties may be constrained by external processes to ensure consistency.&lt;/p&gt;
      &lt;p&gt;Property allows for associated remarks that describe why the specific property value was applied to the containing object, or the significance of the value in the context of the containing object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/link" class="toc1 head">Assembly
         <code>link</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Link</p>
      <p class="description">A reference to a local or remote resource</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="require">
            <p class="element-label"><span class="lbl">require</span></p>
            
            <div class="require">
               <p class="element-label"><span class="lbl">require</span></p>
               
               <div class="matches">
                  <p class="element-label"><span class="lbl">matches</span></p>
               </div>
               
               <div class="index-has-key">
                  <p class="element-label"><span class="lbl">index-has-key</span></p>
                  
                  <div class="key-field">
                     <p class="element-label"><span class="lbl">key-field</span></p>
                  </div>
                  </div>
               </div>
            
            <div class="require">
               <p class="element-label"><span class="lbl">require</span></p>
               
               <div class="matches">
                  <p class="element-label"><span class="lbl">matches</span></p>
               </div>
               </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">To provide a cryptographic hash for a remote target resource, a local reference to
            a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
         <p class="p">The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <p class="description">Providing for link integrity</p>
         
         <div class="remarks">
            <p class="p">The following is a contrived example to show the use of link, citation, and resource.</p>
         </div>
         
         <p class="oscal"><span class="lbl">oscal</span>
            
            <p class="link"><span class="lbl">link</span>My Hashed Resource</p>
            ...snip...
            
            <div class="back-matter">
               <p class="element-label"><span class="lbl">back-matter</span></p>
               
               <div class="resource">
                  <p class="element-label"><span class="lbl">resource</span></p>
                  
                  <div class="rlink">
                     <p class="element-label"><span class="lbl">rlink</span></p>
                     
                     <p class="hash"><span class="lbl">hash</span>C2E9C1..snip..F88D2E</p>
                     </div>
                  </div>
               </div>
            </p>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/link/href">Flag (defined inline) <code>href</code></li>
         <li id="/assembly/oscal-metadata/link/rel">Flag (defined inline) <code>rel</code></li>
         <li id="/assembly/oscal-metadata/link/media-type">Flag (reference) <code>media-type</code></li>
         <li id="/assembly/oscal-metadata/link/text">Field (defined inline) <code>text</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/link"
                 _metaschema-json-id="/assembly/oscal-metadata/link"
                 scope="global"
                 name="link"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:link"&gt;
   &lt;formal-name&gt;Link&lt;/formal-name&gt;
   &lt;description&gt;A reference to a local or remote resource&lt;/description&gt;
   &lt;define-flag _step="href"
                _key="href"
                _metaschema-xml-id="/assembly/oscal-metadata/link/href"
                _metaschema-json-id="/assembly/oscal-metadata/link/href"
                required="yes"
                as-type="uri-reference"
                name="href"
                _using-name="href"
                _in-xml-name="href"
                _in-json-name="href"&gt;
      &lt;formal-name&gt;Hypertext Reference&lt;/formal-name&gt;
      &lt;description&gt;A resolvable URL reference to a resource.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The value of the &lt;code&gt;href&lt;/code&gt; can be an internet resource, or a local reference using a fragment e.g. #fragment that points to a &lt;code&gt;back-matter&lt;/code&gt;
            &lt;code&gt;resource&lt;/code&gt; in the same document.&lt;/p&gt;
         &lt;p&gt;If a local reference using a fragment is used, this will be indicated by a fragment "#" followed by an identifier which references an identified &lt;code&gt;resource&lt;/code&gt; in the document's &lt;code&gt;back-matter&lt;/code&gt; or another object that is within the scope of the containing OSCAL document.&lt;/p&gt;
         &lt;p&gt;If an internet resource is used, the &lt;code&gt;href&lt;/code&gt; value will be an absolute or relative URI pointing to the location of the referenced resource. A relative URI will be resolved relative to the location of the document containing the link.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="rel"
                _key="rel"
                _metaschema-xml-id="/assembly/oscal-metadata/link/rel"
                _metaschema-json-id="/assembly/oscal-metadata/link/rel"
                required="no"
                as-type="NCName"
                name="rel"
                _using-name="rel"
                _in-xml-name="rel"
                _in-json-name="rel"&gt;
      &lt;formal-name&gt;Relation&lt;/formal-name&gt;
      &lt;description&gt;Describes the type of relationship provided by the link. This can be an indicator of the link's purpose.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="reference"&gt;Reference&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;flag _step="media-type"
         _key="media-type"
         _metaschema-xml-id="/assembly/oscal-metadata/link/media-type"
         _metaschema-json-id="/assembly/oscal-metadata/link/media-type"
         as-type="string"
         required="no"
         ref="media-type"
         _key-ref="oscal-metadata:media-type"
         _using-name="media-type"
         _in-xml-name="media-type"
         _in-json-name="media-type"&gt;
      &lt;remarks&gt;
         &lt;p&gt;The &lt;code&gt;media-type&lt;/code&gt; provides a hint about the content model of the referenced resource. A valid entry from the &lt;a href="https://www.iana.org/assignments/media-types/media-types.xhtml"&gt;IANA Media Types registry&lt;/a&gt; SHOULD be used.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/flag&gt;
   &lt;model&gt;
      &lt;define-field _step="text"
                    _key="text"
                    _metaschema-xml-id="/assembly/oscal-metadata/link/text"
                    _metaschema-json-id="/assembly/oscal-metadata/link/text"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="text"
                    _using-name="text"
                    _in-xml-name="text"
                    _in-json-name="text"&gt;
         &lt;formal-name&gt;Link Text&lt;/formal-name&gt;
         &lt;description&gt;A textual label to associate with the link, which may be used for presentation in a tool.&lt;/description&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;require when="@rel=('reference')"&gt;
         &lt;require when="starts-with(@href,'#')"&gt;
            &lt;matches target="@href" datatype="uri-reference"/&gt;
            &lt;index-has-key name="index-back-matter-resource" target="."&gt;
               &lt;key-field target="@href" pattern="#(.*)"/&gt;
            &lt;/index-has-key&gt;
         &lt;/require&gt;
         &lt;require when="not(starts-with(@href,'#'))"&gt;
            &lt;matches target="@href" datatype="uri"/&gt;
         &lt;/require&gt;
      &lt;/require&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;To provide a cryptographic hash for a remote target resource, a local reference to a back matter &lt;code&gt;resource&lt;/code&gt; is needed. The resource allows one or more hash values to be provided using the &lt;code&gt;rlink/hash&lt;/code&gt; object.&lt;/p&gt;
      &lt;p&gt;The OSCAL &lt;code&gt;link&lt;/code&gt; is a roughly based on the HTML &lt;a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK"&gt;link element&lt;/a&gt;. &lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;description&gt;Providing for link integrity&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The following is a contrived example to show the use of link, citation, and resource.&lt;/p&gt;
      &lt;/remarks&gt;
      &lt;oscal xmlns="http://csrc.nist.gov/ns/oscal/1.0"&gt;
         &lt;link rel="reference" href="#resource1"&gt;My Hashed Resource&lt;/link&gt;
        ...snip...
                &lt;back-matter&gt;
            &lt;resource id="resource1"&gt;
               &lt;rlink href="https://example.org/some-resource"&gt;
                  &lt;hash algorithm="sha512"&gt;C2E9C1..snip..F88D2E&lt;/hash&gt;
               &lt;/rlink&gt;
            &lt;/resource&gt;
         &lt;/back-matter&gt;
      &lt;/oscal&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/responsible-party" class="toc1 head">Assembly
         <code>responsible-party</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Responsible Party</p>
      <p class="description">A reference to a set of organizations or persons that have responsibility for performing
         a referenced role in the context of the containing object.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-metadata/responsible-party/role-id">Flag (defined inline) <code>role-id</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/party-uuid">Field (reference) <code>party-uuid</code> - grouped as <code>party-uuids</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/responsible-party/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/responsible-party"
                 _metaschema-json-id="/assembly/oscal-metadata/responsible-party"
                 scope="global"
                 name="responsible-party"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:responsible-party"&gt;
   &lt;formal-name&gt;Responsible Party&lt;/formal-name&gt;
   &lt;description&gt;A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.&lt;/description&gt;
   &lt;define-flag _step="role-id"
                _key="role-id"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/role-id"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-party/role-id"
                required="yes"
                as-type="NCName"
                name="role-id"
                _using-name="role-id"
                _in-xml-name="role-id"
                _in-json-name="role-id"&gt;
      &lt;formal-name&gt;Responsible Role&lt;/formal-name&gt;
      &lt;description&gt;The role that the party is responsible for.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;field _step="party-uuid"
             _key="party-uuids"
             _group-name="party-uuids"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/party-uuid"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-party/party-uuids"
             max-occurs="unbounded"
             min-occurs="1"
             ref="party-uuid"
             _key-ref="oscal-metadata:party-uuid"
             _using-name="party-uuid"
             _in-xml-name="party-uuid"
             _in-json-name="party-uuids"&gt;
         &lt;group-as name="party-uuids" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Specifies one or more parties that are responsible for performing the associated &lt;code&gt;role&lt;/code&gt;. &lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/prop"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-party/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/link"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-party/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-party/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;index-has-key name="index-metadata-role-id" target="."&gt;
         &lt;key-field target="@role-id"/&gt;
      &lt;/index-has-key&gt;
      &lt;index-has-key name="index-metadata-party-uuid" target="party-uuid"&gt;
         &lt;key-field target="value()"/&gt;
      &lt;/index-has-key&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/responsible-role" class="toc1 head">Assembly
         <code>responsible-role</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Responsible Role</p>
      <p class="description">A reference to one or more roles with responsibility for performing a function relative
         to the containing object.</p>
      <ul class="model">
         <li id="/assembly/oscal-metadata/responsible-role/role-id">Flag (defined inline) <code>role-id</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/party-uuid">Field (reference) <code>party-uuid</code> - grouped as <code>party-uuids</code></li>
         <li id="/assembly/oscal-metadata/responsible-role/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/responsible-role"
                 _metaschema-json-id="/assembly/oscal-metadata/responsible-role"
                 scope="global"
                 name="responsible-role"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:responsible-role"&gt;
   &lt;formal-name&gt;Responsible Role&lt;/formal-name&gt;
   &lt;description&gt;A reference to one or more roles with responsibility for performing a function relative to the containing object.&lt;/description&gt;
   &lt;define-flag _step="role-id"
                _key="role-id"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/role-id"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-role/role-id"
                required="yes"
                as-type="NCName"
                name="role-id"
                _using-name="role-id"
                _in-xml-name="role-id"
                _in-json-name="role-id"&gt;
      &lt;formal-name&gt;Responsible Role ID&lt;/formal-name&gt;
      &lt;description&gt;The role that is responsible for the business function.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/prop"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-role/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/link"
                _metaschema-json-id="/assembly/oscal-metadata/responsible-role/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="party-uuid"
             _key="party-uuids"
             _group-name="party-uuids"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/party-uuid"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-role/party-uuids"
             max-occurs="unbounded"
             min-occurs="0"
             ref="party-uuid"
             _key-ref="oscal-metadata:party-uuid"
             _using-name="party-uuid"
             _in-xml-name="party-uuid"
             _in-json-name="party-uuids"&gt;
         &lt;group-as name="party-uuids" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-role/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/hash" class="toc1 head">Field <code>hash</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Hash</p>
      <p class="description">A representation of a cryptographic digest generated over a resource using a specified
         hash algorithm.</p>
      <p class="json-value-key"><span class="lbl">json-value-key</span>value</p>
      <div class="remarks">
         <p class="p">A hash value can be used to authenticate that a referenced resource is the same resources
            as was pointed to by the author of the reference.</p>
      </div>
      <ul class="model">
         <li id="/field/oscal-metadata/hash/algorithm">Flag (defined inline) <code>algorithm</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/hash"
              _metaschema-json-id="/field/oscal-metadata/hash"
              collapsible="no"
              as-type="string"
              scope="global"
              name="hash"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:hash"&gt;
   &lt;formal-name&gt;Hash&lt;/formal-name&gt;
   &lt;description&gt;A representation of a cryptographic digest generated over a resource using a specified hash algorithm.&lt;/description&gt;
   &lt;json-value-key&gt;value&lt;/json-value-key&gt;
   &lt;define-flag _step="algorithm"
                _key="algorithm"
                _metaschema-xml-id="/field/oscal-metadata/hash/algorithm"
                _metaschema-json-id="/field/oscal-metadata/hash/algorithm"
                required="yes"
                as-type="string"
                name="algorithm"
                _using-name="algorithm"
                _in-xml-name="algorithm"
                _in-json-name="algorithm"&gt;
      &lt;formal-name&gt;Hash algorithm&lt;/formal-name&gt;
      &lt;description&gt;Method by which a hash is derived&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="SHA-224"&gt;The SHA-224 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA-256"&gt;The SHA-256 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA-384"&gt;The SHA-384 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA-512"&gt;The SHA-512 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.180-4"&gt;NIST FIPS 180-4&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-224"&gt;The SHA3-224 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-256"&gt;The SHA3-256 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-384"&gt;The SHA3-384 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
            &lt;enum value="SHA3-512"&gt;The SHA3-512 algorithm as defined by &lt;a href="https://doi.org/10.6028/NIST.FIPS.202"&gt;NIST FIPS 202&lt;/a&gt;.
                    &lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
      &lt;remarks&gt;
         &lt;p&gt;Any other value used MUST be a value defined in the W3C &lt;a href="http://www.w3.org/TR/xmlsec-algorithms/#digest-method"&gt;XML Security Algorithm Cross-Reference&lt;/a&gt; Digest Methods (W3C, April 2013) or &lt;a href="https://tools.ietf.org/html/rfc6931#section-2.1.5"&gt;RFC 6931 Section 2.1.5&lt;/a&gt; New SHA Functions.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;remarks&gt;
      &lt;p&gt;A hash value can be used to authenticate that a referenced resource is the same resources as was pointed to by the author of the reference.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-metadata/media-type" class="toc1 head">Flag <code>media-type</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Media Type</p>
      <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
         <a href="https://www.iana.org/assignments/media-types/media-types.xhtml">Media Types Registry</a>. </p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-metadata/media-type"
             _metaschema-json-id="/flag/oscal-metadata/media-type"
             as-type="string"
             scope="global"
             name="media-type"
             module="oscal-metadata"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:media-type"&gt;
   &lt;formal-name&gt;Media Type&lt;/formal-name&gt;
   &lt;description&gt;Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA) &lt;a href="https://www.iana.org/assignments/media-types/media-types.xhtml"&gt;Media Types Registry&lt;/a&gt;. &lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/remarks" class="toc1 head">Field <code>remarks</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Remarks</p>
      <p class="description">Additional commentary on the containing object.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/remarks"
              _metaschema-json-id="/field/oscal-metadata/remarks"
              in-xml="WITH_WRAPPER"
              collapsible="no"
              as-type="markup-multiline"
              scope="global"
              name="remarks"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:remarks"&gt;
   &lt;formal-name&gt;Remarks&lt;/formal-name&gt;
   &lt;description&gt;Additional commentary on the containing object.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/published" class="toc1 head">Field <code>published</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Publication Timestamp</p>
      <p class="description">The date and time the document was published. The date-time value must be formatted
         according to <a href="https://tools.ietf.org/html/rfc3339">RFC 3339</a> with full time and time zone included.</p>
      <div class="remarks">
         <p class="p">This value represents the point in time when the OSCAL document was published. Typically,
            this date value will be machine generated at the time the containing document is published.</p>
         <p class="p">In some cases, an OSCAL document may be derived from some source material in a different
            format. In such a case, the <code>published</code> value should indicate when the OSCAL document was published, not the source material.
            Where necessary, the publication date of the original source material can be captured
            as a named property or custom metadata construct.</p>
         <p class="p">A publisher of OSCAL content can use this data point along with its siblings <code>last-modified</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
            The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/published"
              _metaschema-json-id="/field/oscal-metadata/published"
              collapsible="no"
              as-type="dateTime-with-timezone"
              scope="local"
              name="published"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:published"&gt;
   &lt;formal-name&gt;Publication Timestamp&lt;/formal-name&gt;
   &lt;description&gt;The date and time the document was published. The date-time value must be formatted according to &lt;a href="https://tools.ietf.org/html/rfc3339"&gt;RFC 3339&lt;/a&gt; with full time and time zone included.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;This value represents the point in time when the OSCAL document was published. Typically, this date value will be machine generated at the time the containing document is published.&lt;/p&gt;
      &lt;p&gt;In some cases, an OSCAL document may be derived from some source material in a different format. In such a case, the &lt;code&gt;published&lt;/code&gt; value should indicate when the OSCAL document was published, not the source material. Where necessary, the publication date of the original source material can be captured as a named property or custom metadata construct.&lt;/p&gt;
      &lt;p&gt;A publisher of OSCAL content can use this data point along with its siblings &lt;code&gt;last-modified&lt;/code&gt; and &lt;code&gt;version&lt;/code&gt; to establish a sequence of successive revisions of a given OSCAL-based publication. The metadata for previous revisions can be represented as a &lt;code&gt;revision&lt;/code&gt; in this object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/last-modified" class="toc1 head">Field <code>last-modified</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Last Modified Timestamp</p>
      <p class="description">The date and time the document was last modified. The date-time value must be formatted
         according to <a href="https://tools.ietf.org/html/rfc3339">RFC 3339</a> with full time and time zone included.</p>
      <div class="remarks">
         <p class="p">This value represents the point in time when the OSCAL document was last updated,
            or at the point of creation the creation date. Typically, this date value will be
            machine generated at time of creation or modification.</p>
         <p class="p">In some cases, an OSCAL document may be derived from some source material in a different
            format. In such a case, the <code>last-modified</code> value should indicate the modification time of the OSCAL document, not the source
            material.</p>
         <p class="p">A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
            The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/last-modified"
              _metaschema-json-id="/field/oscal-metadata/last-modified"
              collapsible="no"
              as-type="dateTime-with-timezone"
              scope="local"
              name="last-modified"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:last-modified"&gt;
   &lt;formal-name&gt;Last Modified Timestamp&lt;/formal-name&gt;
   &lt;description&gt;The date and time the document was last modified. The date-time value must be formatted according to &lt;a href="https://tools.ietf.org/html/rfc3339"&gt;RFC 3339&lt;/a&gt; with full time and time zone included.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;This value represents the point in time when the OSCAL document was last updated, or at the point of creation the creation date. Typically, this date value will be machine generated at time of creation or modification.&lt;/p&gt;
      &lt;p&gt;In some cases, an OSCAL document may be derived from some source material in a different format. In such a case, the &lt;code&gt;last-modified&lt;/code&gt; value should indicate the modification time of the OSCAL document, not the source material.&lt;/p&gt;
      &lt;p&gt;A publisher of OSCAL content can use this data point along with its siblings &lt;code&gt;published&lt;/code&gt; and &lt;code&gt;version&lt;/code&gt; to establish a sequence of successive revisions of a given OSCAL-based publication. The metadata for previous revisions can be represented as a &lt;code&gt;revision&lt;/code&gt; in this object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/version" class="toc1 head">Field <code>version</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Document Version</p>
      <p class="description">A string used to distinguish the current version of the document from other previous
         (and future) versions.</p>
      <div class="remarks">
         <p class="p">A version string may be a release number, sequence number, date, or other identifier
            suffcient to distinguish between different document versions. This version is typically
            set by the document owner or by the tool used to maintain the content.</p>
         <p class="p">While not required, it is recommended that OSCAL content authors use <a href="https://semver.org/spec/v2.0.0.html">Semantic Versioning</a> as a format for version strings. This allows for the easy identification of a version
            tree consisting of major, minor, and patch numbers.</p>
         <p class="p">A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>last-modified</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
            The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/version"
              _metaschema-json-id="/field/oscal-metadata/version"
              collapsible="no"
              as-type="string"
              scope="local"
              name="version"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:version"&gt;
   &lt;formal-name&gt;Document Version&lt;/formal-name&gt;
   &lt;description&gt;A string used to distinguish the current version of the document from other previous (and future) versions.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;A version string may be a release number, sequence number, date, or other identifier suffcient to distinguish between different document versions. This version is typically set by the document owner or by the tool used to maintain the content.&lt;/p&gt;
      &lt;p&gt;While not required, it is recommended that OSCAL content authors use &lt;a href="https://semver.org/spec/v2.0.0.html"&gt;Semantic Versioning&lt;/a&gt; as a format for version strings. This allows for the easy identification of a version tree consisting of major, minor, and patch numbers.&lt;/p&gt;
      &lt;p&gt;A publisher of OSCAL content can use this data point along with its siblings &lt;code&gt;published&lt;/code&gt; and &lt;code&gt;last-modified&lt;/code&gt; to establish a sequence of successive revisions of a given OSCAL-based publication. The metadata for previous revisions can be represented as a &lt;code&gt;revision&lt;/code&gt; in this object.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/oscal-version" class="toc1 head">Field <code>oscal-version</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">OSCAL version</p>
      <p class="description">The OSCAL model version the document was authored against.</p>
      <div class="remarks">
         <p class="p">Indicates the version of the OSCAL model to which this data set conforms, for example
            <q>1.1.0</q> or <q>1.0.0-M1</q>. That can be used as a hint by a tool to indicate which version of the OSCAL XML
            or JSON schema to use for validation.</p>
      </div>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/oscal-version"
              _metaschema-json-id="/field/oscal-metadata/oscal-version"
              collapsible="no"
              as-type="string"
              scope="local"
              name="oscal-version"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:oscal-version"&gt;
   &lt;formal-name&gt;OSCAL version&lt;/formal-name&gt;
   &lt;description&gt;The OSCAL model version the document was authored against.&lt;/description&gt;
   &lt;remarks&gt;
      &lt;p&gt;Indicates the version of the OSCAL model to which this data set conforms, for example &lt;q&gt;1.1.0&lt;/q&gt; or &lt;q&gt;1.0.0-M1&lt;/q&gt;. That can be used as a hint by a tool to indicate which version of the OSCAL XML or JSON schema to use for validation.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/email-address" class="toc1 head">Field <code>email-address</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Email Address</p>
      <p class="description">An email address as defined by <a href="https://tools.ietf.org/html/rfc5322#section-3.4.1">RFC 5322 Section 3.4.1</a>. </p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/email-address"
              _metaschema-json-id="/field/oscal-metadata/email-address"
              collapsible="no"
              as-type="email"
              scope="local"
              name="email-address"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:email-address"&gt;
   &lt;formal-name&gt;Email Address&lt;/formal-name&gt;
   &lt;description&gt;An email address as defined by &lt;a href="https://tools.ietf.org/html/rfc5322#section-3.4.1"&gt;RFC 5322 Section 3.4.1&lt;/a&gt;. &lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/telephone-number" class="toc1 head">Field <code>telephone-number</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Telephone Number</p>
      <p class="description">Contact number by telephone.</p>
      <p class="json-value-key"><span class="lbl">json-value-key</span>number</p>
      <ul class="model">
         <li id="/field/oscal-metadata/telephone-number/type">Flag (defined inline) <code>type</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/telephone-number"
              _metaschema-json-id="/field/oscal-metadata/telephone-number"
              collapsible="no"
              as-type="string"
              scope="local"
              name="telephone-number"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:telephone-number"&gt;
   &lt;formal-name&gt;Telephone Number&lt;/formal-name&gt;
   &lt;description&gt;Contact number by telephone.&lt;/description&gt;
   &lt;json-value-key&gt;number&lt;/json-value-key&gt;
   &lt;define-flag _step="type"
                _key="type"
                _metaschema-xml-id="/field/oscal-metadata/telephone-number/type"
                _metaschema-json-id="/field/oscal-metadata/telephone-number/type"
                required="no"
                as-type="string"
                name="type"
                _using-name="type"
                _in-xml-name="type"
                _in-json-name="type"&gt;
      &lt;formal-name&gt;type flag&lt;/formal-name&gt;
      &lt;description&gt;Indicates the type of phone number.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="home"&gt;A home phone number.&lt;/enum&gt;
            &lt;enum value="office"&gt;An office phone number.&lt;/enum&gt;
            &lt;enum value="mobile"&gt;A mobile phone number.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-metadata/address" class="toc1 head">Assembly
         <code>address</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Address</p>
      <p class="description">A postal address for the location.</p>
      <ul class="model">
         <li id="/assembly/oscal-metadata/address/type">Flag (reference) <code>location-type</code> - using name <code>type</code></li>
         <li id="/assembly/oscal-metadata/address/addr-line">Field (reference) <code>addr-line</code> - grouped as <code>addr-lines</code></li>
         <li id="/assembly/oscal-metadata/address/city">Field (defined inline) <code>city</code></li>
         <li id="/assembly/oscal-metadata/address/state">Field (defined inline) <code>state</code></li>
         <li id="/assembly/oscal-metadata/address/postal-code">Field (defined inline) <code>postal-code</code></li>
         <li id="/assembly/oscal-metadata/address/country">Field (defined inline) <code>country</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-metadata/address"
                 _metaschema-json-id="/assembly/oscal-metadata/address"
                 scope="local"
                 name="address"
                 module="oscal-metadata"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
                 _key-name="oscal-metadata:address"&gt;
   &lt;formal-name&gt;Address&lt;/formal-name&gt;
   &lt;description&gt;A postal address for the location.&lt;/description&gt;
   &lt;flag _step="type"
         _key="type"
         _metaschema-xml-id="/assembly/oscal-metadata/address/type"
         _metaschema-json-id="/assembly/oscal-metadata/address/type"
         as-type="NCName"
         required="no"
         ref="location-type"
         _key-ref="oscal-metadata:location-type"
         _using-name="type"
         _in-xml-name="type"
         _in-json-name="type"&gt;
      &lt;use-name&gt;type&lt;/use-name&gt;
   &lt;/flag&gt;
   &lt;model&gt;
      &lt;field _step="addr-line"
             _key="addr-lines"
             _group-name="addr-lines"
             _metaschema-xml-id="/assembly/oscal-metadata/address/addr-line"
             _metaschema-json-id="/assembly/oscal-metadata/address/addr-lines"
             max-occurs="unbounded"
             min-occurs="0"
             ref="addr-line"
             _key-ref="oscal-metadata:addr-line"
             _using-name="addr-line"
             _in-xml-name="addr-line"
             _in-json-name="addr-lines"&gt;
         &lt;group-as name="addr-lines" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;define-field _step="city"
                    _key="city"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/city"
                    _metaschema-json-id="/assembly/oscal-metadata/address/city"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="city"
                    _using-name="city"
                    _in-xml-name="city"
                    _in-json-name="city"&gt;
         &lt;formal-name&gt;City&lt;/formal-name&gt;
         &lt;description&gt;City, town or geographical region for the mailing address.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="state"
                    _key="state"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/state"
                    _metaschema-json-id="/assembly/oscal-metadata/address/state"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="state"
                    _using-name="state"
                    _in-xml-name="state"
                    _in-json-name="state"&gt;
         &lt;formal-name&gt;State&lt;/formal-name&gt;
         &lt;description&gt;State, province or analogous geographical region for mailing address&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="postal-code"
                    _key="postal-code"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/postal-code"
                    _metaschema-json-id="/assembly/oscal-metadata/address/postal-code"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="postal-code"
                    _using-name="postal-code"
                    _in-xml-name="postal-code"
                    _in-json-name="postal-code"&gt;
         &lt;formal-name&gt;Postal Code&lt;/formal-name&gt;
         &lt;description&gt;Postal or ZIP code for mailing address&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="country"
                    _key="country"
                    _metaschema-xml-id="/assembly/oscal-metadata/address/country"
                    _metaschema-json-id="/assembly/oscal-metadata/address/country"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="country"
                    _using-name="country"
                    _in-xml-name="country"
                    _in-json-name="country"&gt;
         &lt;formal-name&gt;Country Code&lt;/formal-name&gt;
         &lt;description&gt;The ISO 3166-1 alpha-2 country code for the mailing address.&lt;/description&gt;
         &lt;constraint&gt;
            &lt;matches target="." regex="[A-Z](2)"/&gt;
         &lt;/constraint&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/addr-line" class="toc1 head">Field <code>addr-line</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Address line</p>
      <p class="description">A single line of an address.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/addr-line"
              _metaschema-json-id="/field/oscal-metadata/addr-line"
              collapsible="no"
              as-type="string"
              scope="local"
              name="addr-line"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:addr-line"&gt;
   &lt;formal-name&gt;Address line&lt;/formal-name&gt;
   &lt;description&gt;A single line of an address.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-metadata/location-type" class="toc1 head">Flag <code>location-type</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Address Type</p>
      <p class="description">Indicates the type of address.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A home address.</p>
            
            <p class="enum"><span class="lbl">enum</span>A work address.</p>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-metadata/location-type"
             _metaschema-json-id="/flag/oscal-metadata/location-type"
             as-type="NCName"
             scope="local"
             name="location-type"
             module="oscal-metadata"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:location-type"&gt;
   &lt;formal-name&gt;Address Type&lt;/formal-name&gt;
   &lt;description&gt;Indicates the type of address.&lt;/description&gt;
   &lt;constraint&gt;
      &lt;allowed-values allow-other="yes"&gt;
         &lt;enum value="home"&gt;A home address.&lt;/enum&gt;
         &lt;enum value="work"&gt;A work address.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-metadata/document-id" class="toc1 head">Field <code>document-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Document Identifier</p>
      <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
         that are to be treated as different versions of the same document. If this element
         does not appear, or if the value of this element is empty, the value of "document-id"
         is equal to the value of the "uuid" flag of the top-level root element.</p>
      <p class="json-value-key"><span class="lbl">json-value-key</span>identifier</p>
      <div class="remarks">
         <p class="p">This element is optional, but it will always have a valid value, as if it is missing
            the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
            allows for document creators to retroactively link an update to the original version,
            by providing a document-id on the new document that is equal to the uuid of the original
            document.</p>
      </div>
      <ul class="model">
         <li id="/field/oscal-metadata/document-id/scheme">Flag (defined inline) <code>scheme</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-metadata/document-id"
              _metaschema-json-id="/field/oscal-metadata/document-id"
              collapsible="no"
              as-type="string"
              scope="local"
              name="document-id"
              module="oscal-metadata"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_metadata_metaschema.xml"
              _key-name="oscal-metadata:document-id"&gt;
   &lt;formal-name&gt;Document Identifier&lt;/formal-name&gt;
   &lt;description&gt;A document identifier qualified by an identifier &lt;code&gt;scheme&lt;/code&gt;. A document identifier provides a globally unique identifier for a group of documents that are to be treated as different versions of the same document. If this element does not appear, or if the value of this element is empty, the value of "document-id" is equal to the value of the "uuid" flag of the top-level root element.&lt;/description&gt;
   &lt;json-value-key&gt;identifier&lt;/json-value-key&gt;
   &lt;define-flag _step="scheme"
                _key="scheme"
                _metaschema-xml-id="/field/oscal-metadata/document-id/scheme"
                _metaschema-json-id="/field/oscal-metadata/document-id/scheme"
                required="no"
                as-type="uri"
                name="scheme"
                _using-name="scheme"
                _in-xml-name="scheme"
                _in-json-name="scheme"&gt;
      &lt;formal-name&gt;Document Identification Scheme&lt;/formal-name&gt;
      &lt;description&gt;Qualifies the kind of document identifier using a URI. If the scheme is not provided the value of the element will be interpreted as a string of characters. &lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="https://www.doi.org/"&gt;A &lt;a href="https://www.doi.org/hb.html"&gt;Digital Object Identifier&lt;/a&gt; (DOI); use is preferred, since this allows for retrieval of a full bibliographic record.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;remarks&gt;
      &lt;p&gt;This element is optional, but it will always have a valid value, as if it is missing the value of "document-id" is assumed to be equal to the UUID of the root. This requirement allows for document creators to retroactively link an update to the original version, by providing a document-id on the new document that is equal to the uuid of the original document.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/system-component" class="toc1 head">Assembly
         <code>system-component</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Component</p>
      <p class="description">A defined component that can be part of an implemented system.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            
            <p class="enum"><span class="lbl">enum</span>Relative placement of component ('internal' or 'external') to the system.</p>
            
            <p class="enum"><span class="lbl">enum</span>UUID of the related leveraged-authorization assembly in this SSP.</p>
            
            <p class="enum"><span class="lbl">enum</span>UUID of the component as it was assigned in the leveraged system's SSP.</p>
            
            
            
            
            
            
            
            <p class="enum"><span class="lbl">enum</span>Simple indication of the asset's function, such as Router, Storage Array, DNS Server.</p>
            
            <p class="enum"><span class="lbl">enum</span>An organizationally specific identifier that is used to uniquely identify a logical
               or tangible item by the organization that owns the item.</p>
            
            <p class="enum"><span class="lbl">enum</span>An asset tag assigned by the organization responsible for maintaining the logical
               or tangible item.</p>
            
            <p class="enum"><span class="lbl">enum</span>Identifies whether the asset is publicly accessible (yes/no)</p>
            
            <p class="enum"><span class="lbl">enum</span>Identifies whether the asset is virtualized (yes/no)</p>
            
            <p class="enum"><span class="lbl">enum</span>Virtual LAN identifier of the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>The network identifier of the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>A human-readable label for the parent context.</p>
            
            <p class="enum"><span class="lbl">enum</span>An alternative identifier, whose value is easily sortable among other such values
               in the document.</p>
            
            <p class="enum"><span class="lbl">enum</span>The name of the baseline configuration for the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>Can the asset be check with an authenticated scan? (yes/no)</p>
            
            <p class="enum"><span class="lbl">enum</span>The function provided by the asset for the system.</p>
            
            
            
            
            <p class="enum"><span class="lbl">enum</span>The version of the component.</p>
            
            <p class="enum"><span class="lbl">enum</span>The specific patch level of the component.</p>
            
            <p class="enum"><span class="lbl">enum</span>The model of the component.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>The date the component was released, such as a software release date or policy publication
               date.</p>
            
            <p class="enum"><span class="lbl">enum</span>Used with component-type='validation' to provide a well-known name for a kind of validation.</p>
            
            <p class="enum"><span class="lbl">enum</span>Used with component-type='validation' to indicate the validating body's assigned identifier
               for their validation of this component.</p>
            
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            
            
            
            
            <p class="enum"><span class="lbl">enum</span>A reference to another component that this component has a dependency on.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>A reference to another component of component-type=validation, that is a validation
               (e.g., FIPS 140-2) for this component</p>
            
            <p class="enum"><span class="lbl">enum</span>A pointer to a validation record (e.g., FIPS 140-2) or other compliance information.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>A reference to the baseline template used to configure the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>This service is used by the referenced component identifier.</p>
            
            <p class="enum"><span class="lbl">enum</span>A link to the system security plan of the external system.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>This component uses the network provided by the identified network component.</p>
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            
            
            
            <p class="enum"><span class="lbl">enum</span>Accountable for ensuring the asset is managed in accordance with organizational policies
               and procedures.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for administering a set of assets.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the security operations center (SOC).</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the network operations center (NOC).</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for responding to an event that could lead to loss of, or disruption to,
               an organization's operations, services or functions.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for providing information and support to users.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the configuration management processes governing changes to the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the creation and maintenance of a component.</p>
            
            <p class="enum"><span class="lbl">enum</span>Organization responsible for providing the component, if this is different from the
               "maintainer" (e.g., a reseller).</p>
            
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            
            
            <p class="enum"><span class="lbl">enum</span>System software that manages computer hardware, software resources, and provides common
               services for computer programs.</p>
            
            <p class="enum"><span class="lbl">enum</span>An electronic collection of data, or information, that is specially organized for
               rapid search and retrieval.</p>
            
            <p class="enum"><span class="lbl">enum</span>A system that delivers content or services to end users over the Internet or an intranet.</p>
            
            <p class="enum"><span class="lbl">enum</span>A system that resolves domain names to internet protocol (IP) addresses.</p>
            
            <p class="enum"><span class="lbl">enum</span>A computer system that sends and receives electronic mail messages.</p>
            
            <p class="enum"><span class="lbl">enum</span>A  system that stores, organizes and provides access to directory information in order
               to unify network resources.</p>
            
            <p class="enum"><span class="lbl">enum</span>A private branch exchange (PBX) provides a a private telephone switchboard.</p>
            
            <p class="enum"><span class="lbl">enum</span>A network security system that monitors and controls incoming and outgoing network
               traffic based on predetermined security rules.</p>
            
            <p class="enum"><span class="lbl">enum</span>A physical or virtual networking device that forwards data packets between computer
               networks.</p>
            
            <p class="enum"><span class="lbl">enum</span>A physical or virtual networking device that connects devices within a computer network
               by using packet switching to receive and forward data to the destination device.</p>
            
            <p class="enum"><span class="lbl">enum</span>A consolidated, block-level data storage capability.</p>
            
            <p class="enum"><span class="lbl">enum</span>A physical or virtual machine that centralizes hardware, software, or services for
               a specific purpose.</p>
            
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The component allows an authenticated scan.</p>
            
            <p class="enum"><span class="lbl">enum</span>The component does not allow an authenticated scan.</p>
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The component is publicly accessible.</p>
            
            <p class="enum"><span class="lbl">enum</span>The component is not publicly accessible.</p>
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The component is virtualized.</p>
            
            <p class="enum"><span class="lbl">enum</span>The component is not virtualized.</p>
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The component is implemented within the system boundary.</p>
            
            <p class="enum"><span class="lbl">enum</span>The component is implemented outside the system boundary.</p>
            </div>
         
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         
         
         
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The name of the company or organization </p>
            </div>
         
         
         
         
         
         
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A link to an online information provided by the authorizing body.</p>
            </div>
         
         
         
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>If a "software" component-type, the identifier, such as a SWID tag, for the software
               component.</p>
            
            </div>
         
         
         
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>This service is provided by the referenced component identifier.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>This service is used by the referenced component identifier.</p>
            
            </div>
         
         
         <div class="expect">
            <p class="element-label"><span class="lbl">expect</span></p>
         </div>
         
         
         
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Title of the Interconnection Security Agreement (ISA).</p>
            
            <p class="enum"><span class="lbl">enum</span>Date of the Interconnection Security Agreement (ISA).</p>
            
            <p class="enum"><span class="lbl">enum</span>The name of the remote interconnected system.</p>
            
            <p class="enum"><span class="lbl">enum</span>An Internet Protocol Version 4 interconnection address</p>
            
            <p class="enum"><span class="lbl">enum</span>An Internet Protocol Version 6 interconnection address</p>
            
            <p class="enum"><span class="lbl">enum</span>An Internet Protocol Version 6 interconnection address</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The identified IP address is for this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>The identified IP address is for the remote system to which this system is connected.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            
            <p class="enum"><span class="lbl">enum</span>A link to the system interconnection agreement.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Interconnection Security Agreement (ISA) point of contact (POC) for this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>Interconnection Security Agreement (ISA) point of contact (POC) for the remote interconnected
               system.</p>
            
            <p class="enum"><span class="lbl">enum</span>Interconnection Security Agreement (ISA) authorizing official for this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>Interconnection Security Agreement (ISA) authorizing official for the remote interconnected
               system.</p>
            </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         <div class="matches">
            <p class="element-label"><span class="lbl">matches</span></p>
         </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Data from the remote system flows into this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>Data from this system flows to the remote system.</p>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>responsible-role</code> associates multiple <code>party-uuid</code> entries with a single <code>role-id</code>, each role-id must be referenced only once.</p>
            </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">Components may be products, services, application programming interface (APIs), policies,
            processes, plans, guidance, standards, or other tangible items that enable security
            and/or privacy.</p>
         <p class="p">The <code>type</code> indicates which of these component types is represented.</p>
         <p class="p">When defining a <code>service</code> component where are relationship to other components is known, one or more <code>link</code> entries with rel values of provided-by and used-by can be used to link to the specific
            component identifier(s) that provide and use the service respectively.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/system-component/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/type">Flag (reference) <code>system-component-type</code> - using name <code>type</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/purpose">Field (defined inline) <code>purpose</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/status">Assembly (defined inline) <code>status</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/responsible-role">Assembly (reference) <code>responsible-role</code> - grouped as <code>responsible-roles</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/protocol">Assembly (reference) <code>protocol</code> - grouped as <code>protocols</code></li>
         <li id="/assembly/oscal-implementation-common/system-component/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/system-component"
                 _metaschema-json-id="/assembly/oscal-implementation-common/system-component"
                 scope="global"
                 name="system-component"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:system-component"&gt;
   &lt;formal-name&gt;Component&lt;/formal-name&gt;
   &lt;description&gt;A defined component that can be part of an implemented system.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/uuid"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Component Identifier&lt;/formal-name&gt;
      &lt;description&gt;The unique identifier for the component.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;flag _step="type"
         _key="type"
         _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/type"
         _metaschema-json-id="/assembly/oscal-implementation-common/system-component/type"
         as-type="string"
         required="yes"
         ref="system-component-type"
         _key-ref="oscal-implementation-common:system-component-type"
         _using-name="type"
         _in-xml-name="type"
         _in-json-name="type"&gt;
      &lt;use-name&gt;type&lt;/use-name&gt;
   &lt;/flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/title"
                    _metaschema-json-id="/assembly/oscal-implementation-common/system-component/title"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Component Title&lt;/formal-name&gt;
         &lt;description&gt;A human readable name for the system component.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/description"
                    _metaschema-json-id="/assembly/oscal-implementation-common/system-component/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Component Description&lt;/formal-name&gt;
         &lt;description&gt;A description of the component, including information about its function.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="purpose"
                    _key="purpose"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/purpose"
                    _metaschema-json-id="/assembly/oscal-implementation-common/system-component/purpose"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="purpose"
                    _using-name="purpose"
                    _in-xml-name="purpose"
                    _in-json-name="purpose"&gt;
         &lt;formal-name&gt;Purpose&lt;/formal-name&gt;
         &lt;description&gt;A summary of the technological or business purpose of the component.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/prop"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/link"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-assembly _step="status"
                       _key="status"
                       _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/status"
                       _metaschema-json-id="/assembly/oscal-implementation-common/system-component/status"
                       max-occurs="1"
                       min-occurs="1"
                       name="status"
                       _using-name="status"
                       _in-xml-name="status"
                       _in-json-name="status"&gt;
         &lt;formal-name&gt;Status&lt;/formal-name&gt;
         &lt;description&gt;Describes the operational status of the system component.&lt;/description&gt;
         &lt;define-flag _step="state"
                      _key="state"
                      _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/status/state"
                      _metaschema-json-id="/assembly/oscal-implementation-common/system-component/status/state"
                      required="yes"
                      as-type="NCName"
                      name="state"
                      _using-name="state"
                      _in-xml-name="state"
                      _in-json-name="state"&gt;
            &lt;formal-name&gt;State&lt;/formal-name&gt;
            &lt;description&gt;The operational status.&lt;/description&gt;
            &lt;constraint&gt;
               &lt;allowed-values&gt;
                  &lt;enum value="under-development"&gt;The component is being designed, developed, or implemented.&lt;/enum&gt;
                  &lt;enum value="operational"&gt;The component is currently operational and is available for use in the system.&lt;/enum&gt;
                  &lt;enum value="disposition"&gt;The component is no longer operational.&lt;/enum&gt;
                  &lt;enum value="other"&gt;Some other state.&lt;/enum&gt;
               &lt;/allowed-values&gt;
            &lt;/constraint&gt;
         &lt;/define-flag&gt;
         &lt;model&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/status/remarks"
                   _metaschema-json-id="/assembly/oscal-implementation-common/system-component/status/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
      &lt;/define-assembly&gt;
      &lt;assembly _step="responsible-role"
                _key="responsible-roles"
                _group-name="responsible-roles"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/responsible-role"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/responsible-roles"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-role"
                _key-ref="oscal-metadata:responsible-role"
                _using-name="responsible-role"
                _in-xml-name="responsible-role"
                _in-json-name="responsible-roles"&gt;
         &lt;group-as name="responsible-roles" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="protocol"
                _key="protocols"
                _group-name="protocols"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/protocol"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/protocols"
                max-occurs="unbounded"
                min-occurs="0"
                ref="protocol"
                _key-ref="oscal-implementation-common:protocol"
                _using-name="protocol"
                _in-xml-name="protocol"
                _in-json-name="protocols"&gt;
         &lt;group-as name="protocols" in-json="ARRAY"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Used for &lt;code&gt;service&lt;/code&gt; components to define the protocols supported by the service.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/remarks"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-component/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="implementation-point"&gt;Relative placement of component ('internal' or 'external') to the system.&lt;/enum&gt;
         &lt;enum value="leveraged-authorization-uuid"&gt;UUID of the related leveraged-authorization assembly in this SSP.&lt;/enum&gt;
         &lt;enum value="inherited-uuid"&gt;UUID of the component as it was assigned in the leveraged system's SSP.&lt;/enum&gt;
         &lt;enum value="asset-type"&gt;Simple indication of the asset's function, such as Router, Storage Array, DNS Server.&lt;/enum&gt;
         &lt;enum value="asset-id"&gt;An organizationally specific identifier that is used to uniquely identify a logical or tangible item by the organization that owns the item.&lt;/enum&gt;
         &lt;enum value="asset-tag"&gt;An asset tag assigned by the organization responsible for maintaining the logical or tangible item.&lt;/enum&gt;
         &lt;enum value="public"&gt;Identifies whether the asset is publicly accessible (yes/no)&lt;/enum&gt;
         &lt;enum value="virtual"&gt;Identifies whether the asset is virtualized (yes/no)&lt;/enum&gt;
         &lt;enum value="vlan-id"&gt;Virtual LAN identifier of the asset.&lt;/enum&gt;
         &lt;enum value="network-id"&gt;The network identifier of the asset.&lt;/enum&gt;
         &lt;enum value="label"&gt;A human-readable label for the parent context.&lt;/enum&gt;
         &lt;enum value="sort-id"&gt;An alternative identifier, whose value is easily sortable among other such values in the document.&lt;/enum&gt;
         &lt;enum value="baseline-configuration-name"&gt;The name of the baseline configuration for the asset.&lt;/enum&gt;
         &lt;enum value="allows-authenticated-scan"&gt;Can the asset be check with an authenticated scan? (yes/no)&lt;/enum&gt;
         &lt;enum value="function"&gt;The function provided by the asset for the system.&lt;/enum&gt;
         &lt;enum value="version"&gt;The version of the component.&lt;/enum&gt;
         &lt;enum value="patch-level"&gt;The specific patch level of the component.&lt;/enum&gt;
         &lt;enum value="model"&gt;The model of the component.&lt;/enum&gt;
         &lt;enum value="release-date"&gt;The date the component was released, such as a software release date or policy publication date.&lt;/enum&gt;
         &lt;enum value="validation-type"&gt;Used with component-type='validation' to provide a well-known name for a kind of validation.&lt;/enum&gt;
         &lt;enum value="validation-reference"&gt;Used with component-type='validation' to indicate the validating body's assigned identifier for their validation of this component.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="link/@rel" allow-other="yes"&gt;
         &lt;enum value="depends-on"&gt;A reference to another component that this component has a dependency on.&lt;/enum&gt;
         &lt;enum value="validation"&gt;A reference to another component of component-type=validation, that is a validation (e.g., FIPS 140-2) for this component&lt;/enum&gt;
         &lt;enum value="proof-of-compliance"&gt;A pointer to a validation record (e.g., FIPS 140-2) or other compliance information.&lt;/enum&gt;
         &lt;enum value="baseline-template"&gt;A reference to the baseline template used to configure the asset.&lt;/enum&gt;
         &lt;enum value="uses-service"&gt;This service is used by the referenced component identifier.&lt;/enum&gt;
         &lt;enum value="system-security-plan"&gt;A link to the system security plan of the external system.&lt;/enum&gt;
         &lt;enum value="uses-network"&gt;This component uses the network provided by the identified network component.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="responsible-role/@role-id" allow-other="yes"&gt;
         &lt;enum value="asset-owner"&gt;Accountable for ensuring the asset is managed in accordance with organizational policies and procedures.&lt;/enum&gt;
         &lt;enum value="asset-administrator"&gt;Responsible for administering a set of assets.&lt;/enum&gt;
         &lt;enum value="security-operations"&gt;Members of the security operations center (SOC).&lt;/enum&gt;
         &lt;enum value="network-operations"&gt;Members of the network operations center (NOC).&lt;/enum&gt;
         &lt;enum value="incident-response"&gt;Responsible for responding to an event that could lead to loss of, or disruption to, an organization's operations, services or functions.&lt;/enum&gt;
         &lt;enum value="help-desk"&gt;Responsible for providing information and support to users.&lt;/enum&gt;
         &lt;enum value="configuration-management"&gt;Responsible for the configuration management processes governing changes to the asset.&lt;/enum&gt;
         &lt;enum value="maintainer"&gt;Responsible for the creation and maintenance of a component.&lt;/enum&gt;
         &lt;enum value="provider"&gt;Organization responsible for providing the component, if this is different from the "maintainer" (e.g., a reseller).&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='asset-type']/@value"&gt;
         &lt;enum value="operating-system"&gt;System software that manages computer hardware, software resources, and provides common services for computer programs.&lt;/enum&gt;
         &lt;enum value="database"&gt;An electronic collection of data, or information, that is specially organized for rapid search and retrieval.&lt;/enum&gt;
         &lt;enum value="web-server"&gt;A system that delivers content or services to end users over the Internet or an intranet.&lt;/enum&gt;
         &lt;enum value="dns-server"&gt;A system that resolves domain names to internet protocol (IP) addresses.&lt;/enum&gt;
         &lt;enum value="email-server"&gt;A computer system that sends and receives electronic mail messages.&lt;/enum&gt;
         &lt;enum value="directory-server"&gt;A  system that stores, organizes and provides access to directory information in order to unify network resources.&lt;/enum&gt;
         &lt;enum value="pbx"&gt;A private branch exchange (PBX) provides a a private telephone switchboard.&lt;/enum&gt;
         &lt;enum value="firewall"&gt;A network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules.&lt;/enum&gt;
         &lt;enum value="router"&gt;A physical or virtual networking device that forwards data packets between computer networks.&lt;/enum&gt;
         &lt;enum value="switch"&gt;A physical or virtual networking device that connects devices within a computer network by using packet switching to receive and forward data to the destination device.&lt;/enum&gt;
         &lt;enum value="storage-array"&gt;A consolidated, block-level data storage capability.&lt;/enum&gt;
         &lt;enum value="appliance"&gt;A physical or virtual machine that centralizes hardware, software, or services for a specific purpose.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='allows-authenticated-scan']/@value"&gt;
         &lt;enum value="yes"&gt;The component allows an authenticated scan.&lt;/enum&gt;
         &lt;enum value="no"&gt;The component does not allow an authenticated scan.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='public']/@value"&gt;
         &lt;enum value="yes"&gt;The component is publicly accessible.&lt;/enum&gt;
         &lt;enum value="no"&gt;The component is not publicly accessible.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='virtual']/@value"&gt;
         &lt;enum value="yes"&gt;The component is virtualized.&lt;/enum&gt;
         &lt;enum value="no"&gt;The component is not virtualized.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='implementation-point']/@value"&gt;
         &lt;enum value="inteneral"&gt;The component is implemented within the system boundary.&lt;/enum&gt;
         &lt;enum value="external"&gt;The component is implemented outside the system boundary.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;index-has-key name="index-metadata-location-uuid"
                     target="prop[@name='physical-location']"&gt;
         &lt;key-field target="@value"/&gt;
      &lt;/index-has-key&gt;
      &lt;matches target="prop[@name='inherited-uuid']/@value" datatype="uuid"/&gt;
      &lt;matches target="prop[@name='release-date']/@value" datatype="date"/&gt;
      &lt;allowed-values target="(.)[@type=('software', 'hardware', 'service')]/prop/@name"
                      allow-other="yes"&gt;
         &lt;enum value="vendor-name"&gt;The name of the company or organization &lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="(.)[@type='validation']/link/@rel" allow-other="yes"&gt;
         &lt;enum value="validation-details"&gt;A link to an online information provided by the authorizing body.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="(.)[@type='software']/prop/@name" allow-other="yes"&gt;
         &lt;enum value="software-identifier"&gt;If a "software" component-type, the identifier, such as a SWID tag, for the software component.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="(.)[@type='service']/link/@rel" allow-other="yes"&gt;
         &lt;enum value="provided-by"&gt;This service is provided by the referenced component identifier.&lt;/enum&gt;
         &lt;enum value="used-by"&gt;This service is used by the referenced component identifier.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;expect test="not(exists((.)[not(@type='service')]/protocol))"/&gt;
      &lt;allowed-values target="(.)[@type='interconnection']/prop/@name" allow-other="yes"&gt;
         &lt;enum value="isa-title"&gt;Title of the Interconnection Security Agreement (ISA).&lt;/enum&gt;
         &lt;enum value="isa-date"&gt;Date of the Interconnection Security Agreement (ISA).&lt;/enum&gt;
         &lt;enum value="isa-remote-system-name"&gt;The name of the remote interconnected system.&lt;/enum&gt;
         &lt;enum value="ipv4-address"&gt;An Internet Protocol Version 4 interconnection address&lt;/enum&gt;
         &lt;enum value="ipv6-address"&gt;An Internet Protocol Version 6 interconnection address&lt;/enum&gt;
         &lt;enum value="direction"&gt;An Internet Protocol Version 6 interconnection address&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[(@name=('ipv4-address','ipv6-address')]/@class"
                      allow-other="yes"&gt;
         &lt;enum value="local"&gt;The identified IP address is for this system.&lt;/enum&gt;
         &lt;enum value="remote"&gt;The identified IP address is for the remote system to which this system is connected.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="(.)[@type='interconnection']/link/@rel" allow-other="yes"&gt;
         &lt;enum value="isa-agreement"&gt;A link to the system interconnection agreement.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="(.)[@type='interconnection']/responsible-role/@role-id"
                      allow-other="yes"&gt;
         &lt;enum value="isa-poc-local"&gt;Interconnection Security Agreement (ISA) point of contact (POC) for this system.&lt;/enum&gt;
         &lt;enum value="isa-poc-remote"&gt;Interconnection Security Agreement (ISA) point of contact (POC) for the remote interconnected system.&lt;/enum&gt;
         &lt;enum value="isa-authorizing-official-local"&gt;Interconnection Security Agreement (ISA) authorizing official for this system.&lt;/enum&gt;
         &lt;enum value="isa-authorizing-official-remote"&gt;Interconnection Security Agreement (ISA) authorizing official for the remote interconnected system.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;matches target="prop[@name='isa-date']/@value" datatype="dateTime"/&gt;
      &lt;matches target="prop[@name='ipv4-address']/@value" datatype="ip-v4-address"/&gt;
      &lt;matches target="prop[@name='ipv6-address']/@value" datatype="ip-v6-address"/&gt;
      &lt;allowed-values target="prop[@name='direction')]/@value" allow-other="yes"&gt;
         &lt;enum value="incoming"&gt;Data from the remote system flows into this system.&lt;/enum&gt;
         &lt;enum value="outgoing"&gt;Data from this system flows to the remote system.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;is-unique name="unique-system-component-responsible-role"
                 target="responsible-role"&gt;
         &lt;key-field target="@role-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;responsible-role&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;Components may be products, services, application programming interface (APIs), policies, processes, plans, guidance, standards, or other tangible items that enable security and/or privacy.&lt;/p&gt;
      &lt;p&gt;The &lt;code&gt;type&lt;/code&gt; indicates which of these component types is represented.&lt;/p&gt;
      &lt;p&gt;When defining a &lt;code&gt;service&lt;/code&gt; component where are relationship to other components is known, one or more &lt;code&gt;link&lt;/code&gt; entries with rel values of provided-by and used-by can be used to link to the specific component identifier(s) that provide and use the service respectively.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-implementation-common/system-component-type" class="toc1 head">Flag <code>system-component-type</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Component Type</p>
      <p class="description">A category describing the purpose of the component.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The system as a whole.</p>
            
            <p class="enum"><span class="lbl">enum</span>An external system, which may be a leveraged system or the other side of an interconnection.</p>
            
            <p class="enum"><span class="lbl">enum</span>A connection to something outside this system.</p>
            
            <p class="enum"><span class="lbl">enum</span>Any software, operating system, or firmware.</p>
            
            <p class="enum"><span class="lbl">enum</span>A physical device.</p>
            
            <p class="enum"><span class="lbl">enum</span>A service that may provide APIs.</p>
            
            <p class="enum"><span class="lbl">enum</span>An enforceable policy.</p>
            
            <p class="enum"><span class="lbl">enum</span>A tangible asset used to provide physical protections or countermeasures.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>A list of steps or actions to take to achieve some end result.</p>
            
            <p class="enum"><span class="lbl">enum</span>An applicable plan.</p>
            
            <p class="enum"><span class="lbl">enum</span>Any guideline or recommendation.</p>
            
            <p class="enum"><span class="lbl">enum</span>Any organizational or industry standard.</p>
            
            <p class="enum"><span class="lbl">enum</span>An external assessment performed on some other component, that has been validated
               by a third-party.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>A physical or virtual network.</p>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-implementation-common/system-component-type"
             _metaschema-json-id="/flag/oscal-implementation-common/system-component-type"
             as-type="string"
             scope="global"
             name="system-component-type"
             module="oscal-implementation-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
             _key-name="oscal-implementation-common:system-component-type"&gt;
   &lt;formal-name&gt;Component Type&lt;/formal-name&gt;
   &lt;description&gt;A category describing the purpose of the component.&lt;/description&gt;
   &lt;constraint&gt;
      &lt;allowed-values allow-other="yes"&gt;
         &lt;enum value="this-system"&gt;The system as a whole.&lt;/enum&gt;
         &lt;enum value="system"&gt;An external system, which may be a leveraged system or the other side of an interconnection.&lt;/enum&gt;
         &lt;enum value="interconnection"&gt;A connection to something outside this system.&lt;/enum&gt;
         &lt;enum value="software"&gt;Any software, operating system, or firmware.&lt;/enum&gt;
         &lt;enum value="hardware"&gt;A physical device.&lt;/enum&gt;
         &lt;enum value="service"&gt;A service that may provide APIs.&lt;/enum&gt;
         &lt;enum value="policy"&gt;An enforceable policy.&lt;/enum&gt;
         &lt;enum value="physical"&gt;A tangible asset used to provide physical protections or countermeasures.&lt;/enum&gt;
         &lt;enum value="process-procedure"&gt;A list of steps or actions to take to achieve some end result.&lt;/enum&gt;
         &lt;enum value="plan"&gt;An applicable plan.&lt;/enum&gt;
         &lt;enum value="guidance"&gt;Any guideline or recommendation.&lt;/enum&gt;
         &lt;enum value="standard"&gt;Any organizational or industry standard.&lt;/enum&gt;
         &lt;enum value="validation"&gt;An external assessment performed on some other component, that has been validated by a third-party.&lt;/enum&gt;
         &lt;enum value="network"&gt;A physical or virtual network.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/protocol" class="toc1 head">Assembly
         <code>protocol</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Service Protocol Information</p>
      <p class="description">Information about the protocol used to provide a service.</p>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/protocol/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-implementation-common/protocol/name">Flag (defined inline) <code>name</code></li>
         <li id="/assembly/oscal-implementation-common/protocol/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-implementation-common/protocol/port-range">Assembly (reference) <code>port-range</code> - grouped as <code>port-ranges</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/protocol"
                 _metaschema-json-id="/assembly/oscal-implementation-common/protocol"
                 scope="global"
                 name="protocol"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:protocol"&gt;
   &lt;formal-name&gt;Service Protocol Information&lt;/formal-name&gt;
   &lt;description&gt;Information about the protocol used to provide a service.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/uuid"
                _metaschema-json-id="/assembly/oscal-implementation-common/protocol/uuid"
                required="no"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Service Protocol Information Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A globally unique identifier that can be used to reference this service protocol entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="name"
                _key="name"
                _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/name"
                _metaschema-json-id="/assembly/oscal-implementation-common/protocol/name"
                required="yes"
                as-type="string"
                name="name"
                _using-name="name"
                _in-xml-name="name"
                _in-json-name="name"&gt;
      &lt;formal-name&gt;Protocol Name&lt;/formal-name&gt;
      &lt;description&gt;The common name of the protocol, which should be the appropriate "service name" from the &lt;a href="https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml"&gt;IANA Service Name and Transport Protocol Port Number Registry&lt;/a&gt;. &lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;The short name of the protocol (e.g., https).&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/title"
                    _metaschema-json-id="/assembly/oscal-implementation-common/protocol/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Protocol Title&lt;/formal-name&gt;
         &lt;description&gt;A human readable name for the protocol (e.g., Transport Layer Security).&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="port-range"
                _key="port-ranges"
                _group-name="port-ranges"
                _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/port-range"
                _metaschema-json-id="/assembly/oscal-implementation-common/protocol/port-ranges"
                max-occurs="unbounded"
                min-occurs="0"
                ref="port-range"
                _key-ref="oscal-implementation-common:port-range"
                _using-name="port-range"
                _in-xml-name="port-range"
                _in-json-name="port-ranges"&gt;
         &lt;group-as name="port-ranges" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/port-range" class="toc1 head">Assembly
         <code>port-range</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Port Range</p>
      <p class="description">Where applicable this is the IPv4 port range on which the service operates.</p>
      <div class="remarks">
         <p class="p">To be validated as a natural number (integer &gt;= 1). A single port uses the same value
            for start and end. Use multiple 'port-range' entries for non-contiguous ranges.</p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <div class="service">
            <p class="element-label"><span class="lbl">service</span></p>
            
            <div class="protocol">
               <p class="element-label"><span class="lbl">protocol</span></p>
               
               <div class="port-range">
                  <p class="element-label"><span class="lbl">port-range</span></p>
               </div>
               </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/port-range/start">Flag (defined inline) <code>start</code></li>
         <li id="/assembly/oscal-implementation-common/port-range/end">Flag (defined inline) <code>end</code></li>
         <li id="/assembly/oscal-implementation-common/port-range/transport">Flag (defined inline) <code>transport</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/port-range"
                 _metaschema-json-id="/assembly/oscal-implementation-common/port-range"
                 scope="global"
                 name="port-range"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:port-range"&gt;
   &lt;formal-name&gt;Port Range&lt;/formal-name&gt;
   &lt;description&gt;Where applicable this is the IPv4 port range on which the service operates.&lt;/description&gt;
   &lt;define-flag _step="start"
                _key="start"
                _metaschema-xml-id="/assembly/oscal-implementation-common/port-range/start"
                _metaschema-json-id="/assembly/oscal-implementation-common/port-range/start"
                required="no"
                as-type="nonNegativeInteger"
                name="start"
                _using-name="start"
                _in-xml-name="start"
                _in-json-name="start"&gt;
      &lt;formal-name&gt;Start&lt;/formal-name&gt;
      &lt;description&gt;Indicates the starting port number in a port range&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;Should be a number within a permitted range&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="end"
                _key="end"
                _metaschema-xml-id="/assembly/oscal-implementation-common/port-range/end"
                _metaschema-json-id="/assembly/oscal-implementation-common/port-range/end"
                required="no"
                as-type="nonNegativeInteger"
                name="end"
                _using-name="end"
                _in-xml-name="end"
                _in-json-name="end"&gt;
      &lt;formal-name&gt;End&lt;/formal-name&gt;
      &lt;description&gt;Indicates the ending port number in a port range&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;Should be a number within a permitted range&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="transport"
                _key="transport"
                _metaschema-xml-id="/assembly/oscal-implementation-common/port-range/transport"
                _metaschema-json-id="/assembly/oscal-implementation-common/port-range/transport"
                required="no"
                as-type="NCName"
                name="transport"
                _using-name="transport"
                _in-xml-name="transport"
                _in-json-name="transport"&gt;
      &lt;formal-name&gt;Transport&lt;/formal-name&gt;
      &lt;description&gt;Indicates the transport type.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values&gt;
            &lt;enum value="TCP"&gt;Transmission Control Protocol&lt;/enum&gt;
            &lt;enum value="UDP"&gt;User Datagram Protocol&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;remarks&gt;
      &lt;p&gt;To be validated as a natural number (integer &amp;gt;= 1). A single port uses the same value for start and end. Use multiple 'port-range' entries for non-contiguous ranges.&lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;service xmlns="http://csrc.nist.gov/ns/oscal/1.0"
               id="svc-01"
               name="Domain Name Service (DNS) Lookup"&gt;
         &lt;protocol name="dns"&gt;
            &lt;port-range start="53" end="53" transport="tcp"/&gt;
         &lt;/protocol&gt;
      &lt;/service&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/implementation-status" class="toc1 head">Assembly
         <code>implementation-status</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Implementation Status</p>
      <p class="description">Indicates the degree to which the a given control is implemented.</p>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/implementation-status/state">Flag (defined inline) <code>state</code></li>
         <li id="/assembly/oscal-implementation-common/implementation-status/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/implementation-status"
                 _metaschema-json-id="/assembly/oscal-implementation-common/implementation-status"
                 scope="global"
                 name="implementation-status"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:implementation-status"&gt;
   &lt;formal-name&gt;Implementation Status&lt;/formal-name&gt;
   &lt;description&gt;Indicates the degree to which the a given control is implemented.&lt;/description&gt;
   &lt;define-flag _step="state"
                _key="state"
                _metaschema-xml-id="/assembly/oscal-implementation-common/implementation-status/state"
                _metaschema-json-id="/assembly/oscal-implementation-common/implementation-status/state"
                required="yes"
                as-type="NCName"
                name="state"
                _using-name="state"
                _in-xml-name="state"
                _in-json-name="state"&gt;
      &lt;formal-name&gt;Implementation State&lt;/formal-name&gt;
      &lt;description&gt;Identifies the implementation status of the control or control objective.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="implemented"&gt;The control is fully implemented.&lt;/enum&gt;
            &lt;enum value="partial"&gt;The control is partially implemented.&lt;/enum&gt;
            &lt;enum value="planned"&gt;There is a plan for implementing the control as explained in the remarks.&lt;/enum&gt;
            &lt;enum value="alternative"&gt;There is an alternative implementation for this control as explained in the remarks.&lt;/enum&gt;
            &lt;enum value="not-applicable"&gt;This control does not apply to this system as justified in the remarks.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-implementation-common/implementation-status/remarks"
             _metaschema-json-id="/assembly/oscal-implementation-common/implementation-status/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/system-user" class="toc1 head">Assembly
         <code>system-user</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">System User</p>
      <p class="description">A type of user that interacts with the system based on an associated role.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The type of user, such as internal, external, or general-public.</p>
            
            <p class="enum"><span class="lbl">enum</span>The user's privilege level within the system, such as privileged, non-privileged,
               no-logical-access.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A user account for a person or entity that is part of the organization who owns or
               operates the system.</p>
            
            <p class="enum"><span class="lbl">enum</span>A user account for a person or entity that is not part of the organization who owns
               or operates the system.</p>
            
            <p class="enum"><span class="lbl">enum</span>A user of the system considered to be outside </p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>This role has elevated access to the system, such as a group or system administrator.</p>
            
            <p class="enum"><span class="lbl">enum</span>This role has typical user-level access to the system without elevated access.</p>
            
            <p class="enum"><span class="lbl">enum</span>This role has no access to the system, such as a manager who approves access as part
               of a process.</p>
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Accountable for ensuring the asset is managed in accordance with organizational policies
               and procedures.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for administering a set of assets.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the security operations center (SOC).</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the network operations center (NOC).</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for responding to an event that could lead to loss of, or disruption to,
               an organization's operations, services or functions.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for providing information and support to users.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the configuration management processes governing changes to the asset.</p>
            
            </div>
         </div>
      <div class="remarks">
         <p class="p">Permissible values to be determined closer to the application, such as by a receiving
            authority.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/system-user/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/short-name">Field (defined inline) <code>short-name</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/role-id">Field (reference) <code>role-id</code> - grouped as <code>role-ids</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/authorized-privilege">Assembly (reference) <code>authorized-privilege</code> - grouped as <code>authorized-privileges</code></li>
         <li id="/assembly/oscal-implementation-common/system-user/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/system-user"
                 _metaschema-json-id="/assembly/oscal-implementation-common/system-user"
                 scope="global"
                 name="system-user"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:system-user"&gt;
   &lt;formal-name&gt;System User&lt;/formal-name&gt;
   &lt;description&gt;A type of user that interacts with the system based on an associated role.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/uuid"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-user/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;User Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;The unique identifier for the user class.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/title"
                    _metaschema-json-id="/assembly/oscal-implementation-common/system-user/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;User Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the user, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="short-name"
                    _key="short-name"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/short-name"
                    _metaschema-json-id="/assembly/oscal-implementation-common/system-user/short-name"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="string"
                    name="short-name"
                    _using-name="short-name"
                    _in-xml-name="short-name"
                    _in-json-name="short-name"&gt;
         &lt;formal-name&gt;User Short Name&lt;/formal-name&gt;
         &lt;description&gt;A short common name, abbreviation, or acronym for the user.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/description"
                    _metaschema-json-id="/assembly/oscal-implementation-common/system-user/description"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;User Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the user's purpose within the system.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/prop"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-user/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/link"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-user/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="role-id"
             _key="role-ids"
             _group-name="role-ids"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/role-id"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-user/role-ids"
             max-occurs="unbounded"
             min-occurs="0"
             ref="role-id"
             _key-ref="oscal-metadata:role-id"
             _using-name="role-id"
             _in-xml-name="role-id"
             _in-json-name="role-ids"&gt;
         &lt;group-as name="role-ids" in-json="ARRAY"/&gt;
      &lt;/field&gt;
      &lt;assembly _step="authorized-privilege"
                _key="authorized-privileges"
                _group-name="authorized-privileges"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/authorized-privilege"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-user/authorized-privileges"
                max-occurs="unbounded"
                min-occurs="0"
                ref="authorized-privilege"
                _key-ref="oscal-implementation-common:authorized-privilege"
                _using-name="authorized-privilege"
                _in-xml-name="authorized-privilege"
                _in-json-name="authorized-privileges"&gt;
         &lt;group-as name="authorized-privileges" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/remarks"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-user/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="type"&gt;The type of user, such as internal, external, or general-public.&lt;/enum&gt;
         &lt;enum value="privilege-level"&gt;The user's privilege level within the system, such as privileged, non-privileged, no-logical-access.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='type']/@value"&gt;
         &lt;enum value="internal"&gt;A user account for a person or entity that is part of the organization who owns or operates the system.&lt;/enum&gt;
         &lt;enum value="external"&gt;A user account for a person or entity that is not part of the organization who owns or operates the system.&lt;/enum&gt;
         &lt;enum value="general-public"&gt;A user of the system considered to be outside &lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='privilege-level']/@value"&gt;
         &lt;enum value="privileged"&gt;This role has elevated access to the system, such as a group or system administrator.&lt;/enum&gt;
         &lt;enum value="non-privileged"&gt;This role has typical user-level access to the system without elevated access.&lt;/enum&gt;
         &lt;enum value="no-logical-access"&gt;This role has no access to the system, such as a manager who approves access as part of a process.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="role-id" allow-other="yes"&gt;
         &lt;enum value="asset-owner"&gt;Accountable for ensuring the asset is managed in accordance with organizational policies and procedures.&lt;/enum&gt;
         &lt;enum value="asset-administrator"&gt;Responsible for administering a set of assets.&lt;/enum&gt;
         &lt;enum value="security-operations"&gt;Members of the security operations center (SOC).&lt;/enum&gt;
         &lt;enum value="network-operations"&gt;Members of the network operations center (NOC).&lt;/enum&gt;
         &lt;enum value="incident-response"&gt;Responsible for responding to an event that could lead to loss of, or disruption to, an organization's operations, services or functions.&lt;/enum&gt;
         &lt;enum value="help-desk"&gt;Responsible for providing information and support to users.&lt;/enum&gt;
         &lt;enum value="configuration-management"&gt;Responsible for the configuration management processes governing changes to the asset.&lt;/enum&gt;
      &lt;/allowed-values&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;Permissible values to be determined closer to the application, such as by a receiving authority.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/authorized-privilege" class="toc1 head">Assembly
         <code>authorized-privilege</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Privilege</p>
      <p class="description">Identifies a specific system privilege held by the user, along with an associated
         description and/or rationale for the privilege.</p>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/authorized-privilege/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-implementation-common/authorized-privilege/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-implementation-common/authorized-privilege/function-performed">Field (reference) <code>function-performed</code> - grouped as <code>functions-performed</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/authorized-privilege"
                 _metaschema-json-id="/assembly/oscal-implementation-common/authorized-privilege"
                 scope="global"
                 name="authorized-privilege"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:authorized-privilege"&gt;
   &lt;formal-name&gt;Privilege&lt;/formal-name&gt;
   &lt;description&gt;Identifies a specific system privilege held by the user, along with an associated description and/or rationale for the privilege.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/authorized-privilege/title"
                    _metaschema-json-id="/assembly/oscal-implementation-common/authorized-privilege/title"
                    max-occurs="1"
                    min-occurs="1"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Privilege Title&lt;/formal-name&gt;
         &lt;description&gt;A human readable name for the privilege.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/authorized-privilege/description"
                    _metaschema-json-id="/assembly/oscal-implementation-common/authorized-privilege/description"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Privilege Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the privilege's purpose within the system.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;field _step="function-performed"
             _key="functions-performed"
             _group-name="functions-performed"
             _metaschema-xml-id="/assembly/oscal-implementation-common/authorized-privilege/function-performed"
             _metaschema-json-id="/assembly/oscal-implementation-common/authorized-privilege/functions-performed"
             max-occurs="unbounded"
             min-occurs="1"
             ref="function-performed"
             _key-ref="oscal-implementation-common:function-performed"
             _using-name="function-performed"
             _in-xml-name="function-performed"
             _in-json-name="functions-performed"&gt;
         &lt;group-as name="functions-performed" in-json="ARRAY"/&gt;
      &lt;/field&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-implementation-common/function-performed" class="toc1 head">Field <code>function-performed</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Functions Performed</p>
      <p class="description">Describes a function performed for a given authorized privilege by this user class.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-implementation-common/function-performed"
              _metaschema-json-id="/field/oscal-implementation-common/function-performed"
              collapsible="no"
              as-type="string"
              scope="global"
              name="function-performed"
              module="oscal-implementation-common"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
              _key-name="oscal-implementation-common:function-performed"&gt;
   &lt;formal-name&gt;Functions Performed&lt;/formal-name&gt;
   &lt;description&gt;Describes a function performed for a given authorized privilege by this user class.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/inventory-item" class="toc1 head">Assembly
         <code>inventory-item</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Inventory Item</p>
      <p class="description">A single managed inventory item within the system.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The Internet Protocol v4 Address of the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>The Internet Protocol v6 Address of the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>The full-qualified domain name (FQDN) of the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>A Uniform Resource Identifier (URI) for the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>A serial number for the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>The NetBIOS name for the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>The media access control (MAC) address for the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>The physical location of the asset's hardware (e.g., Data Center ID, Cage#, Rack#,
               or other meaningful location identifiers).</p>
            
            <p class="enum"><span class="lbl">enum</span>is the asset subjected to network scans? (yes/no)</p>
            
            
            
            
            
            <p class="enum"><span class="lbl">enum</span>The model number of the hardware used by the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>The name of the operating system used by the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>The version of the operating system used by the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>The software product name used by the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>The software product version used by the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>The software product patch level used by the asset.</p>
            
            
            
            
            
            
            <p class="enum"><span class="lbl">enum</span>Simple indication of the asset's function, such as Router, Storage Array, DNS Server.</p>
            
            <p class="enum"><span class="lbl">enum</span>An organizationally specific identifier that is used to uniquely identify a logical
               or tangible item by the organization that owns the item.</p>
            
            <p class="enum"><span class="lbl">enum</span>An asset tag assigned by the organization responsible for maintaining the logical
               or tangible item.</p>
            
            <p class="enum"><span class="lbl">enum</span>Identifies whether the asset is publicly accessible (yes/no)</p>
            
            <p class="enum"><span class="lbl">enum</span>Identifies whether the asset is virtualized (yes/no)</p>
            
            <p class="enum"><span class="lbl">enum</span>Virtual LAN identifier of the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>The network identifier of the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>A human-readable label for the parent context.</p>
            
            <p class="enum"><span class="lbl">enum</span>An alternative identifier, whose value is easily sortable among other such values
               in the document.</p>
            
            <p class="enum"><span class="lbl">enum</span>The name of the baseline configuration for the asset.</p>
            
            <p class="enum"><span class="lbl">enum</span>Can the asset be check with an authenticated scan? (yes/no)</p>
            
            <p class="enum"><span class="lbl">enum</span>The function provided by the asset for the system.</p>
            
            
            </div>
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            
            
            <p class="enum"><span class="lbl">enum</span>System software that manages computer hardware, software resources, and provides common
               services for computer programs.</p>
            
            <p class="enum"><span class="lbl">enum</span>An electronic collection of data, or information, that is specially organized for
               rapid search and retrieval.</p>
            
            <p class="enum"><span class="lbl">enum</span>A system that delivers content or services to end users over the Internet or an intranet.</p>
            
            <p class="enum"><span class="lbl">enum</span>A system that resolves domain names to internet protocol (IP) addresses.</p>
            
            <p class="enum"><span class="lbl">enum</span>A computer system that sends and receives electronic mail messages.</p>
            
            <p class="enum"><span class="lbl">enum</span>A  system that stores, organizes and provides access to directory information in order
               to unify network resources.</p>
            
            <p class="enum"><span class="lbl">enum</span>A private branch exchange (PBX) provides a a private telephone switchboard.</p>
            
            <p class="enum"><span class="lbl">enum</span>A network security system that monitors and controls incoming and outgoing network
               traffic based on predetermined security rules.</p>
            
            <p class="enum"><span class="lbl">enum</span>A physical or virtual networking device that forwards data packets between computer
               networks.</p>
            
            <p class="enum"><span class="lbl">enum</span>A physical or virtual networking device that connects devices within a computer network
               by using packet switching to receive and forward data to the destination device.</p>
            
            <p class="enum"><span class="lbl">enum</span>A consolidated, block-level data storage capability.</p>
            
            <p class="enum"><span class="lbl">enum</span>A physical or virtual machine that centralizes hardware, software, or services for
               a specific purpose.</p>
            
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The name of the company or organization </p>
            </div>
         
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>The asset is included in periodic vulnerability scanning.</p>
            
            <p class="enum"><span class="lbl">enum</span>The asset is not included in periodic vulnerability scanning.</p>
            </div>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A reference to the baseline template used to configure the asset.</p>
            </div>
         
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>Accountable for ensuring the asset is managed in accordance with organizational policies
               and procedures.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for administering a set of assets.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the security operations center (SOC).</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Members of the network operations center (NOC).</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for responding to an event that could lead to loss of, or disruption to,
               an organization's operations, services or functions.</p>
            
            <p class="enum"><span class="lbl">enum</span>Responsible for providing information and support to users.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the configuration management processes governing changes to the asset.</p>
            
            
            <p class="enum"><span class="lbl">enum</span>Responsible for the creation and maintenance of a component.</p>
            
            <p class="enum"><span class="lbl">enum</span>Organization responsible for providing the component, if this is different from the
               "maintainer" (e.g., a reseller).</p>
            
            </div>
         
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="index-has-key">
            <p class="element-label"><span class="lbl">index-has-key</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            </div>
         
         <div class="is-unique">
            <p class="element-label"><span class="lbl">is-unique</span></p>
            
            <div class="key-field">
               <p class="element-label"><span class="lbl">key-field</span></p>
            </div>
            
            <div class="remarks">
               <p class="p">Since <code>responsible-party</code> associates multiple <code>party-uuid</code> entries with a single <code>role-id</code>, each role-id must be referenced only once.</p>
            </div>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/inventory-item/uuid">Flag (defined inline) <code>uuid</code></li>
         <li id="/assembly/oscal-implementation-common/inventory-item/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-implementation-common/inventory-item/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-implementation-common/inventory-item/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-implementation-common/inventory-item/responsible-party">Assembly (reference) <code>responsible-party</code> - grouped as <code>responsible-parties</code></li>
         <li id="/assembly/oscal-implementation-common/inventory-item/implemented-component">Assembly (defined inline) <code>implemented-component</code> - grouped as <code>implemented-components</code></li>
         <li id="/assembly/oscal-implementation-common/inventory-item/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item"
                 _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item"
                 scope="global"
                 name="inventory-item"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:inventory-item"&gt;
   &lt;formal-name&gt;Inventory Item&lt;/formal-name&gt;
   &lt;description&gt;A single managed inventory item within the system.&lt;/description&gt;
   &lt;define-flag _step="uuid"
                _key="uuid"
                _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/uuid"
                _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/uuid"
                required="yes"
                as-type="uuid"
                name="uuid"
                _using-name="uuid"
                _in-xml-name="uuid"
                _in-json-name="uuid"&gt;
      &lt;formal-name&gt;Inventory Item Universally Unique Identifier&lt;/formal-name&gt;
      &lt;description&gt;A globally unique identifier that can be used to reference this inventory item entry elsewhere in an OSCAL document. A UUID should be consistently used for a given resource across revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/description"
                    _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/description"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Inventory Item Description&lt;/formal-name&gt;
         &lt;description&gt;A summary of the inventory item stating its purpose within the system.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/prop"
                _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/link"
                _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="responsible-party"
                _key="responsible-parties"
                _group-name="responsible-parties"
                _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/responsible-party"
                _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/responsible-parties"
                max-occurs="unbounded"
                min-occurs="0"
                ref="responsible-party"
                _key-ref="oscal-metadata:responsible-party"
                _using-name="responsible-party"
                _in-xml-name="responsible-party"
                _in-json-name="responsible-parties"&gt;
         &lt;group-as name="responsible-parties" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-assembly _step="implemented-component"
                       _key="implemented-components"
                       _group-name="implemented-components"
                       _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component"
                       _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="implemented-component"
                       _using-name="implemented-component"
                       _in-xml-name="implemented-component"
                       _in-json-name="implemented-components"&gt;
         &lt;formal-name&gt;Implemented Component&lt;/formal-name&gt;
         &lt;description&gt;The set of components that are implemented in a given system inventory item.&lt;/description&gt;
         &lt;group-as name="implemented-components" in-json="ARRAY"/&gt;
         &lt;define-flag _step="component-uuid"
                      _key="component-uuid"
                      _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component/component-uuid"
                      _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components/component-uuid"
                      required="yes"
                      as-type="uuid"
                      name="component-uuid"
                      _using-name="component-uuid"
                      _in-xml-name="component-uuid"
                      _in-json-name="component-uuid"&gt;
            &lt;formal-name&gt;Component Universally Unique Identifier Reference&lt;/formal-name&gt;
            &lt;description&gt;A reference to a component that is implemented as part of an inventory item.&lt;/description&gt;
         &lt;/define-flag&gt;
         &lt;model&gt;
            &lt;assembly _step="prop"
                      _key="props"
                      _group-name="props"
                      _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component/prop"
                      _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components/props"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="property"
                      _key-ref="oscal-metadata:property"
                      _using-name="prop"
                      _in-xml-name="prop"
                      _in-json-name="props"&gt;
               &lt;group-as name="props" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="link"
                      _key="links"
                      _group-name="links"
                      _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component/link"
                      _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components/links"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="link"
                      _key-ref="oscal-metadata:link"
                      _using-name="link"
                      _in-xml-name="link"
                      _in-json-name="links"&gt;
               &lt;group-as name="links" in-json="ARRAY"/&gt;
            &lt;/assembly&gt;
            &lt;assembly _step="responsible-party"
                      _key="responsible-parties"
                      _group-name="responsible-parties"
                      _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component/responsible-party"
                      _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components/responsible-parties"
                      max-occurs="unbounded"
                      min-occurs="0"
                      ref="responsible-party"
                      _key-ref="oscal-metadata:responsible-party"
                      _using-name="responsible-party"
                      _in-xml-name="responsible-party"
                      _in-json-name="responsible-parties"&gt;
               &lt;group-as name="responsible-parties" in-json="ARRAY"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;This construct is used to either: 1) associate a party or parties to a role defined on the component using the &lt;code&gt;responsible-role&lt;/code&gt; construct, or 2) to define a party or parties that are responsible for a role defined within the context of the containing &lt;code&gt;inventory-item&lt;/code&gt;. &lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/assembly&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component/remarks"
                   _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
         &lt;constraint&gt;
            &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
               &lt;enum value="version"&gt;The version of the component.&lt;/enum&gt;
               &lt;enum value="patch-level"&gt;The specific patch level of the component.&lt;/enum&gt;
               &lt;enum value="model"&gt;The model of the component.&lt;/enum&gt;
               &lt;enum value="release-date"&gt;The date the component was released, such as a software release date or policy publication date.&lt;/enum&gt;
               &lt;enum value="validation-type"&gt;Used with component-type='validation' to provide a well-known name for a kind of validation.&lt;/enum&gt;
               &lt;enum value="validation-reference"&gt;Used with component-type='validation' to indicate the validating body's assigned identifier for their validation of this component.&lt;/enum&gt;
               &lt;enum value="asset-type"&gt;Simple indication of the asset's function, such as Router, Storage Array, DNS Server.&lt;/enum&gt;
               &lt;enum value="asset-id"&gt;An organizationally specific identifier that is used to uniquely identify a logical or tangible item by the organization that owns the item.&lt;/enum&gt;
               &lt;enum value="asset-tag"&gt;An asset tag assigned by the organization responsible for maintaining the logical or tangible item.&lt;/enum&gt;
               &lt;enum value="public"&gt;Identifies whether the asset is publicly accessible (yes/no)&lt;/enum&gt;
               &lt;enum value="virtual"&gt;Identifies whether the asset is virtualized (yes/no)&lt;/enum&gt;
               &lt;enum value="vlan-id"&gt;Virtual LAN identifier of the asset.&lt;/enum&gt;
               &lt;enum value="network-id"&gt;The network identifier of the asset.&lt;/enum&gt;
               &lt;enum value="label"&gt;A human-readable label for the parent context.&lt;/enum&gt;
               &lt;enum value="sort-id"&gt;An alternative identifier, whose value is easily sortable among other such values in the document.&lt;/enum&gt;
               &lt;enum value="baseline-configuration-name"&gt;The name of the baseline configuration for the asset.&lt;/enum&gt;
               &lt;enum value="allows-authenticated-scan"&gt;Can the asset be check with an authenticated scan? (yes/no)&lt;/enum&gt;
               &lt;enum value="function"&gt;The function provided by the asset for the system.&lt;/enum&gt;
            &lt;/allowed-values&gt;
            &lt;has-cardinality target="prop[@name='asset-id']" min-occurs="1"/&gt;
            &lt;allowed-values target="responsible-party/@role-id" allow-other="yes"&gt;
               &lt;enum value="asset-owner"&gt;Accountable for ensuring the asset is managed in accordance with organizational policies and procedures.&lt;/enum&gt;
               &lt;enum value="asset-administrator"&gt;Responsible for administering a set of assets.&lt;/enum&gt;
               &lt;enum value="security-operations"&gt;Members of the security operations center (SOC).&lt;/enum&gt;
               &lt;enum value="network-operations"&gt;Members of the network operations center (NOC).&lt;/enum&gt;
               &lt;enum value="incident-response"&gt;Responsible for responding to an event that could lead to loss of, or disruption to, an organization's operations, services or functions.&lt;/enum&gt;
               &lt;enum value="help-desk"&gt;Responsible for providing information and support to users.&lt;/enum&gt;
               &lt;enum value="configuration-management"&gt;Responsible for the configuration management processes governing changes to the asset.&lt;/enum&gt;
            &lt;/allowed-values&gt;
            &lt;is-unique name="unique-implemented-component-responsible-party"
                       target="responsible-party"&gt;
               &lt;key-field target="@role-id"/&gt;
               &lt;remarks&gt;
                  &lt;p&gt;Since &lt;code&gt;responsible-party&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
               &lt;/remarks&gt;
            &lt;/is-unique&gt;
         &lt;/constraint&gt;
      &lt;/define-assembly&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/remarks"
             _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="ipv4-address"&gt;The Internet Protocol v4 Address of the asset.&lt;/enum&gt;
         &lt;enum value="ipv6-address"&gt;The Internet Protocol v6 Address of the asset.&lt;/enum&gt;
         &lt;enum value="fqdn"&gt;The full-qualified domain name (FQDN) of the asset.&lt;/enum&gt;
         &lt;enum value="uri"&gt;A Uniform Resource Identifier (URI) for the asset.&lt;/enum&gt;
         &lt;enum value="serial-number"&gt;A serial number for the asset.&lt;/enum&gt;
         &lt;enum value="netbios-name"&gt;The NetBIOS name for the asset.&lt;/enum&gt;
         &lt;enum value="mac-address"&gt;The media access control (MAC) address for the asset.&lt;/enum&gt;
         &lt;enum value="physical-location"&gt;The physical location of the asset's hardware (e.g., Data Center ID, Cage#, Rack#, or other meaningful location identifiers).&lt;/enum&gt;
         &lt;enum value="is-scanned"&gt;is the asset subjected to network scans? (yes/no)&lt;/enum&gt;
         &lt;enum value="hardware-model"&gt;The model number of the hardware used by the asset.&lt;/enum&gt;
         &lt;enum value="os-name"&gt;The name of the operating system used by the asset.&lt;/enum&gt;
         &lt;enum value="os-version"&gt;The version of the operating system used by the asset.&lt;/enum&gt;
         &lt;enum value="software-name"&gt;The software product name used by the asset.&lt;/enum&gt;
         &lt;enum value="software-version"&gt;The software product version used by the asset.&lt;/enum&gt;
         &lt;enum value="software-patch-level"&gt;The software product patch level used by the asset.&lt;/enum&gt;
         &lt;enum value="asset-type"&gt;Simple indication of the asset's function, such as Router, Storage Array, DNS Server.&lt;/enum&gt;
         &lt;enum value="asset-id"&gt;An organizationally specific identifier that is used to uniquely identify a logical or tangible item by the organization that owns the item.&lt;/enum&gt;
         &lt;enum value="asset-tag"&gt;An asset tag assigned by the organization responsible for maintaining the logical or tangible item.&lt;/enum&gt;
         &lt;enum value="public"&gt;Identifies whether the asset is publicly accessible (yes/no)&lt;/enum&gt;
         &lt;enum value="virtual"&gt;Identifies whether the asset is virtualized (yes/no)&lt;/enum&gt;
         &lt;enum value="vlan-id"&gt;Virtual LAN identifier of the asset.&lt;/enum&gt;
         &lt;enum value="network-id"&gt;The network identifier of the asset.&lt;/enum&gt;
         &lt;enum value="label"&gt;A human-readable label for the parent context.&lt;/enum&gt;
         &lt;enum value="sort-id"&gt;An alternative identifier, whose value is easily sortable among other such values in the document.&lt;/enum&gt;
         &lt;enum value="baseline-configuration-name"&gt;The name of the baseline configuration for the asset.&lt;/enum&gt;
         &lt;enum value="allows-authenticated-scan"&gt;Can the asset be check with an authenticated scan? (yes/no)&lt;/enum&gt;
         &lt;enum value="function"&gt;The function provided by the asset for the system.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='asset-type']/@value"&gt;
         &lt;enum value="operating-system"&gt;System software that manages computer hardware, software resources, and provides common services for computer programs.&lt;/enum&gt;
         &lt;enum value="database"&gt;An electronic collection of data, or information, that is specially organized for rapid search and retrieval.&lt;/enum&gt;
         &lt;enum value="web-server"&gt;A system that delivers content or services to end users over the Internet or an intranet.&lt;/enum&gt;
         &lt;enum value="dns-server"&gt;A system that resolves domain names to internet protocol (IP) addresses.&lt;/enum&gt;
         &lt;enum value="email-server"&gt;A computer system that sends and receives electronic mail messages.&lt;/enum&gt;
         &lt;enum value="directory-server"&gt;A  system that stores, organizes and provides access to directory information in order to unify network resources.&lt;/enum&gt;
         &lt;enum value="pbx"&gt;A private branch exchange (PBX) provides a a private telephone switchboard.&lt;/enum&gt;
         &lt;enum value="firewall"&gt;A network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules.&lt;/enum&gt;
         &lt;enum value="router"&gt;A physical or virtual networking device that forwards data packets between computer networks.&lt;/enum&gt;
         &lt;enum value="switch"&gt;A physical or virtual networking device that connects devices within a computer network by using packet switching to receive and forward data to the destination device.&lt;/enum&gt;
         &lt;enum value="storage-array"&gt;A consolidated, block-level data storage capability.&lt;/enum&gt;
         &lt;enum value="appliance"&gt;A physical or virtual machine that centralizes hardware, software, or services for a specific purpose.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="(.)[@type=('software', 'hardware', 'service')]/prop/@name"
                      allow-other="yes"&gt;
         &lt;enum value="vendor-name"&gt;The name of the company or organization &lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="prop[@name='is-scanned']/@value"&gt;
         &lt;enum value="yes"&gt;The asset is included in periodic vulnerability scanning.&lt;/enum&gt;
         &lt;enum value="no"&gt;The asset is not included in periodic vulnerability scanning.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="link/@rel" allow-other="yes"&gt;
         &lt;enum value="baseline-template"&gt;A reference to the baseline template used to configure the asset.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;allowed-values target="responsible-party/@role-id" allow-other="yes"&gt;
         &lt;enum value="asset-owner"&gt;Accountable for ensuring the asset is managed in accordance with organizational policies and procedures.&lt;/enum&gt;
         &lt;enum value="asset-administrator"&gt;Responsible for administering a set of assets.&lt;/enum&gt;
         &lt;enum value="security-operations"&gt;Members of the security operations center (SOC).&lt;/enum&gt;
         &lt;enum value="network-operations"&gt;Members of the network operations center (NOC).&lt;/enum&gt;
         &lt;enum value="incident-response"&gt;Responsible for responding to an event that could lead to loss of, or disruption to, an organization's operations, services or functions.&lt;/enum&gt;
         &lt;enum value="help-desk"&gt;Responsible for providing information and support to users.&lt;/enum&gt;
         &lt;enum value="configuration-management"&gt;Responsible for the configuration management processes governing changes to the asset.&lt;/enum&gt;
         &lt;enum value="maintainer"&gt;Responsible for the creation and maintenance of a component.&lt;/enum&gt;
         &lt;enum value="provider"&gt;Organization responsible for providing the component, if this is different from the "maintainer" (e.g., a reseller).&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;index-has-key name="index-metadata-role-id" target="responsible-party"&gt;
         &lt;key-field target="@role-id"/&gt;
      &lt;/index-has-key&gt;
      &lt;index-has-key name="index-metadata-party-uuid" target="responsible-party"&gt;
         &lt;key-field target="@party-uuid"/&gt;
      &lt;/index-has-key&gt;
      &lt;is-unique name="unique-inventory-item-responsible-party"
                 target="responsible-party"&gt;
         &lt;key-field target="@role-id"/&gt;
         &lt;remarks&gt;
            &lt;p&gt;Since &lt;code&gt;responsible-party&lt;/code&gt; associates multiple &lt;code&gt;party-uuid&lt;/code&gt; entries with a single &lt;code&gt;role-id&lt;/code&gt;, each role-id must be referenced only once.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/is-unique&gt;
   &lt;/constraint&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-implementation-common/source" class="toc1 head">Flag <code>source</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Source Resource Reference</p>
      <p class="description">A reference to an OSCAL catalog or profile providing the referenced control or subcontrol
         definition.</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-implementation-common/source"
             _metaschema-json-id="/flag/oscal-implementation-common/source"
             as-type="uri-reference"
             scope="global"
             name="source"
             module="oscal-implementation-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
             _key-name="oscal-implementation-common:source"&gt;
   &lt;formal-name&gt;Source Resource Reference&lt;/formal-name&gt;
   &lt;description&gt;A reference to an OSCAL catalog or profile providing the referenced control or subcontrol definition.&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-implementation-common/statement-id" class="toc1 head">Flag <code>statement-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Control Statement Reference</p>
      <p class="description">A reference to a control statement by its identifier</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-implementation-common/statement-id"
             _metaschema-json-id="/flag/oscal-implementation-common/statement-id"
             as-type="NCName"
             scope="global"
             name="statement-id"
             module="oscal-implementation-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
             _key-name="oscal-implementation-common:statement-id"&gt;
   &lt;formal-name&gt;Control Statement Reference&lt;/formal-name&gt;
   &lt;description&gt;A reference to a control statement by its identifier&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-implementation-common/set-parameter" class="toc1 head">Assembly
         <code>set-parameter</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Set Parameter Value</p>
      <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
      <ul class="model">
         <li id="/assembly/oscal-implementation-common/set-parameter/param-id">Flag (reference) <code>param-id</code></li>
         <li id="/assembly/oscal-implementation-common/set-parameter/value">Field (defined inline) <code>parameter-value</code> - using name <code>value</code> - grouped as <code>values</code></li>
         <li id="/assembly/oscal-implementation-common/set-parameter/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter"
                 _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter"
                 scope="global"
                 name="set-parameter"
                 module="oscal-implementation-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
                 _key-name="oscal-implementation-common:set-parameter"&gt;
   &lt;formal-name&gt;Set Parameter Value&lt;/formal-name&gt;
   &lt;description&gt;Identifies the parameter that will be set by the enclosed value.&lt;/description&gt;
   &lt;flag _step="param-id"
         _key="param-id"
         _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/param-id"
         _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/param-id"
         as-type="NCName"
         required="yes"
         ref="param-id"
         _key-ref="oscal-implementation-common:param-id"
         _using-name="param-id"
         _in-xml-name="param-id"
         _in-json-name="param-id"/&gt;
   &lt;model&gt;
      &lt;define-field _step="value"
                    _key="values"
                    _group-name="values"
                    _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/value"
                    _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/values"
                    max-occurs="unbounded"
                    min-occurs="1"
                    collapsible="no"
                    as-type="string"
                    name="parameter-value"
                    _using-name="value"
                    _in-xml-name="value"
                    _in-json-name="values"&gt;
         &lt;formal-name&gt;Parameter Value&lt;/formal-name&gt;
         &lt;description&gt;A parameter value or set of values.&lt;/description&gt;
         &lt;use-name&gt;value&lt;/use-name&gt;
         &lt;group-as name="values" in-json="ARRAY"/&gt;
      &lt;/define-field&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/remarks"
             _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-implementation-common/system-id" class="toc1 head">Field <code>system-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">System Identification</p>
      <p class="description">A unique identifier for the system described by this system security plan.</p>
      <p class="json-value-key"><span class="lbl">json-value-key</span>id</p>
      <ul class="model">
         <li id="/field/oscal-implementation-common/system-id/identifier-type">Flag (defined inline) <code>identifier-type</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-implementation-common/system-id"
              _metaschema-json-id="/field/oscal-implementation-common/system-id"
              collapsible="no"
              as-type="string"
              scope="global"
              name="system-id"
              module="oscal-implementation-common"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
              _key-name="oscal-implementation-common:system-id"&gt;
   &lt;formal-name&gt;System Identification&lt;/formal-name&gt;
   &lt;description&gt;A unique identifier for the system described by this system security plan.&lt;/description&gt;
   &lt;json-value-key&gt;id&lt;/json-value-key&gt;
   &lt;define-flag _step="identifier-type"
                _key="identifier-type"
                _metaschema-xml-id="/field/oscal-implementation-common/system-id/identifier-type"
                _metaschema-json-id="/field/oscal-implementation-common/system-id/identifier-type"
                required="no"
                as-type="uri"
                name="identifier-type"
                _using-name="identifier-type"
                _in-xml-name="identifier-type"
                _in-json-name="identifier-type"&gt;
      &lt;formal-name&gt;Identification System Type&lt;/formal-name&gt;
      &lt;description&gt;Identifies the identification system from which the provided identifier was assigned.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="https://fedramp.gov"&gt;The identifier was assigned by FedRAMP.&lt;/enum&gt;
            &lt;enum value="https://ietf.org/rfc/rfc4122"&gt;A Universally Unique Identifier (UUID) as defined by RFC4122.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-implementation-common/param-id" class="toc1 head">Flag <code>param-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Parameter ID</p>
      <p class="description">A reference to a parameter within a control, who's catalog has been imported into
         the current implementation context.</p>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <div class="set-param">
            <p class="element-label"><span class="lbl">set-param</span></p>
            
            <p class="enum"><span class="lbl">enum</span>System ISSO</p>
            </div>
         </div>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-implementation-common/param-id"
             _metaschema-json-id="/flag/oscal-implementation-common/param-id"
             as-type="NCName"
             scope="global"
             name="param-id"
             module="oscal-implementation-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_implementation-common_metaschema.xml"
             _key-name="oscal-implementation-common:param-id"&gt;
   &lt;formal-name&gt;Parameter ID&lt;/formal-name&gt;
   &lt;description&gt;A reference to a parameter within a control, who's catalog has been imported into the current implementation context.&lt;/description&gt;
   &lt;example&gt;
      &lt;set-param xmlns="http://csrc.nist.gov/ns/oscal/1.0" param-id="ac-2_prm_2"&gt;
         &lt;enum&gt;System ISSO&lt;/enum&gt;
      &lt;/set-param&gt;
   &lt;/example&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/part" class="toc1 head">Assembly
         <code>part</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Part</p>
      <p class="description">A partition of a control's definition or a child of another part.</p>
      <div class="constraint">
         <p class="element-label"><span class="lbl">constraint</span></p>
         
         
         <div class="allowed-values">
            <p class="element-label"><span class="lbl">allowed-values</span></p>
            
            <p class="enum"><span class="lbl">enum</span>A human-readable label for the parent context.</p>
            
            <p class="enum"><span class="lbl">enum</span>An alternative identifier, whose value is easily sortable among other such values
               in the document.</p>
            
            </div>
         
         <div class="require">
            <p class="element-label"><span class="lbl">require</span></p>
            
            <div class="allowed-values">
               <p class="element-label"><span class="lbl">allowed-values</span></p>
               
               <p class="enum"><span class="lbl">enum</span>The assessment method to use. This typically appears on parts with the name "assessment".</p>
               </div>
            
            <div class="has-cardinality">
               <p class="element-label"><span class="lbl">has-cardinality</span></p>
            </div>
            
            <div class="allowed-values">
               <p class="element-label"><span class="lbl">allowed-values</span></p>
               
               <p class="enum"><span class="lbl">enum</span>The process of holding discussions with individuals or groups of individuals within
                  an organization to once again, facilitate assessor understanding, achieve clarification,
                  or obtain evidence.</p>
               
               <p class="enum"><span class="lbl">enum</span>The process of reviewing, inspecting, observing, studying, or analyzing one or more
                  assessment objects (i.e., specifications, mechanisms, or activities).</p>
               
               <p class="enum"><span class="lbl">enum</span>The process of exercising one or more assessment objects (i.e., activities or mechanisms)
                  under specified conditions to compare actual with expected behavior.</p>
               </div>
            </div>
         </div>
      <div class="remarks">
         <p class="p">A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
            (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
            hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
         <p class="p">A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
            within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
            a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
         <p class="p">Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
            <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
            Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
            Each organization is responsible for governance of their own extensions, and is strongly
            encouraged to publish their extensions as standards to their user community. If no
            <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
         <p class="p">To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
            DNS or other globally defined organization name should be used. For example, if FedRAMP
            and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
         <p class="p">Tools that process OSCAL content are not required to interpret unrecognized OSCAL
            extensions; however, OSCAL compliant tools should not modify or remove unrecognized
            extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
      </div>
      <div class="example">
         <p class="element-label"><span class="lbl">example</span></p>
         
         <p class="description">Multiple Parts with Different Organization-Specific Names</p>
         
         <div class="part">
            <p class="element-label"><span class="lbl">part</span></p>
            
            <p class="part"><span class="lbl">part</span>Something FedRAMP Cares About</p>
            
            <p class="part"><span class="lbl">part</span>Something DoD Cares About</p>
            </div>
         </div>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/part/id">Flag (defined inline) <code>id</code></li>
         <li id="/assembly/oscal-catalog-common/part/name">Flag (defined inline) <code>name</code></li>
         <li id="/assembly/oscal-catalog-common/part/ns">Flag (defined inline) <code>ns</code></li>
         <li id="/assembly/oscal-catalog-common/part/class">Flag (defined inline) <code>class</code></li>
         <li id="/assembly/oscal-catalog-common/part/title">Field (defined inline) <code>title</code></li>
         <li id="/assembly/oscal-catalog-common/part/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-catalog-common/part/p ul ol pre table h1 h2 h3 h4 h5 h6">Field (defined inline) <code>prose</code></li>
         <li id="/assembly/oscal-catalog-common/part/part">Assembly (reference) <code>part</code> - grouped as <code>parts</code></li>
         <li id="/assembly/oscal-catalog-common/part/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/part"
                 _metaschema-json-id="/assembly/oscal-catalog-common/part"
                 scope="global"
                 name="part"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:part"&gt;
   &lt;formal-name&gt;Part&lt;/formal-name&gt;
   &lt;description&gt;A partition of a control's definition or a child of another part.&lt;/description&gt;
   &lt;define-flag _step="id"
                _key="id"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/id"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/id"
                required="no"
                as-type="NCName"
                name="id"
                _using-name="id"
                _in-xml-name="id"
                _in-json-name="id"&gt;
      &lt;formal-name&gt;Part Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier for a specific part instance. This identifier's uniqueness is document scoped and is intended to be consistent for the same part across minor revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="name"
                _key="name"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/name"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/name"
                required="yes"
                as-type="NCName"
                name="name"
                _using-name="name"
                _in-xml-name="name"
                _in-json-name="name"&gt;
      &lt;formal-name&gt;Part Name&lt;/formal-name&gt;
      &lt;description&gt;A textual label that uniquely identifies the part's semantic type.&lt;/description&gt;
      &lt;constraint&gt;
         &lt;allowed-values allow-other="yes"&gt;
            &lt;enum value="overview"&gt;An introduction to a control or a group of controls.&lt;/enum&gt;
            &lt;enum value="statement"&gt;A set of control implementation requirements.&lt;/enum&gt;
            &lt;enum value="item"&gt;An individual item within a control statement.&lt;/enum&gt;
            &lt;enum value="guidance"&gt;Additional information to consider when selecting, implementing, assessing, and monitoring a control.&lt;/enum&gt;
            &lt;enum value="objective"&gt;Describes a set of assessment objectives.&lt;/enum&gt;
            &lt;enum value="assessment"&gt;Describes a method-based assessment over a set of assessment objects.&lt;/enum&gt;
            &lt;enum value="objects"&gt;Provides a list of assessment objects.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/constraint&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="ns"
                _key="ns"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/ns"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/ns"
                required="no"
                as-type="uri"
                name="ns"
                _using-name="ns"
                _in-xml-name="ns"
                _in-json-name="ns"&gt;
      &lt;formal-name&gt;Part Namespace&lt;/formal-name&gt;
      &lt;description&gt;A namespace qualifying the part's name. This allows different organizations to associate distinct semantics with the same name.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;Provides a means to segment the value space for the &lt;code&gt;name&lt;/code&gt;, so that different organizations and individuals can assert control over the allowed names and associated text used in a part. This allows the semantics associated with a given name to be defined on an organization-by-organization basis.&lt;/p&gt;
         &lt;p&gt;An organization MUST use a URI that they have control over. e.g., a domain registered to the organization in a URI, a registered uniform resource names (URN) namespace.&lt;/p&gt;
         &lt;p&gt;When a &lt;code&gt;ns&lt;/code&gt; is not provided, its value should be assumed to be &lt;code&gt;http://csrc.nist.gov/ns/oscal&lt;/code&gt; and the name should be a name defined by the associated OSCAL model.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="class"
                _key="class"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/class"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/class"
                required="no"
                as-type="NCName"
                name="class"
                _using-name="class"
                _in-xml-name="class"
                _in-json-name="class"&gt;
      &lt;formal-name&gt;Part Class&lt;/formal-name&gt;
      &lt;description&gt;A textual label that provides a sub-type or characterization of the part's &lt;code&gt;name&lt;/code&gt;. This can be used to further distinguish or discriminate between the semantics of multiple parts of the same control with the same &lt;code&gt;name&lt;/code&gt; and &lt;code&gt;ns&lt;/code&gt;. &lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can also be used in an OSCAL profile as a means to target an alteration to control content.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="title"
                    _key="title"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/part/title"
                    _metaschema-json-id="/assembly/oscal-catalog-common/part/title"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="title"
                    _using-name="title"
                    _in-xml-name="title"
                    _in-json-name="title"&gt;
         &lt;formal-name&gt;Part Title&lt;/formal-name&gt;
         &lt;description&gt;A name given to the part, which may be used by a tool for display and navigation.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/prop"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-field _step="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _key="prose"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/part/p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _metaschema-json-id="/assembly/oscal-catalog-common/part/prose"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="UNWRAPPED"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="prose"
                    _using-name="prose"
                    _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _in-json-name="prose"&gt;
         &lt;formal-name&gt;Part Text&lt;/formal-name&gt;
         &lt;description&gt;Permits multiple paragraphs, lists, tables etc.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="part"
                _key="parts"
                _group-name="parts"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/part"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/parts"
                max-occurs="unbounded"
                min-occurs="0"
                ref="part"
                _key-ref="oscal-catalog-common:part"
                _using-name="part"
                _in-xml-name="part"
                _in-json-name="parts"&gt;
         &lt;group-as name="parts" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/link"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
   &lt;/model&gt;
   &lt;constraint&gt;
      &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
         &lt;enum value="label"&gt;A human-readable label for the parent context.&lt;/enum&gt;
         &lt;enum value="sort-id"&gt;An alternative identifier, whose value is easily sortable among other such values in the document.&lt;/enum&gt;
      &lt;/allowed-values&gt;
      &lt;require when="@name='assessment'"&gt;
         &lt;allowed-values target="prop/@name" allow-other="yes"&gt;
            &lt;enum value="method"&gt;The assessment method to use. This typically appears on parts with the name "assessment".&lt;/enum&gt;
         &lt;/allowed-values&gt;
         &lt;has-cardinality target="prop[@name='method']" min-occurs="1"/&gt;
         &lt;allowed-values target="prop[@name='method']/@value"&gt;
            &lt;enum value="INTERVIEW"&gt;The process of holding discussions with individuals or groups of individuals within an organization to once again, facilitate assessor understanding, achieve clarification, or obtain evidence.&lt;/enum&gt;
            &lt;enum value="EXAMINE"&gt;The process of reviewing, inspecting, observing, studying, or analyzing one or more assessment objects (i.e., specifications, mechanisms, or activities).&lt;/enum&gt;
            &lt;enum value="TEST"&gt;The process of exercising one or more assessment objects (i.e., activities or mechanisms) under specified conditions to compare actual with expected behavior.&lt;/enum&gt;
         &lt;/allowed-values&gt;
      &lt;/require&gt;
   &lt;/constraint&gt;
   &lt;remarks&gt;
      &lt;p&gt;A &lt;code&gt;part&lt;/code&gt; provides for logical partitioning of prose, and can be thought of as a grouping structure (e.g., section). A &lt;code&gt;part&lt;/code&gt; can have child parts allowing for arbitrary nesting of prose content (e.g., statement hierarchy). A &lt;code&gt;part&lt;/code&gt; can contain &lt;code&gt;prop&lt;/code&gt; objects that allow for enriching prose text with structured name/value information.&lt;/p&gt;
      &lt;p&gt;A &lt;code&gt;part&lt;/code&gt; can be assigned an optional &lt;code&gt;id&lt;/code&gt;, which allows for internal and external references to the textual concept contained within a &lt;code&gt;part&lt;/code&gt;. A &lt;code&gt;id&lt;/code&gt; provides a means for an OSCAL profile, or a higher layer OSCAL model to reference a specific part within a &lt;code&gt;catalog&lt;/code&gt;. For example, an &lt;code&gt;id&lt;/code&gt; can be used to reference or to make modifications to a control statement in a profile.&lt;/p&gt;
      &lt;p&gt;Use of &lt;code&gt;part&lt;/code&gt; and &lt;code&gt;prop&lt;/code&gt; provides for a wide degree of extensibility within the OSCAL catalog model. The optional &lt;code&gt;ns&lt;/code&gt; provides a means to qualify a part's &lt;code&gt;name&lt;/code&gt;, allowing for organization-specific vocabularies to be defined with clear semantics. Any organization that extends OSCAL in this way should consistently assign a &lt;code&gt;ns&lt;/code&gt; value that represents the organization, making a given namespace qualified &lt;code&gt;name&lt;/code&gt; unique to that organization. This allows the combination of &lt;code&gt;ns&lt;/code&gt; and &lt;code&gt;name&lt;/code&gt; to always be unique and unambiguous, even when mixed with extensions from other organizations. Each organization is responsible for governance of their own extensions, and is strongly encouraged to publish their extensions as standards to their user community. If no &lt;code&gt;ns&lt;/code&gt; is provided, the name is expected to be in the "OSCAL" namespace.&lt;/p&gt;
      &lt;p&gt;To ensure a &lt;code&gt;ns&lt;/code&gt; is unique to an organization and naming conflicts are avoided, a URI containing a DNS or other globally defined organization name should be used. For example, if FedRAMP and DoD both extend OSCAL, FedRAMP will use the &lt;code&gt;ns&lt;/code&gt; "https://fedramp.gov", while DoD will use the &lt;code&gt;ns&lt;/code&gt; "https://defense.gov" for any organization specific &lt;code&gt;name&lt;/code&gt;. &lt;/p&gt;
      &lt;p&gt;Tools that process OSCAL content are not required to interpret unrecognized OSCAL extensions; however, OSCAL compliant tools should not modify or remove unrecognized extensions, unless there is a compelling reason to do so, such as data sensitivity.&lt;/p&gt;
   &lt;/remarks&gt;
   &lt;example&gt;
      &lt;description&gt;Multiple Parts with Different Organization-Specific Names&lt;/description&gt;
      &lt;part xmlns="http://csrc.nist.gov/ns/oscal/1.0"
            name="statement"
            id="statement-A"&gt;
         &lt;part ns="https://fedramp.gov" name="status" id="statement-A-FedRAMP"&gt;Something FedRAMP Cares About&lt;/part&gt;
         &lt;part ns="https://defense.gov" name="status" id="statement-A-DoD"&gt;Something DoD Cares About&lt;/part&gt;
      &lt;/part&gt;
   &lt;/example&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter" class="toc1 head">Assembly
         <code>parameter</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Parameter</p>
      <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
      <p class="use-name"><span class="lbl">use-name</span>param</p>
      <div class="remarks">
         <p class="p">In a catalog, a parameter is typically used as a placeholder for the future assignment
            of a parameter value, although the OSCAL model allows for the direct assignment of
            a value if desired by the control author. The <code>value</code> may be optionally used to specify one or more values. If no value is provided, then
            it is expected that the value will be provided at the Profile or Implementation layer.</p>
         <p class="p">A parameter can include a variety of metadata options that support the future solicitation
            of one or more values. A <code>label</code> provides a textual placeholder that can be used in a tool to solicit parameter value
            input, or to display in catalog documentation. The <code>desc</code> provides a short description of what the parameter is used for, which can be used
            in tooling to help a user understand how to use the parameter. A <code>constraint</code> can be used to provide criteria for the allowed values. A <code>guideline</code> provides a recommendation for the use of a parameter.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter/id">Flag (defined inline) <code>id</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/class">Flag (defined inline) <code>class</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/depends-on">Flag (reference) <code>depends-on</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/prop">Assembly (reference) <code>property</code> - grouped as <code>props</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/link">Assembly (reference) <code>link</code> - grouped as <code>links</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/label">Field (defined inline) <code>label</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/usage">Field (defined inline) <code>usage</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/constraint">Assembly (reference) <code>parameter-constraint</code> - using name <code>constraint</code> - grouped as <code>constraints</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/guideline">Assembly (reference) <code>parameter-guideline</code> - using name <code>guideline</code> - grouped as <code>guidelines</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/value">Field (reference) <code>parameter-value</code> - using name <code>value</code> - grouped as <code>values</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/select">Assembly (reference) <code>parameter-selection</code> - using name <code>select</code></li>
         <li id="/assembly/oscal-catalog-common/parameter/remarks">Field (reference) <code>remarks</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter"
                 scope="global"
                 name="parameter"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter"&gt;
   &lt;formal-name&gt;Parameter&lt;/formal-name&gt;
   &lt;description&gt;Parameters provide a mechanism for the dynamic assignment of value(s) in a control.&lt;/description&gt;
   &lt;use-name&gt;param&lt;/use-name&gt;
   &lt;define-flag _step="id"
                _key="id"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/id"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/id"
                required="yes"
                as-type="NCName"
                name="id"
                _using-name="id"
                _in-xml-name="id"
                _in-json-name="id"&gt;
      &lt;formal-name&gt;Parameter Identifier&lt;/formal-name&gt;
      &lt;description&gt;A unique identifier for a specific parameter instance. This identifier's uniqueness is document scoped and is intended to be consistent for the same parameter across minor revisions of the document.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;define-flag _step="class"
                _key="class"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/class"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/class"
                required="no"
                as-type="NCName"
                name="class"
                _using-name="class"
                _in-xml-name="class"
                _in-json-name="class"&gt;
      &lt;formal-name&gt;Parameter Class&lt;/formal-name&gt;
      &lt;description&gt;A textual label that provides a characterization of the parameter.&lt;/description&gt;
      &lt;remarks&gt;
         &lt;p&gt;A &lt;code&gt;class&lt;/code&gt; can be used in validation rules to express extra constraints over named items of a specific &lt;code&gt;class&lt;/code&gt; value.&lt;/p&gt;
      &lt;/remarks&gt;
   &lt;/define-flag&gt;
   &lt;flag _step="depends-on"
         _key="depends-on"
         _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/depends-on"
         _metaschema-json-id="/assembly/oscal-catalog-common/parameter/depends-on"
         as-type="NCName"
         required="no"
         ref="depends-on"
         _key-ref="oscal-catalog-common:depends-on"
         _using-name="depends-on"
         _in-xml-name="depends-on"
         _in-json-name="depends-on"/&gt;
   &lt;model&gt;
      &lt;assembly _step="prop"
                _key="props"
                _group-name="props"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/prop"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/props"
                max-occurs="unbounded"
                min-occurs="0"
                ref="property"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"&gt;
         &lt;group-as name="props" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="link"
                _key="links"
                _group-name="links"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/link"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/links"
                max-occurs="unbounded"
                min-occurs="0"
                ref="link"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"&gt;
         &lt;group-as name="links" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;define-field _step="label"
                    _key="label"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/label"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter/label"
                    max-occurs="1"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="label"
                    _using-name="label"
                    _in-xml-name="label"
                    _in-json-name="label"&gt;
         &lt;formal-name&gt;Parameter Label&lt;/formal-name&gt;
         &lt;description&gt;A short, placeholder name for the parameter, which can be used as a substitute for a &lt;code&gt;value&lt;/code&gt; if no value is assigned.&lt;/description&gt;
         &lt;remarks&gt;
            &lt;p&gt;The label value should be suitable for inline display in a rendered catalog.&lt;/p&gt;
         &lt;/remarks&gt;
      &lt;/define-field&gt;
      &lt;define-field _step="usage"
                    _key="usage"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/usage"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter/usage"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="usage"
                    _using-name="usage"
                    _in-xml-name="usage"
                    _in-json-name="usage"&gt;
         &lt;formal-name&gt;Parameter Usage Description&lt;/formal-name&gt;
         &lt;description&gt;Describes the purpose and use of a parameter&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;assembly _step="constraint"
                _key="constraints"
                _group-name="constraints"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/constraint"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/constraints"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter-constraint"
                _key-ref="oscal-catalog-common:parameter-constraint"
                _using-name="constraint"
                _in-xml-name="constraint"
                _in-json-name="constraints"&gt;
         &lt;use-name&gt;constraint&lt;/use-name&gt;
         &lt;group-as name="constraints" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;assembly _step="guideline"
                _key="guidelines"
                _group-name="guidelines"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/guideline"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/guidelines"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter-guideline"
                _key-ref="oscal-catalog-common:parameter-guideline"
                _using-name="guideline"
                _in-xml-name="guideline"
                _in-json-name="guidelines"&gt;
         &lt;use-name&gt;guideline&lt;/use-name&gt;
         &lt;group-as name="guidelines" in-json="ARRAY"/&gt;
      &lt;/assembly&gt;
      &lt;choice&gt;
         &lt;field _step="value"
                _key="values"
                _group-name="values"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/value"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter/values"
                max-occurs="unbounded"
                min-occurs="0"
                ref="parameter-value"
                _key-ref="oscal-catalog-common:parameter-value"
                _using-name="value"
                _in-xml-name="value"
                _in-json-name="values"&gt;
            &lt;use-name&gt;value&lt;/use-name&gt;
            &lt;group-as name="values" in-json="ARRAY"/&gt;
            &lt;remarks&gt;
               &lt;p&gt;A set of values provided in a catalog can be redefined at any higher layer of OSCAL (e.g., Profile).&lt;/p&gt;
            &lt;/remarks&gt;
         &lt;/field&gt;
         &lt;assembly _step="select"
                   _key="select"
                   _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/select"
                   _metaschema-json-id="/assembly/oscal-catalog-common/parameter/select"
                   max-occurs="1"
                   min-occurs="0"
                   ref="parameter-selection"
                   _key-ref="oscal-catalog-common:parameter-selection"
                   _using-name="select"
                   _in-xml-name="select"
                   _in-json-name="select"&gt;
            &lt;use-name&gt;select&lt;/use-name&gt;
            &lt;remarks&gt;
               &lt;p&gt;A set of parameter value choices, that may be picked from to set the parameter value.&lt;/p&gt;
            &lt;/remarks&gt;
         &lt;/assembly&gt;
      &lt;/choice&gt;
      &lt;field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-catalog-common/parameter/remarks"
             _metaschema-json-id="/assembly/oscal-catalog-common/parameter/remarks"
             max-occurs="1"
             min-occurs="0"
             ref="remarks"
             _key-ref="oscal-metadata:remarks"
             in-xml="WITH_WRAPPER"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"/&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;In a catalog, a parameter is typically used as a placeholder for the future assignment of a parameter value, although the OSCAL model allows for the direct assignment of a value if desired by the control author. The &lt;code&gt;value&lt;/code&gt; may be optionally used to specify one or more values. If no value is provided, then it is expected that the value will be provided at the Profile or Implementation layer.&lt;/p&gt;
      &lt;p&gt;A parameter can include a variety of metadata options that support the future solicitation of one or more values. A &lt;code&gt;label&lt;/code&gt; provides a textual placeholder that can be used in a tool to solicit parameter value input, or to display in catalog documentation. The &lt;code&gt;desc&lt;/code&gt; provides a short description of what the parameter is used for, which can be used in tooling to help a user understand how to use the parameter. A &lt;code&gt;constraint&lt;/code&gt; can be used to provide criteria for the allowed values. A &lt;code&gt;guideline&lt;/code&gt; provides a recommendation for the use of a parameter.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter-constraint" class="toc1 head">Assembly
         <code>parameter-constraint</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Constraint</p>
      <p class="description">A formal or informal expression of a constraint or test</p>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter-constraint/description">Field (defined inline) <code>description</code></li>
         <li id="/assembly/oscal-catalog-common/parameter-constraint/test">Assembly (defined inline) <code>test</code> - grouped as <code>tests</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint"
                 scope="global"
                 name="parameter-constraint"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter-constraint"&gt;
   &lt;formal-name&gt;Constraint&lt;/formal-name&gt;
   &lt;description&gt;A formal or informal expression of a constraint or test&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="description"
                    _key="description"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/description"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/description"
                    max-occurs="1"
                    min-occurs="0"
                    in-xml="WITH_WRAPPER"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="description"
                    _using-name="description"
                    _in-xml-name="description"
                    _in-json-name="description"&gt;
         &lt;formal-name&gt;Constraint Description&lt;/formal-name&gt;
         &lt;description&gt;A textual summary of the constraint to be applied.&lt;/description&gt;
      &lt;/define-field&gt;
      &lt;define-assembly _step="test"
                       _key="tests"
                       _group-name="tests"
                       _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/test"
                       _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/tests"
                       max-occurs="unbounded"
                       min-occurs="0"
                       name="test"
                       _using-name="test"
                       _in-xml-name="test"
                       _in-json-name="tests"&gt;
         &lt;formal-name&gt;Constraint Test&lt;/formal-name&gt;
         &lt;description&gt;A test expression which is expected to be evaluated by a tool.&lt;/description&gt;
         &lt;group-as name="tests" in-json="ARRAY"/&gt;
         &lt;model&gt;
            &lt;define-field _step="expression"
                          _key="expression"
                          _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/test/expression"
                          _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/tests/expression"
                          max-occurs="1"
                          min-occurs="1"
                          collapsible="no"
                          as-type="string"
                          name="expression"
                          _using-name="expression"
                          _in-xml-name="expression"
                          _in-json-name="expression"&gt;
               &lt;formal-name&gt;Constraint test&lt;/formal-name&gt;
               &lt;description&gt;A formal (executable) expression of a constraint&lt;/description&gt;
            &lt;/define-field&gt;
            &lt;field _step="remarks"
                   _key="remarks"
                   _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-constraint/test/remarks"
                   _metaschema-json-id="/assembly/oscal-catalog-common/parameter-constraint/tests/remarks"
                   max-occurs="1"
                   min-occurs="0"
                   ref="remarks"
                   _key-ref="oscal-metadata:remarks"
                   in-xml="WITH_WRAPPER"
                   _using-name="remarks"
                   _in-xml-name="remarks"
                   _in-json-name="remarks"/&gt;
         &lt;/model&gt;
      &lt;/define-assembly&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter-guideline" class="toc1 head">Assembly
         <code>parameter-guideline</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Guideline</p>
      <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter-guideline/p ul ol pre table h1 h2 h3 h4 h5 h6">Field (defined inline) <code>prose</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline"
                 scope="global"
                 name="parameter-guideline"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter-guideline"&gt;
   &lt;formal-name&gt;Guideline&lt;/formal-name&gt;
   &lt;description&gt;A prose statement that provides a recommendation for the use of a parameter.&lt;/description&gt;
   &lt;model&gt;
      &lt;define-field _step="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _key="prose"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
                    max-occurs="1"
                    min-occurs="1"
                    in-xml="UNWRAPPED"
                    collapsible="no"
                    as-type="markup-multiline"
                    name="prose"
                    _using-name="prose"
                    _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
                    _in-json-name="prose"&gt;
         &lt;formal-name&gt;Guideline Text&lt;/formal-name&gt;
         &lt;description&gt;Prose permits multiple paragraphs, lists, tables etc.&lt;/description&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-field" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/field/oscal-catalog-common/parameter-value" class="toc1 head">Field <code>parameter-value</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Parameter Value</p>
      <p class="description">A parameter value or set of values.</p>
      <ul class="model"></ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-field xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              _metaschema-xml-id="/field/oscal-catalog-common/parameter-value"
              _metaschema-json-id="/field/oscal-catalog-common/parameter-value"
              collapsible="no"
              as-type="string"
              scope="global"
              name="parameter-value"
              module="oscal-catalog-common"
              _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
              _key-name="oscal-catalog-common:parameter-value"&gt;
   &lt;formal-name&gt;Parameter Value&lt;/formal-name&gt;
   &lt;description&gt;A parameter value or set of values.&lt;/description&gt;
&lt;/define-field&gt;
</pre>
      </details>
   </section>
   <section class="definition define-assembly" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/assembly/oscal-catalog-common/parameter-selection" class="toc1 head">Assembly
         <code>parameter-selection</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Selection</p>
      <p class="description">Presenting a choice among alternatives</p>
      <div class="remarks">
         <p class="p">A set of parameter value choices, that may be picked from to set the parameter value.</p>
      </div>
      <ul class="model">
         <li id="/assembly/oscal-catalog-common/parameter-selection/how-many">Flag (defined inline) <code>how-many</code></li>
         <li id="/assembly/oscal-catalog-common/parameter-selection/choice">Field (defined inline) <code>parameter-choice</code> - using name <code>choice</code> - grouped as <code>choice</code></li>
      </ul>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-assembly xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-selection"
                 _metaschema-json-id="/assembly/oscal-catalog-common/parameter-selection"
                 scope="global"
                 name="parameter-selection"
                 module="oscal-catalog-common"
                 _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
                 _key-name="oscal-catalog-common:parameter-selection"&gt;
   &lt;formal-name&gt;Selection&lt;/formal-name&gt;
   &lt;description&gt;Presenting a choice among alternatives&lt;/description&gt;
   &lt;define-flag _step="how-many"
                _key="how-many"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-selection/how-many"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter-selection/how-many"
                required="no"
                as-type="string"
                name="how-many"
                _using-name="how-many"
                _in-xml-name="how-many"
                _in-json-name="how-many"&gt;
      &lt;formal-name&gt;Parameter Cardinality&lt;/formal-name&gt;
      &lt;description&gt;Describes the number of selections that must occur.&lt;/description&gt;
   &lt;/define-flag&gt;
   &lt;model&gt;
      &lt;define-field _step="choice"
                    _key="choice"
                    _group-name="choice"
                    _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-selection/choice"
                    _metaschema-json-id="/assembly/oscal-catalog-common/parameter-selection/choice"
                    max-occurs="unbounded"
                    min-occurs="0"
                    collapsible="no"
                    as-type="markup-line"
                    name="parameter-choice"
                    _using-name="choice"
                    _in-xml-name="choice"
                    _in-json-name="choice"&gt;
         &lt;formal-name&gt;Choice&lt;/formal-name&gt;
         &lt;description&gt;A value selection among several such options&lt;/description&gt;
         &lt;use-name&gt;choice&lt;/use-name&gt;
         &lt;json-value-key&gt;value&lt;/json-value-key&gt;
         &lt;group-as name="choice" in-json="ARRAY"/&gt;
      &lt;/define-field&gt;
   &lt;/model&gt;
   &lt;remarks&gt;
      &lt;p&gt;A set of parameter value choices, that may be picked from to set the parameter value.&lt;/p&gt;
   &lt;/remarks&gt;
&lt;/define-assembly&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-catalog-common/depends-on" class="toc1 head">Flag <code>depends-on</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Depends on</p>
      <p class="description">Another parameter invoking this one</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-catalog-common/depends-on"
             _metaschema-json-id="/flag/oscal-catalog-common/depends-on"
             as-type="NCName"
             scope="global"
             name="depends-on"
             module="oscal-catalog-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
             _key-name="oscal-catalog-common:depends-on"&gt;
   &lt;formal-name&gt;Depends on&lt;/formal-name&gt;
   &lt;description&gt;Another parameter invoking this one&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
   <section class="definition define-flag" style="margin: 0em; margin-top: 1em; padding: 0.5em; border: thin solid black">
      <h1 id="/flag/oscal-catalog-common/control-id" class="toc1 head">Flag <code>control-id</code></h1>
      <p class="formal-name" style="font-family: sans-serif; font-weight: bold">Control Identifier Reference</p>
      <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
      <details>
         <summary>Metaschema source</summary>
         <pre>
&lt;define-flag xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             _metaschema-xml-id="/flag/oscal-catalog-common/control-id"
             _metaschema-json-id="/flag/oscal-catalog-common/control-id"
             as-type="NCName"
             scope="global"
             name="control-id"
             module="oscal-catalog-common"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/OSCAL/src/metaschema/oscal_control-common_metaschema.xml"
             _key-name="oscal-catalog-common:control-id"&gt;
   &lt;formal-name&gt;Control Identifier Reference&lt;/formal-name&gt;
   &lt;description&gt;A reference to a control with a corresponding &lt;code&gt;id&lt;/code&gt; value.&lt;/description&gt;
&lt;/define-flag&gt;
</pre>
      </details>
   </section>
</div>