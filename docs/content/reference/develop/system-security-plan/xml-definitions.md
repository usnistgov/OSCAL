---
title: "OSCAL System Security Plan Model Development Snapshot XML Format Metaschema Reference"
heading: "System Security Plan Model Development Snapshot XML Metaschema Reference"
weight: 80
generateanchors: false
sidenav:
  title: XML Metaschema Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
---

The following is a reference for the XML element and attribute types derived from the [metaschema](https://github.com/usnistgov/OSCAL/blob/develop//src/metaschema/oscal_ssp_metaschema.xml) for this [model](/concepts/layer/implementation/ssp/).

<!-- DO NOT REMOVE. Generated text below -->{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-definition">
   <p><span class="usa-tag">Short name</span> oscal-ssp</p>
   <p><span class="usa-tag">XML namespace</span> <code>http://csrc.nist.gov/ns/oscal/1.0</code></p>
   <details class="remarks" open="open">
      <summary>Remarks</summary>
      <p class="p">The OSCAL Control SSP format can be used to describe the information typically specified
         in a system security plan, such as those defined in NIST SP 800-18.</p>
      <p class="p">The root of the OSCAL System Security Plan (SSP) format is <code>system-security-plan</code>.</p>
   </details>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/action" class="toc1 name">action</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action">Switch to JSON</a></div>
         <p class="formal-name">Action</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> An action applied by a role within a given party to the content.</p>
         <details>
            <summary>Constraints (4)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">responsible-party</code>this value must correspond to a listing in the index <code>index-metadata-role-id</code> using a key constructed of key field(s) <code>@role-id</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">responsible-party</code>this value must correspond to a listing in the index <code>index-metadata-party-uuid</code> using a key constructed of key field(s) <code>party-uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">./system/@value</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>http://csrc.nist.gov/ns/oscal</strong>: This value identifies action types defined in the NIST OSCAL namespace.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">./type[has-oscal-namespace('http://csrc.nist.gov/ns/oscal')]/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>approval</strong>: An approval of a document instance's content.</li>
                  
                  <li><strong>request-changes</strong>: A request from the responisble party or parties to change the content.</li>
                  </ul>
            </div>
            </details>
         <details open="open">
            <summary>Attributes (4):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Action Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A unique identifier that can be used to reference this defined action elsewhere in
                        an OSCAL document. A UUID should be consistently used for a given location across
                        revisions of the document.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/date" class="toc2 name">date</h2>
                     <p class="type"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/date">Switch to JSON</a></div>
                     <p class="formal-name">Action Occurrence Date</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The date and time when the action occurred.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/type" class="toc2 name">type</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/type">Switch to JSON</a></div>
                     <p class="formal-name">Action Type</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The type of action documented by the assembly, such as an approval.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/system" class="toc2 name">system</h2>
                     <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/system">Switch to JSON</a></div>
                     <p class="formal-name">Action Type System</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Specifies the action type system used.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>type</code>, so that different organizations and individuals can assert control over the allowed
                                 <code>action</code>'s <code>type</code>. This allows the semantics associated with a given <code>type</code> to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (4):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/responsible-party" class="toc2 name">responsible-party</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/responsible-parties">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Party</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-party</code> requires one or more <code>party-uuid</code> references creating a strong relationship arc between the referenced <code>role-id</code> and the reference parties. This differs in semantics from <code>responsible-role</code> which doesn't require that a <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-party">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/action/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/action/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/addr-line" class="toc1 name">addr-line</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/addr-line">Switch to JSON</a></div>
         <p class="formal-name">Address line</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A single line of an address.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/address" class="toc1 name">address</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/address">Switch to JSON</a></div>
         <p class="formal-name">Address</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A postal address for the location.</p>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/address/type" class="toc2 name">type</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/address/type">Switch to JSON</a></div>
                     <p class="formal-name">Address Type</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">type</code></p>
                     <p class="definition-link"><a href="#/flag/oscal-metadata/location-type">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/address/addr-line" class="toc2 name">addr-line</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/address/addr-lines">Switch to JSON</a></div>
                     <p class="formal-name">Address line</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-metadata/addr-line">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/address/city" class="toc2 name">city</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/address/city">Switch to JSON</a></div>
                     <p class="formal-name">City</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> City, town or geographical region for the mailing address.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/address/state" class="toc2 name">state</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/address/state">Switch to JSON</a></div>
                     <p class="formal-name">State</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> State, province or analogous geographical region for a mailing address.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/address/postal-code" class="toc2 name">postal-code</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/address/postal-code">Switch to JSON</a></div>
                     <p class="formal-name">Postal Code</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Postal or ZIP code for mailing address.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/address/country" class="toc2 name">country</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/address/country">Switch to JSON</a></div>
                     <p class="formal-name">Country Code</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">matches</span>: a target (value) must match the regular expression '[A-Z]{2}'.</p>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-ssp/adjustment-justification" class="toc1 name">adjustment-justification</h1>
         <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-ssp/adjustment-justification">Switch to JSON</a></div>
         <p class="formal-name">Adjustment Justification</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> If the selected security level is different from the base security level, this contains
            the justification for the change.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/authorization-boundary" class="toc1 name">authorization-boundary</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/authorization-boundary">Switch to JSON</a></div>
         <p class="formal-name">Authorization Boundary</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A description of this system's authorization boundary, optionally supplemented by
            diagrams that illustrate the authorization boundary.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">diagram</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/authorization-boundary/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/authorization-boundary/description">Switch to JSON</a></div>
                     <p class="formal-name">Authorization Boundary Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the system's authorization boundary.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/authorization-boundary/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/authorization-boundary/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/authorization-boundary/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/authorization-boundary/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/authorization-boundary/diagram" class="toc2 name">diagram</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/authorization-boundary/diagrams">Switch to JSON</a></div>
                     <p class="formal-name">Diagram</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A diagram must include a <code>link</code> with a rel value of "diagram", who's href references a remote URI or an internal
                                 reference within this document containing the diagram.</p>
                           </div>
                           <div class="remarks">
                              <p>A visual depiction of the system's authorization boundary.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/diagram">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/authorization-boundary/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/authorization-boundary/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/authorized-privilege" class="toc1 name">authorized-privilege</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/authorized-privilege">Switch to JSON</a></div>
         <p class="formal-name">Privilege</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Identifies a specific system privilege held by the user, along with an associated
            description and/or rationale for the privilege.</p>
         <details open="open">
            <summary>Elements (3):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/authorized-privilege/title" class="toc2 name">title</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/authorized-privilege/title">Switch to JSON</a></div>
                     <p class="formal-name">Privilege Title</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A human readable name for the privilege.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/authorized-privilege/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/authorized-privilege/description">Switch to JSON</a></div>
                     <p class="formal-name">Privilege Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the privilege's purpose within the system.</p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/authorized-privilege/function-performed" class="toc2 name">function-performed</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/authorized-privilege/functions-performed">Switch to JSON</a></div>
                     <p class="formal-name">Functions Performed</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-implementation-common/function-performed">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/back-matter" class="toc1 name">back-matter</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter">Switch to JSON</a></div>
         <p class="formal-name">Back matter</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A collection of resources that may be referenced from within the OSCAL document instance.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Provides a collection of identified <code>resource</code> objects that can be referenced by a <code>link</code> with a <code>rel</code> value of "reference" and an <code>href</code> value that is a fragment "#" followed by a reference to a reference's <code>uuid</code>. Other specialized link "rel" values also use this pattern when indicated in that
                     context of use.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">resource</code> an index <code>index-back-matter-resource</code> shall list values returned by targets <code>resource</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            </details>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/back-matter/resource" class="toc2 name">resource</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources">Switch to JSON</a></div>
                     <p class="formal-name">Resource</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A resource associated with content in the containing document instance. A resource
                        may be directly included in the document using base64 encoding or may point to one
                        or more equivalent internet resources.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                                 resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                                 for the same resource.</p>
                              <p>Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                                 the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                                 This allows the document consumer to choose a preferred item to process based on a
                                 the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                                 in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                                 from any of the available formats indicated by the items.</p>
                              <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                           </div>
                        </details>
                     </div>
                     <details>
                        <summary>Constraints (6)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span> for <code class="path">prop/@name</code></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>type</strong>: Identifies the type of resource represented. The most specific appropriate type
                                 value SHOULD be used.</li>
                              
                              <li><strong>version</strong>: For resources representing a published document, this represents the version number
                                 of that document.</li>
                              
                              <li><strong>published</strong>: For resources representing a published document, this represents the publication
                                 date of that document.</li>
                              </ul>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">matches</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal') and @name='published']/@value</code>: the target value must match the lexical form of the 'dateTime-with-timezone' data
                              type.</p>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal') and @name='type']/@value</code></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              
                              <li><strong>logo</strong>: Indicates the resource is an organization's logo.</li>
                              
                              <li><strong>image</strong>: Indicates the resource represents an image.</li>
                              
                              <li><strong>screen-shot</strong>: Indicates the resource represents an image of screen content. </li>
                              
                              <li><strong>law</strong>: Indicates the resource represents an applicable law.</li>
                              
                              <li><strong>regulation</strong>: Indicates the resource represents an applicable regulation.</li>
                              
                              <li><strong>standard</strong>: Indicates the resource represents an applicable standard.</li>
                              
                              <li><strong>external-guidance</strong>: Indicates the resource represents applicable guidance.</li>
                              
                              <li><strong>acronyms</strong>: Indicates the resource provides a list of relevant acronyms.</li>
                              
                              <li><strong>citation</strong>: Indicates the resource cites relevant information.</li>
                              
                              
                              <li><strong>policy</strong>: Indicates the resource is a policy.</li>
                              
                              <li><strong>procedure</strong>: Indicates the resource is a procedure.</li>
                              
                              <li><strong>system-guide</strong>: Indicates the resource is guidance document related to the subject system of an
                                 SSP.</li>
                              
                              <li><strong>users-guide</strong>: Indicates the resource is guidance document a user's guide or administrator's guide.</li>
                              
                              <li><strong>administrators-guide</strong>: Indicates the resource is guidance document a administrator's guide.</li>
                              
                              <li><strong>rules-of-behavior</strong>: Indicates the resource represents rules of behavior content.</li>
                              
                              <li><strong>plan</strong>: Indicates the resource represents a plan.</li>
                              
                              
                              <li><strong>artifact</strong>: Indicates the resource represents an artifact, such as may be reviewed by an assessor.</li>
                              
                              <li><strong>evidence</strong>: Indicates the resource represents evidence, such as to support an assessment finding.</li>
                              
                              <li><strong>tool-output</strong>: Indicates the resource represents output from a tool.</li>
                              
                              <li><strong>raw-data</strong>: Indicates the resource represents machine data, which may require a tool or analysis
                                 for interpretation or presentation.</li>
                              
                              <li><strong>interview-notes</strong>: Indicates the resource represents notes from an interview, such as may be collected
                                 during an assessment.</li>
                              
                              <li><strong>questionnaire</strong>: Indicates the resource is a set of questions, possibly with responses.</li>
                              
                              <li><strong>report</strong>: Indicates the resource is a report.</li>
                              
                              <li><strong>agreement</strong>: Indicates the resource is a formal agreement between two or more parties.</li>
                              </ul>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">has cardinality</span> for <code class="path">rlink|base64</code> the cardinality of  <code>rlink|base64</code> is constrained: <b>1</b>; maximum <b>unbounded</b>.</p>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">is unique</span> for <code class="path">rlink</code>: any target value must be unique (i.e., occur only once)</p>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">is unique</span> for <code class="path">base64</code>: any target value must be unique (i.e., occur only once)</p>
                        </div>
                        
                        A title is required when a citation is provided.
                        
                        </details>
                     <details open="open">
                        <summary>Attribute (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/uuid" class="toc3 name">uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Resource Universally Unique Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A unique identifier for a resource.</p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (8):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/title" class="toc3 name">title</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/title">Switch to JSON</a></div>
                                 <p class="formal-name">Resource Title</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> An optional name given to the resource, which may be used by a tool for display and
                                    navigation.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/description" class="toc3 name">description</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/description">Switch to JSON</a></div>
                                 <p class="formal-name">Resource Description</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> An optional short summary of the resource used to indicate the purpose of the resource.</p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/document-id" class="toc3 name">document-id</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/document-ids">Switch to JSON</a></div>
                                 <p class="formal-name">Document Identifier</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A document identifier provides a <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with a <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that is used for a group of documents that are to be treated as different versions,
                                             representations or digital surrogates of the same document.</p>
                                          <p>A document identifier provides an additional data point for identifying a document
                                             that can be assigned by a publisher or organization for purposes in a wider system,
                                             such as a digital object identifier (DOI) or a local content management system identifier.</p>
                                          <p>Use of a document identifier allows for document creators to associate sets of documents
                                             that are related in some way by the same <code>document-id</code>.</p>
                                          <p>An OSCAL document always has an implicit document identifier provided by the document's
                                             UUID, defined by the <code>uuid</code> on the top-level object. Having a default UUID-based identifier ensures all documents
                                             can be minimally identified when other document identifiers are not provided.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/document-id">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition define-assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/citation" class="toc3 name">citation</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/citation">Switch to JSON</a></div>
                                 <p class="formal-name">Citation</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> An optional citation consisting of end note text using structured markup.</p>
                                 <details open="open">
                                    <summary>Elements (3):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-field">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/citation/text" class="toc4 name">text</h4>
                                             <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                                             <p class="occurrence">[1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/citation/text">Switch to JSON</a></div>
                                             <p class="formal-name">Citation Text</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> A line of citation text.</p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/citation/prop" class="toc4 name">property</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/citation/props">Switch to JSON</a></div>
                                             <p class="formal-name">Property</p>
                                          </div>
                                          <div class="body">
                                             <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>Properties permit the deployment and management of arbitrary controlled values, within
                                                         OSCAL objects. A property can be included for any purpose useful to an application
                                                         or implementation. Typically, properties will be used to sort, filter, select, order,
                                                         and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                                         an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                                         lexical composition of properties may be constrained by external processes to ensure
                                                         consistency.</p>
                                                      <p>Property allows for associated remarks that describe why the specific property value
                                                         was applied to the containing object, or the significance of the value in the context
                                                         of the containing object.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/citation/link" class="toc4 name">link</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/citation/links">Switch to JSON</a></div>
                                             <p class="formal-name">Link</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                                         a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                                      <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                              </div>
                           </div>
                           <div class="model-entry definition define-assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/rlink" class="toc3 name">rlink</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/rlinks">Switch to JSON</a></div>
                                 <p class="formal-name">Resource link</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A URL-based pointer to an external resource with an optional hash for verification
                                    and change detection.</p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Multiple <code>rlink</code> objects can be included for a resource. In such a case, all provided <code>rlink</code> items are intended to be equivalent in content, but may differ in structure or format.</p>
                                          <p>A <code>media-type</code> is used to identify the format of a given rlink, and can be used to differentiate
                                             items in a collection of rlinks. The <code>media-type</code> provides a hint to the OSCAL document consumer about the structure of the resource
                                             referenced by the <code>rlink</code>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <details open="open">
                                    <summary>Attributes (2):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/rlink/href" class="toc4 name">href</h4>
                                             <p class="type"><a href="/reference/datatypes/#uri-reference">uri-reference</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/rlinks/href">Switch to JSON</a></div>
                                             <p class="formal-name">Hypertext Reference</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> A resolvable URL pointing to the referenced resource.</p>
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>This value may be either:</p>
                                                      <ol>
                                                         
                                                         <li>an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that points to a network resolvable resource,</li>
                                                         
                                                         <li>a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#relative-reference">relative reference</a> pointing to a network resolvable resource whose base URI is the URI of the containing
                                                            document, or</li>
                                                         </ol>
                                                   </div>
                                                </details>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="model-entry definition flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/rlink/media-type" class="toc4 name">media-type</h4>
                                             <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/rlinks/media-type">Switch to JSON</a></div>
                                             <p class="formal-name">Media Type</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p> The Internet Assigned Numbers Authority (IANA) <a href="https://www.iana.org/assignments/media-types/media-types.xhtml">Media Types Registry</a> defines a standardized set of media types, which may be used here.</p>
                                                      <p>The <code>application/oscal+xml</code>, <code>application/oscal+json</code> or <code>application/oscal+yaml</code> media types SHOULD be used when referencing OSCAL XML, JSON, or YAML resources respectively.</p>
                                                      <p>**Note: There is no official media type for YAML at this time.** OSCAL documents should
                                                         specify <code>application/yaml</code> for general YAML content, or <code>application/oscal+yaml</code> for YAML-based OSCAL content. This approach aligns with use of a structured name
                                                         suffix, per <a href="https://www.rfc-editor.org/rfc/rfc6838.html#section-4.2.8">RFC 6838 Section 4.2.8</a>.</p>
                                                      <p>Some earlier OSCAL content incorporated the model into the media type. For example:
                                                         <code>application/oscal.catalog+xml</code>. This practice SHOULD be avoided, since the OSCAL model can be detected by parsing
                                                         the initial content of the referenced resource.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/flag/oscal-metadata/media-type">See definition</a></p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                                 <details open="open">
                                    <summary>Elements (1):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition field">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/rlink/hash" class="toc4 name">hash</h4>
                                             <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/rlinks/hashes">Switch to JSON</a></div>
                                             <p class="formal-name">Hash</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> A hash of the resource identified by <code>href</code>, which can be used to verify the resource was not changed since it was hashed.</p>
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>The <code>hash</code> value can be used to confirm that the resource referenced by the <code>href</code> is the same resources that was hashed by retrieving the resource, calculating a hash,
                                                         and comparing the result to this value.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/field/oscal-metadata/hash">See definition</a></p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/base64" class="toc3 name">base64</h3>
                                 <p class="type"><a href="/reference/datatypes/#base64binary">base64Binary</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/base64">Switch to JSON</a></div>
                                 <p class="formal-name">Base64</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A resource encoded using the Base64 alphabet defined by <a href="https://www.rfc-editor.org/rfc/rfc2045.html">RFC 2045</a>.</p>
                                 <details open="open">
                                    <summary>Attributes (2):</summary>
                                    <div class="model field-model">
                                       <div class="model-entry definition define-flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/base64/filename" class="toc4 name">filename</h4>
                                             <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/base64/filename">Switch to JSON</a></div>
                                             <p class="formal-name">File Name</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> Name of the file before it was encoded as Base64 to be embedded in a <code>resource</code>. This is the name that will be assigned to the file when the file is decoded.</p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/back-matter/resource/base64/media-type" class="toc4 name">media-type</h4>
                                             <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/base64/media-type">Switch to JSON</a></div>
                                             <p class="formal-name">Media Type</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p> The Internet Assigned Numbers Authority (IANA) <a href="https://www.iana.org/assignments/media-types/media-types.xhtml">Media Types Registry</a> defines a standardized set of media types, which may be used here.</p>
                                                      <p>The <code>application/oscal+xml</code>, <code>application/oscal+json</code> or <code>application/oscal+yaml</code> media types SHOULD be used when referencing OSCAL XML, JSON, or YAML resources respectively.</p>
                                                      <p>**Note: There is no official media type for YAML at this time.** OSCAL documents should
                                                         specify <code>application/yaml</code> for general YAML content, or <code>application/oscal+yaml</code> for YAML-based OSCAL content. This approach aligns with use of a structured name
                                                         suffix, per <a href="https://www.rfc-editor.org/rfc/rfc6838.html#section-4.2.8">RFC 6838 Section 4.2.8</a>.</p>
                                                      <p>Some earlier OSCAL content incorporated the model into the media type. For example:
                                                         <code>application/oscal.catalog+xml</code>. This practice SHOULD be avoided, since the OSCAL model can be detected by parsing
                                                         the initial content of the referenced resource.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/flag/oscal-metadata/media-type">See definition</a></p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/back-matter/resource/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/back-matter/resources/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-ssp/base" class="toc1 name">base</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-ssp/base">Switch to JSON</a></div>
         <p class="formal-name">Base Level (Confidentiality, Integrity, or Availability)</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The prescribed base (Confidentiality, Integrity, or Availability) security impact
            level.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/by-component" class="toc1 name">by-component</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component">Switch to JSON</a></div>
         <p class="formal-name">Component Control Implementation</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Defines how the referenced component implements a set of controls.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Use of <code>set-parameter</code> in this context, sets the parameter for the control referenced in the containing
                     <code>implemented-requirement</code> applied to the referenced component. If the <code>by-component</code> is used as a child of a <code>statement</code>, then the parameter value also applies only in the context of the referenced statement.
                     If the same parameter is also set in the <code>control-implementation</code> or a specific <code>implemented-requirement</code>, then this <code>by-component/set-parameter</code> value will override the other value(s) in the context of the referenced component,
                     control, and statement (if parent).</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (5)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">link/@rel</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  
                  <li><strong>imported-from</strong>: The hyperlink identifies a URI pointing to the component in a component-definition
                     that originally described the component this component was based on.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">.//responsible-role/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>asset-owner</strong>: Accountable for ensuring the asset is managed in accordance with organizational
                     policies and procedures.</li>
                  
                  <li><strong>asset-administrator</strong>: Responsible for administering a set of assets.</li>
                  
                  
                  <li><strong>security-operations</strong>: Members of the security operations center (SOC).</li>
                  
                  
                  <li><strong>network-operations</strong>: Members of the network operations center (NOC).</li>
                  
                  <li><strong>incident-response</strong>: Responsible for responding to an event that could lead to loss of, or disruption
                     to, an organization's operations, services or functions.</li>
                  
                  <li><strong>help-desk</strong>: Responsible for providing information and support to users.</li>
                  
                  
                  <li><strong>configuration-management</strong>: Responsible for the configuration management processes governing changes to the
                     asset.</li>
                  
                  
                  <li><strong>maintainer</strong>: Responsible for the creation and maintenance of a component.</li>
                  
                  <li><strong>provider</strong>: Organization responsible for providing the component, if this is different from
                     the "maintainer" (e.g., a reseller).</li>
                  
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">set-parameter</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">link/@rel</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>provided-by</strong>: A reference to the UUID of a control or statement by-component object that is used
                     as evidence of implementation.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">link[@rel='provided-by']</code>this value must correspond to a listing in the index <code>by-component-uuid</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            </details>
         <details open="open">
            <summary>Attributes (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/component-uuid" class="toc2 name">component-uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/component-uuid">Switch to JSON</a></div>
                     <p class="formal-name">Component Universally Unique Identifier Reference</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a> identifier reference to the <code>component</code> that is implemeting a given control.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/uuid">Switch to JSON</a></div>
                     <p class="formal-name">By-Component Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this by-component entry elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>by-component</code> entry can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (10):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/description">Switch to JSON</a></div>
                     <p class="formal-name">Control Implementation Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> An implementation statement that describes how a control or a control statement is
                        implemented within the referenced system component.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/set-parameter" class="toc2 name">set-parameter</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/set-parameters">Switch to JSON</a></div>
                     <p class="formal-name">Set Parameter Value</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/set-parameter">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/implementation-status" class="toc2 name">implementation-status</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/implementation-status">Switch to JSON</a></div>
                     <p class="formal-name">Implementation Status</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>implementation-status</code> is used to qualify the <code>status</code> value to indicate the degree to which the control is implemented.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/implementation-status">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/export" class="toc2 name">export</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export">Switch to JSON</a></div>
                     <p class="formal-name">Export</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Identifies content intended for external consumption, such as with leveraged organizations.</p>
                     <details>
                        <summary>Constraints (2)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">has cardinality</span> for <code class="path">provided|responsibility</code> the cardinality of  <code>provided|responsibility</code> is constrained: <b>1</b>; maximum <b>unbounded</b>.</p>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">index has key</span> for <code class="path">responsibility</code>this value must correspond to a listing in the index <code>by-component-export-provided-uuid</code> using a key constructed of key field(s) <code>@provided-uuid</code></p>
                        </div>
                        </details>
                     <details open="open">
                        <summary>Elements (6):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/export/description" class="toc3 name">description</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/description">Switch to JSON</a></div>
                                 <p class="formal-name">Control Implementation Export Description</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> An implementation statement that describes the aspects of the control or control
                                    statement implementation that can be available to another system leveraging this system.</p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/export/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/export/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition define-assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/export/provided" class="toc3 name">provided</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/provided">Switch to JSON</a></div>
                                 <p class="formal-name">Provided Control Implementation</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> Describes a capability which may be inherited by a leveraging system.</p>
                                 <details>
                                    <summary>Constraint (1)</summary>
                                    
                                    <div class="constraint">
                                       <p><span class="usa-tag">is unique</span> for <code class="path">responsible-role</code>: any target value must be unique (i.e., occur only once)</p>
                                    </div>
                                    </details>
                                 <details open="open">
                                    <summary>Attribute (1):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/provided/uuid" class="toc4 name">uuid</h4>
                                             <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/provided/uuid">Switch to JSON</a></div>
                                             <p class="formal-name">Provided Universally Unique Identifier</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this provided entry elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>provided</code> entry can be used to reference the data item locally or globally (e.g., in an imported
                                                OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                                                of the document.</p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                                 <details open="open">
                                    <summary>Elements (5):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-field">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/provided/description" class="toc4 name">description</h4>
                                             <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                             <p class="occurrence">[1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/provided/description">Switch to JSON</a></div>
                                             <p class="formal-name">Provided Control Implementation Description</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> An implementation statement that describes the aspects of the control or control
                                                statement implementation that can be provided to another system leveraging this system.</p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/provided/prop" class="toc4 name">property</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/provided/props">Switch to JSON</a></div>
                                             <p class="formal-name">Property</p>
                                          </div>
                                          <div class="body">
                                             <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>Properties permit the deployment and management of arbitrary controlled values, within
                                                         OSCAL objects. A property can be included for any purpose useful to an application
                                                         or implementation. Typically, properties will be used to sort, filter, select, order,
                                                         and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                                         an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                                         lexical composition of properties may be constrained by external processes to ensure
                                                         consistency.</p>
                                                      <p>Property allows for associated remarks that describe why the specific property value
                                                         was applied to the containing object, or the significance of the value in the context
                                                         of the containing object.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/provided/link" class="toc4 name">link</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/provided/links">Switch to JSON</a></div>
                                             <p class="formal-name">Link</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                                         a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                                      <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/provided/responsible-role" class="toc4 name">responsible-role</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/provided/responsible-roles">Switch to JSON</a></div>
                                             <p class="formal-name">Responsible Role</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                                                      <p>The scope of use of this object determines if the responsibility has been performed
                                                         or will be performed in the future. The containing object will describe the intent.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition field">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/provided/remarks" class="toc4 name">remarks</h4>
                                             <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/provided/remarks">Switch to JSON</a></div>
                                             <p class="formal-name">Remarks</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                                         by OSCAL.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                              </div>
                           </div>
                           <div class="model-entry definition define-assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/export/responsibility" class="toc3 name">responsibility</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities">Switch to JSON</a></div>
                                 <p class="formal-name">Control Implementation Responsibility</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> Describes a control implementation responsibility imposed on a leveraging system.</p>
                                 <details>
                                    <summary>Constraint (1)</summary>
                                    
                                    <div class="constraint">
                                       <p><span class="usa-tag">is unique</span> for <code class="path">responsible-role</code>: any target value must be unique (i.e., occur only once)</p>
                                    </div>
                                    </details>
                                 <details open="open">
                                    <summary>Attributes (2):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/responsibility/uuid" class="toc4 name">uuid</h4>
                                             <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities/uuid">Switch to JSON</a></div>
                                             <p class="formal-name">Responsibility Universally Unique Identifier</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this responsibility elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>responsibility</code> can be used to reference the data item locally or globally (e.g., in an imported
                                                OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                                                of the document.</p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/responsibility/provided-uuid" class="toc4 name">provided-uuid</h4>
                                             <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities/provided-uuid">Switch to JSON</a></div>
                                             <p class="formal-name">Provided UUID</p>
                                          </div>
                                          <div class="body">
                                             <p class="definition-link"><a href="#/flag/oscal-ssp/provided-uuid">See definition</a></p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                                 <details open="open">
                                    <summary>Elements (5):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-field">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/responsibility/description" class="toc4 name">description</h4>
                                             <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                             <p class="occurrence">[1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities/description">Switch to JSON</a></div>
                                             <p class="formal-name">Control Implementation Responsibility Description</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> An implementation statement that describes the aspects of the control or control
                                                statement implementation that a leveraging system must implement to satisfy the control
                                                provided by a leveraged system.</p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/responsibility/prop" class="toc4 name">property</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities/props">Switch to JSON</a></div>
                                             <p class="formal-name">Property</p>
                                          </div>
                                          <div class="body">
                                             <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>Properties permit the deployment and management of arbitrary controlled values, within
                                                         OSCAL objects. A property can be included for any purpose useful to an application
                                                         or implementation. Typically, properties will be used to sort, filter, select, order,
                                                         and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                                         an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                                         lexical composition of properties may be constrained by external processes to ensure
                                                         consistency.</p>
                                                      <p>Property allows for associated remarks that describe why the specific property value
                                                         was applied to the containing object, or the significance of the value in the context
                                                         of the containing object.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/responsibility/link" class="toc4 name">link</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities/links">Switch to JSON</a></div>
                                             <p class="formal-name">Link</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                                         a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                                      <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition assembly">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/responsibility/responsible-role" class="toc4 name">responsible-role</h4>
                                             <p class="type">assembly<br class="br" /> </p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities/responsible-roles">Switch to JSON</a></div>
                                             <p class="formal-name">Responsible Role</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                                                      <p>The scope of use of this object determines if the responsibility has been performed
                                                         or will be performed in the future. The containing object will describe the intent.</p>
                                                   </div>
                                                   <div class="remarks">
                                                      <p>A role defined at the by-component level takes precedence over the same role defined
                                                         on the parent implemented-requirement or on the referenced component. </p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                                          </div>
                                       </div>
                                       <div class="model-entry definition field">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/by-component/export/responsibility/remarks" class="toc4 name">remarks</h4>
                                             <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/responsibilities/remarks">Switch to JSON</a></div>
                                             <p class="formal-name">Remarks</p>
                                          </div>
                                          <div class="body">
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                                         by OSCAL.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/export/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/export/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/inherited" class="toc2 name">inherited</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/inherited">Switch to JSON</a></div>
                     <p class="formal-name">Inherited Control Implementation</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Describes a control implementation inherited by a leveraging system.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">is unique</span> for <code class="path">responsible-role</code>: any target value must be unique (i.e., occur only once)</p>
                        </div>
                        </details>
                     <details open="open">
                        <summary>Attributes (2):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/inherited/uuid" class="toc3 name">uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/inherited/uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Inherited Universally Unique Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this inherited entry elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>inherited control implementation</code> can be used to reference the data item locally or globally (e.g., in an imported
                                    OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                                    of the document.</p>
                              </div>
                           </div>
                           <div class="model-entry definition flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/inherited/provided-uuid" class="toc3 name">provided-uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/inherited/provided-uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Provided UUID</p>
                              </div>
                              <div class="body">
                                 <p class="definition-link"><a href="#/flag/oscal-ssp/provided-uuid">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (4):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/inherited/description" class="toc3 name">description</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/inherited/description">Switch to JSON</a></div>
                                 <p class="formal-name">Inherited Control Implementation Description</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> An implementation statement that describes the aspects of a control or control statement
                                    implementation that a leveraging system is inheriting from a leveraged system.</p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/inherited/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/inherited/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/inherited/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/inherited/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/inherited/responsible-role" class="toc3 name">responsible-role</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/inherited/responsible-roles">Switch to JSON</a></div>
                                 <p class="formal-name">Responsible Role</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                                          <p>The scope of use of this object determines if the responsibility has been performed
                                             or will be performed in the future. The containing object will describe the intent.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/satisfied" class="toc2 name">satisfied</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied">Switch to JSON</a></div>
                     <p class="formal-name">Satisfied Control Implementation Responsibility</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Describes how this system satisfies a responsibility imposed by a leveraged system.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">is unique</span> for <code class="path">responsible-role</code>: any target value must be unique (i.e., occur only once)</p>
                        </div>
                        </details>
                     <details open="open">
                        <summary>Attributes (2):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/satisfied/uuid" class="toc3 name">uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied/uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Satisfied Universally Unique Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this satisfied control implementation entry elsewhere
                                    in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>control implementation</code> can be used to reference the data item locally or globally (e.g., in an imported
                                    OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                                    of the document.</p>
                              </div>
                           </div>
                           <div class="model-entry definition flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/satisfied/responsibility-uuid" class="toc3 name">responsibility-uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied/responsibility-uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Responsibility UUID</p>
                              </div>
                              <div class="body">
                                 <p class="definition-link"><a href="#/flag/oscal-ssp/responsibility-uuid">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (5):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/satisfied/description" class="toc3 name">description</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied/description">Switch to JSON</a></div>
                                 <p class="formal-name">Satisfied Control Implementation Responsibility Description</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> An implementation statement that describes the aspects of a control or control statement
                                    implementation that a leveraging system is implementing based on a requirement from
                                    a leveraged system.</p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/satisfied/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/satisfied/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/satisfied/responsible-role" class="toc3 name">responsible-role</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied/responsible-roles">Switch to JSON</a></div>
                                 <p class="formal-name">Responsible Role</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                                          <p>The scope of use of this object determines if the responsibility has been performed
                                             or will be performed in the future. The containing object will describe the intent.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/by-component/satisfied/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/satisfied/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/responsible-role" class="toc2 name">responsible-role</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/responsible-roles">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Role</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/by-component/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/by-component/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-control-common/control-id" class="toc1 name">control-id</h1>
         <p class="type"><a href="/reference/datatypes/#token">token</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-control-common/control-id">Switch to JSON</a></div>
         <p class="formal-name">Control Identifier Reference</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A reference to a control with a corresponding <code>id</code> value. When referencing an externally defined <code>control</code>, the <code>Control Identifier Reference</code> must be used in the context of the external / imported OSCAL instance (e.g., uri-reference).</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/control-implementation" class="toc1 name">control-implementation</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/control-implementation">Switch to JSON</a></div>
         <p class="formal-name">Control Implementation</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Describes how the system satisfies a set of controls.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Use of <code>set-parameter</code> in this context, sets the parameter for all controls referenced by any <code>implemented-requirement</code> contained in this context. Any <code>set-parameter</code> defined in a child context will override this value. If not overridden by a child,
                     this value applies in the child context.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (2)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">set-parameter</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">implemented-requirement//by-component/export/provided</code> an index <code>by-component-export-provided-uuid</code> shall list values returned by targets <code>implemented-requirement//by-component/export/provided</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            </details>
         <details open="open">
            <summary>Elements (3):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/control-implementation/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/control-implementation/description">Switch to JSON</a></div>
                     <p class="formal-name">Control Implementation Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A statement describing important things to know about how this set of control satisfaction
                        documentation is approached.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/control-implementation/set-parameter" class="toc2 name">set-parameter</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/control-implementation/set-parameters">Switch to JSON</a></div>
                     <p class="formal-name">Set Parameter Value</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/set-parameter">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/control-implementation/implemented-requirement" class="toc2 name">implemented-requirement</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/control-implementation/implemented-requirements">Switch to JSON</a></div>
                     <p class="formal-name">Control-based Requirement</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Use of <code>set-parameter</code> in this context, sets the parameter for the referenced control. Any <code>set-parameter</code> defined in a child context will override this value. If not overridden by a child,
                                 this value applies in the child context.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/implemented-requirement">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/data-flow" class="toc1 name">data-flow</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/data-flow">Switch to JSON</a></div>
         <p class="formal-name">Data Flow</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A description of the logical flow of information within the system and across its
            boundaries, optionally supplemented by diagrams that illustrate these flows.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">diagram</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/data-flow/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/data-flow/description">Switch to JSON</a></div>
                     <p class="formal-name">Data Flow Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the system's data flow.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/data-flow/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/data-flow/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/data-flow/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/data-flow/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/data-flow/diagram" class="toc2 name">diagram</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/data-flow/diagrams">Switch to JSON</a></div>
                     <p class="formal-name">Diagram</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A diagram must include a <code>link</code> with a rel value of "diagram", who's href references a remote URI or an internal
                                 reference within this document containing the diagram.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/diagram">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/data-flow/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/data-flow/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-ssp/date-authorized" class="toc1 name">date-authorized</h1>
         <p class="type"><a href="/reference/datatypes/#date">date</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-ssp/date-authorized">Switch to JSON</a></div>
         <p class="formal-name">System Authorization Date</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The date the system received its authorization.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/diagram" class="toc1 name">diagram</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/diagram">Switch to JSON</a></div>
         <p class="formal-name">Diagram</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A graphic that provides a visual representation the system, or some aspect of it.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>A diagram must include a <code>link</code> with a rel value of "diagram", who's href references a remote URI or an internal
                     reference within this document containing the diagram.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (4)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">link/@rel</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>diagram</strong>: A reference to the diagram image.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">link[@rel='diagram']/@href[starts-with(.,'#')]</code>: the target value must match the lexical form of the 'uri-reference' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">link[@rel='diagram' and starts-with(@href,'#')]</code>this value must correspond to a listing in the index <code>index-back-matter-resource</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">link[@rel='diagram']/@href[not(starts-with(.,'#'))]</code>: the target value must match the lexical form of the 'uri' data type.</p>
            </div>
            </details>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/diagram/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/diagram/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Diagram ID</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this diagram elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>diagram</code> can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/diagram/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/diagram/description">Switch to JSON</a></div>
                     <p class="formal-name">Diagram Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the diagram.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This description is intended to be used as alternate text to support compliance with
                                 requirements from <a href="https://www.section508.gov/manage/laws-and-policies">Section 508 of the United States Workforce Rehabilitation Act of 1973</a>. </p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/diagram/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/diagram/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/diagram/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/diagram/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/diagram/caption" class="toc2 name">caption</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/diagram/caption">Switch to JSON</a></div>
                     <p class="formal-name">Caption</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A brief caption to annotate the diagram.</p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/diagram/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/diagram/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/document-id" class="toc1 name">document-id</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/document-id">Switch to JSON</a></div>
         <p class="formal-name">Document Identifier</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A document identifier qualified by an identifier <code>scheme</code>.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>A document identifier provides a <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with a <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that is used for a group of documents that are to be treated as different versions,
                     representations or digital surrogates of the same document.</p>
                  <p>A document identifier provides an additional data point for identifying a document
                     that can be assigned by a publisher or organization for purposes in a wider system,
                     such as a digital object identifier (DOI) or a local content management system identifier.</p>
                  <p>Use of a document identifier allows for document creators to associate sets of documents
                     that are related in some way by the same <code>document-id</code>.</p>
                  <p>An OSCAL document always has an implicit document identifier provided by the document's
                     UUID, defined by the <code>uuid</code> on the top-level object. Having a default UUID-based identifier ensures all documents
                     can be minimally identified when other document identifiers are not provided.</p>
               </div>
            </details>
         </div>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model field-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/field/oscal-metadata/document-id/scheme" class="toc2 name">scheme</h2>
                     <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/document-id/scheme">Switch to JSON</a></div>
                     <p class="formal-name">Document Identification Scheme</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Qualifies the kind of document identifier using a URI. If the scheme is not provided
                        the value of the element will be interpreted as a string of characters.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This value must be an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that serves as a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#use-as-a-naming-system-identifier">naming system identifier</a>.</p>
                           </div>
                        </details>
                     </div>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed value</span></p>
                           <p>The value <b>may be locally defined</b>, or the following:</p>
                           <ul>
                              
                              <li><strong>http://www.doi.org/</strong>: A Digital Object Identifier (DOI); use is preferred, since this allows for retrieval
                                 of a full bibliographic record.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/email-address" class="toc1 name">email-address</h1>
         <p class="type"><a href="/reference/datatypes/#email">email</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/email-address">Switch to JSON</a></div>
         <p class="formal-name">Email Address</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> An email address as defined by <a href="https://tools.ietf.org/html/rfc5322#section-3.4.1">RFC 5322 Section 3.4.1</a>.</p>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-implementation-common/function-performed" class="toc1 name">function-performed</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-implementation-common/function-performed">Switch to JSON</a></div>
         <p class="formal-name">Functions Performed</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Describes a function performed for a given authorized privilege by this user class.</p>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/hash" class="toc1 name">hash</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/hash">Switch to JSON</a></div>
         <p class="formal-name">Hash</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A representation of a cryptographic digest generated over a resource using a specified
            hash algorithm.</p>
         <details>
            <summary>Constraints (4)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">.[@algorithm=('SHA-224','SHA3-224')</code>: a target (value) must match the regular expression '^[0-9a-fA-F]{28}$'.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">.[@algorithm=('SHA-256','SHA3-256')</code>: a target (value) must match the regular expression '^[0-9a-fA-F]{32}$'.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">.[@algorithm=('SHA-384','SHA3-384')</code>: a target (value) must match the regular expression '^[0-9a-fA-F]{48}$'.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">.[@algorithm=('SHA-512','SHA3-512')</code>: a target (value) must match the regular expression '^[0-9a-fA-F]{64}$'.</p>
            </div>
            </details>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model field-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/field/oscal-metadata/hash/algorithm" class="toc2 name">algorithm</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/hash/algorithm">Switch to JSON</a></div>
                     <p class="formal-name">Hash algorithm</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The digest method by which a hash is derived.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Any other value used MUST be a value defined in the W3C <a href="https://www.w3.org/TR/xmlsec-algorithms/#digest-method-uris">XML Security Algorithm Cross-Reference</a> Digest Methods (W3C, April 2013) or <a href="https://tools.ietf.org/html/rfc6931#section-2.1.5">RFC 6931 Section 2.1.5</a> New SHA Functions.</p>
                           </div>
                        </details>
                     </div>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span></p>
                           <p>The value <b>may be locally defined</b>, or one of the following:</p>
                           <ul>
                              
                              <li><strong>SHA-224</strong>: The SHA-224 algorithm as defined by NIST FIPS 180-4.
                                 </li>
                              
                              <li><strong>SHA-256</strong>: The SHA-256 algorithm as defined by NIST FIPS 180-4.
                                 </li>
                              
                              <li><strong>SHA-384</strong>: The SHA-384 algorithm as defined by NIST FIPS 180-4.
                                 </li>
                              
                              <li><strong>SHA-512</strong>: The SHA-512 algorithm as defined by NIST FIPS 180-4.
                                 </li>
                              
                              <li><strong>SHA3-224</strong>: The SHA3-224 algorithm as defined by NIST FIPS 202.
                                 </li>
                              
                              <li><strong>SHA3-256</strong>: The SHA3-256 algorithm as defined by NIST FIPS 202.
                                 </li>
                              
                              <li><strong>SHA3-384</strong>: The SHA3-384 algorithm as defined by NIST FIPS 202.
                                 </li>
                              
                              <li><strong>SHA3-512</strong>: The SHA3-512 algorithm as defined by NIST FIPS 202.
                                 </li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/impact" class="toc1 name">impact</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/impact">Switch to JSON</a></div>
         <p class="formal-name">Impact Level</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The expected level of impact resulting from the described information.</p>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/impact/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/impact/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/impact/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/impact/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/impact/base" class="toc2 name">base</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/impact/base">Switch to JSON</a></div>
                     <p class="formal-name">Base Level (Confidentiality, Integrity, or Availability)</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-ssp/base">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/impact/selected" class="toc2 name">selected</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/impact/selected">Switch to JSON</a></div>
                     <p class="formal-name">Selected Level (Confidentiality, Integrity, or Availability)</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-ssp/selected">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/impact/adjustment-justification" class="toc2 name">adjustment-justification</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/impact/adjustment-justification">Switch to JSON</a></div>
                     <p class="formal-name">Adjustment Justification</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-ssp/adjustment-justification">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/implementation-status" class="toc1 name">implementation-status</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/implementation-status">Switch to JSON</a></div>
         <p class="formal-name">Implementation Status</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Indicates the degree to which the a given control is implemented.</p>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/implementation-status/state" class="toc2 name">state</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/implementation-status/state">Switch to JSON</a></div>
                     <p class="formal-name">Implementation State</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Identifies the implementation status of the control or control objective.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span></p>
                           <p>The value <b>may be locally defined</b>, or one of the following:</p>
                           <ul>
                              
                              <li><strong>implemented</strong>: The control is fully implemented.</li>
                              
                              <li><strong>partial</strong>: The control is partially implemented.</li>
                              
                              <li><strong>planned</strong>: There is a plan for implementing the control as explained in the remarks.</li>
                              
                              <li><strong>alternative</strong>: There is an alternative implementation for this control as explained in the remarks.</li>
                              
                              <li><strong>not-applicable</strong>: This control does not apply to this system as justified in the remarks.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/implementation-status/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/implementation-status/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/implemented-requirement" class="toc1 name">implemented-requirement</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement">Switch to JSON</a></div>
         <p class="formal-name">Control-based Requirement</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Describes how the system satisfies the requirements of an individual control.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Use of <code>set-parameter</code> in this context, sets the parameter for the referenced control. Any <code>set-parameter</code> defined in a child context will override this value. If not overridden by a child,
                     this value applies in the child context.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (11)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">(.|statement|.//by-component)/prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>control-origination</strong>: Identifies the source of the implemented control.  Any control-origination prop
                     defined in a child context will override the parent value.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">(.|statement|.//by-component)/prop[@name='control-origination']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>organization</strong>: The control is implemented by the organization owning the system, but is not specific
                     to the system itself.</li>
                  
                  <li><strong>system-specific</strong>: The control is implemented specifically to this system.</li>
                  
                  <li><strong>customer-configured</strong>: The control is provided by the system, but must be configured by the customer.</li>
                  
                  <li><strong>customer-provided</strong>: The control must be implemented by the customer.</li>
                  
                  <li><strong>inherited</strong>: This control is inherited from an underlying system.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>leveraged-authorization</strong>: Indicates all or some portion of this control is inherited from an underlying authorized
                     system.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">responsible-role/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>asset-owner</strong>: Accountable for ensuring the asset is managed in accordance with organizational
                     policies and procedures.</li>
                  
                  <li><strong>asset-administrator</strong>: Responsible for administering a set of assets.</li>
                  
                  
                  <li><strong>security-operations</strong>: Members of the security operations center (SOC).</li>
                  
                  
                  <li><strong>network-operations</strong>: Members of the network operations center (NOC).</li>
                  
                  <li><strong>incident-response</strong>: Responsible for responding to an event that could lead to loss of, or disruption
                     to, an organization's operations, services or functions.</li>
                  
                  <li><strong>help-desk</strong>: Responsible for providing information and support to users.</li>
                  
                  
                  <li><strong>configuration-management</strong>: Responsible for the configuration management processes governing changes to the
                     asset.</li>
                  
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">responsible-role|statement/responsible-role|.//by-component//responsible-role</code>this value must correspond to a listing in the index <code>index-metadata-role-id</code> using a key constructed of key field(s) <code>@role-id</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">responsible-role|statement/responsible-role|.//by-component//responsible-role</code>this value must correspond to a listing in the index <code>index-metadata-party-uuid</code> using a key constructed of key field(s) <code>party-uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">has cardinality</span> for <code class="path">.//by-component</code> the cardinality of  <code>.//by-component</code> is constrained: <b>1</b>; maximum <b>unbounded</b>.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">set-parameter</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">responsible-role</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">statement</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">by-component</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Attributes (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Control Requirement Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this control requirement elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>control requirement</code> can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
               <div class="model-entry definition flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/control-id" class="toc2 name">control-id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/control-id">Switch to JSON</a></div>
                     <p class="formal-name">Control Identifier Reference</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/flag/oscal-control-common/control-id">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (7):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/set-parameter" class="toc2 name">set-parameter</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/set-parameters">Switch to JSON</a></div>
                     <p class="formal-name">Set Parameter Value</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/set-parameter">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/responsible-role" class="toc2 name">responsible-role</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/responsible-roles">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Role</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/statement" class="toc2 name">statement</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/statements">Switch to JSON</a></div>
                     <p class="formal-name">Specific Control Statement</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/statement">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/by-component" class="toc2 name">by-component</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/by-components">Switch to JSON</a></div>
                     <p class="formal-name">Component Control Implementation</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Use of <code>set-parameter</code> in this context, sets the parameter for the control referenced in the containing
                                 <code>implemented-requirement</code> applied to the referenced component. If the <code>by-component</code> is used as a child of a <code>statement</code>, then the parameter value also applies only in the context of the referenced statement.
                                 If the same parameter is also set in the <code>control-implementation</code> or a specific <code>implemented-requirement</code>, then this <code>by-component/set-parameter</code> value will override the other value(s) in the context of the referenced component,
                                 control, and statement (if parent).</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/by-component">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/implemented-requirement/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/implemented-requirement/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/import-profile" class="toc1 name">import-profile</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/import-profile">Switch to JSON</a></div>
         <p class="formal-name">Import Profile</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Used to import the OSCAL profile representing the system's control baseline.</p>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/import-profile/href" class="toc2 name">href</h2>
                     <p class="type"><a href="/reference/datatypes/#uri-reference">uri-reference</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/import-profile/href">Switch to JSON</a></div>
                     <p class="formal-name">Profile Reference</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A resolvable URL reference to the profile or catalog to use as the system's control
                        baseline.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This value may be one of:</p>
                              <ol>
                                 
                                 <li>an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that points to a network resolvable resource,</li>
                                 
                                 <li>a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#relative-reference">relative reference</a> pointing to a network resolvable resource whose base URI is the URI of the containing
                                    document, or</li>
                                 
                                 <li>a bare URI fragment (i.e., `#uuid`) pointing to a <code>back-matter</code> resource in this or an imported document (see <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#linking-to-another-oscal-object">linking to another OSCAL object</a>).</li>
                                 </ol>
                              <p>If the resource is an OSCAL profile, it is expected that a tool will resolve the profile
                                 according to the OSCAL <a href="https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/">profile resolution specification</a> to produce a resolved profile for use when processing the containing system security
                                 plan. This allows a system security plan processor to use the baseline as a catalog
                                 of controls.</p>
                              <p>While it is possible to reference a previously resolved OSCAL profile as a catalog,
                                 this practice is discouraged since the unresolved form of the profile communicates
                                 more information about selections and changes to the underlying catalog. Furthermore,
                                 the underlying catalog can be maintained separately from the profile, which also has
                                 maintenance advantages for distinct maintainers, ensuring that the best available
                                 information is produced through profile resolution.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/import-profile/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/import-profile/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-control-common/include-all" class="toc1 name">include-all</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/include-all">Switch to JSON</a></div>
         <p class="formal-name">Include All</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Include all controls from the imported catalog or profile resources.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>This element provides an alternative to calling controls individually from a catalog.</p>
               </div>
            </details>
         </div>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/inventory-item" class="toc1 name">inventory-item</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item">Switch to JSON</a></div>
         <p class="formal-name">Inventory Item</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A single managed inventory item within the system.</p>
         <details>
            <summary>Constraints (9)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>ipv4-address</strong>: The Internet Protocol v4 Address of the asset.</li>
                  
                  <li><strong>ipv6-address</strong>: The Internet Protocol v6 Address of the asset.</li>
                  
                  <li><strong>fqdn</strong>: The full-qualified domain name (FQDN) of the asset.</li>
                  
                  <li><strong>uri</strong>: A Uniform Resource Identifier (URI) for the asset.</li>
                  
                  <li><strong>serial-number</strong>: A serial number for the asset.</li>
                  
                  <li><strong>netbios-name</strong>: The NetBIOS name for the asset.</li>
                  
                  <li><strong>mac-address</strong>: The media access control (MAC) address for the asset.</li>
                  
                  <li><strong>physical-location</strong>: The physical location of the asset's hardware (e.g., Data Center ID, Cage#, Rack#,
                     or other meaningful location identifiers).</li>
                  
                  <li><strong>is-scanned</strong>: is the asset subjected to network scans? (yes/no)</li>
                  
                  
                  
                  
                  
                  <li><strong>hardware-model</strong>: The model number of the hardware used by the asset.</li>
                  
                  
                  <li><strong>os-name</strong>: The name of the operating system used by the asset.</li>
                  
                  
                  <li><strong>os-version</strong>: The version of the operating system used by the asset.</li>
                  
                  
                  <li><strong>software-name</strong>: The software product name used by the asset.</li>
                  
                  
                  <li><strong>software-version</strong>: The software product version used by the asset.</li>
                  
                  
                  <li><strong>software-patch-level</strong>: The software product patch level used by the asset.</li>
                  
                  
                  
                  
                  
                  
                  <li><strong>asset-type</strong>: Simple indication of the asset's function, such as Router, Storage Array, DNS Server.</li>
                  
                  <li><strong>asset-id</strong>: An organizationally specific identifier that is used to uniquely identify a logical
                     or tangible item by the organization that owns the item.</li>
                  
                  <li><strong>asset-tag</strong>: An asset tag assigned by the organization responsible for maintaining the logical
                     or tangible item.</li>
                  
                  <li><strong>public</strong>: Identifies whether the asset is publicly accessible (yes/no)</li>
                  
                  <li><strong>virtual</strong>: Identifies whether the asset is virtualized (yes/no)</li>
                  
                  <li><strong>vlan-id</strong>: Virtual LAN identifier of the asset.</li>
                  
                  <li><strong>network-id</strong>: The network identifier of the asset.</li>
                  
                  <li><strong>label</strong>: A human-readable label for the parent context.</li>
                  
                  <li><strong>sort-id</strong>: An alternative identifier, whose value is easily sortable among other such values
                     in the document.</li>
                  
                  <li><strong>baseline-configuration-name</strong>: The name of the baseline configuration for the asset.</li>
                  
                  <li><strong>allows-authenticated-scan</strong>: Can the asset be check with an authenticated scan? (yes/no)</li>
                  
                  <li><strong>function</strong>: The function provided by the asset for the system.</li>
                  
                  
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='asset-type']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  
                  
                  <li><strong>operating-system</strong>: System software that manages computer hardware, software resources, and provides
                     common services for computer programs.</li>
                  
                  <li><strong>database</strong>: An electronic collection of data, or information, that is specially organized for
                     rapid search and retrieval.</li>
                  
                  <li><strong>web-server</strong>: A system that delivers content or services to end users over the Internet or an
                     intranet.</li>
                  
                  <li><strong>dns-server</strong>: A system that resolves domain names to internet protocol (IP) addresses.</li>
                  
                  <li><strong>email-server</strong>: A computer system that sends and receives electronic mail messages.</li>
                  
                  <li><strong>directory-server</strong>: A  system that stores, organizes and provides access to directory information in
                     order to unify network resources.</li>
                  
                  <li><strong>pbx</strong>: A private branch exchange (PBX) provides a a private telephone switchboard.</li>
                  
                  <li><strong>firewall</strong>: A network security system that monitors and controls incoming and outgoing network
                     traffic based on predetermined security rules.</li>
                  
                  <li><strong>router</strong>: A physical or virtual networking device that forwards data packets between computer
                     networks.</li>
                  
                  <li><strong>switch</strong>: A physical or virtual networking device that connects devices within a computer
                     network by using packet switching to receive and forward data to the destination device.</li>
                  
                  <li><strong>storage-array</strong>: A consolidated, block-level data storage capability.</li>
                  
                  <li><strong>appliance</strong>: A physical or virtual machine that centralizes hardware, software, or services for
                     a specific purpose.</li>
                  
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">(.)[@type=('software', 'hardware', 'service')]/prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>vendor-name</strong>: The name of the company or organization </li>
                  </ul>
            </div>
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='is-scanned']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>yes</strong>: The asset is included in periodic vulnerability scanning.</li>
                  
                  <li><strong>no</strong>: The asset is not included in periodic vulnerability scanning.</li>
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">link/@rel</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>baseline-template</strong>: A reference to the baseline template used to configure the asset.</li>
                  </ul>
            </div>
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">responsible-party/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>asset-owner</strong>: Accountable for ensuring the asset is managed in accordance with organizational
                     policies and procedures.</li>
                  
                  <li><strong>asset-administrator</strong>: Responsible for administering a set of assets.</li>
                  
                  
                  <li><strong>security-operations</strong>: Members of the security operations center (SOC).</li>
                  
                  
                  <li><strong>network-operations</strong>: Members of the network operations center (NOC).</li>
                  
                  <li><strong>incident-response</strong>: Responsible for responding to an event that could lead to loss of, or disruption
                     to, an organization's operations, services or functions.</li>
                  
                  <li><strong>help-desk</strong>: Responsible for providing information and support to users.</li>
                  
                  
                  <li><strong>configuration-management</strong>: Responsible for the configuration management processes governing changes to the
                     asset.</li>
                  
                  
                  <li><strong>maintainer</strong>: Responsible for the creation and maintenance of a component.</li>
                  
                  <li><strong>provider</strong>: Organization responsible for providing the component, if this is different from
                     the "maintainer" (e.g., a reseller).</li>
                  
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">responsible-party</code>this value must correspond to a listing in the index <code>index-metadata-role-id</code> using a key constructed of key field(s) <code>@role-id</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">responsible-party</code>this value must correspond to a listing in the index <code>index-metadata-party-uuid</code> using a key constructed of key field(s) <code>party-uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">responsible-party</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/inventory-item/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Inventory Item Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this inventory item elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#scope">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>inventory item</code> can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (6):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/inventory-item/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/description">Switch to JSON</a></div>
                     <p class="formal-name">Inventory Item Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the inventory item stating its purpose within the system.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/inventory-item/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/inventory-item/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/inventory-item/responsible-party" class="toc2 name">responsible-party</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/responsible-parties">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Party</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-party</code> requires one or more <code>party-uuid</code> references creating a strong relationship arc between the referenced <code>role-id</code> and the reference parties. This differs in semantics from <code>responsible-role</code> which doesn't require that a <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-party">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/inventory-item/implemented-component" class="toc2 name">implemented-component</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/implemented-components">Switch to JSON</a></div>
                     <p class="formal-name">Implemented Component</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The set of components that are implemented in a given system inventory item.</p>
                     <details>
                        <summary>Constraints (4)</summary>
                        
                        
                        
                        
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span> for <code class="path">prop/@name</code></p>
                           <p>The value <b>may be locally defined</b>, or one of the following:</p>
                           <ul>
                              
                              
                              <li><strong>version</strong>: The version of the component.</li>
                              
                              <li><strong>patch-level</strong>: The specific patch level of the component.</li>
                              
                              <li><strong>model</strong>: The model of the component.</li>
                              
                              
                              <li><strong>release-date</strong>: The date the component was released, such as a software release date or policy publication
                                 date.</li>
                              
                              <li><strong>validation-type</strong>: Used with component-type='validation' to provide a well-known name for a kind of
                                 validation.</li>
                              
                              <li><strong>validation-reference</strong>: Used with component-type='validation' to indicate the validating body's assigned
                                 identifier for their validation of this component.</li>
                              
                              
                              
                              <li><strong>asset-type</strong>: Simple indication of the asset's function, such as Router, Storage Array, DNS Server.</li>
                              
                              <li><strong>asset-id</strong>: An organizationally specific identifier that is used to uniquely identify a logical
                                 or tangible item by the organization that owns the item.</li>
                              
                              <li><strong>asset-tag</strong>: An asset tag assigned by the organization responsible for maintaining the logical
                                 or tangible item.</li>
                              
                              <li><strong>public</strong>: Identifies whether the asset is publicly accessible (yes/no)</li>
                              
                              <li><strong>virtual</strong>: Identifies whether the asset is virtualized (yes/no)</li>
                              
                              <li><strong>vlan-id</strong>: Virtual LAN identifier of the asset.</li>
                              
                              <li><strong>network-id</strong>: The network identifier of the asset.</li>
                              
                              <li><strong>label</strong>: A human-readable label for the parent context.</li>
                              
                              <li><strong>sort-id</strong>: An alternative identifier, whose value is easily sortable among other such values
                                 in the document.</li>
                              
                              <li><strong>baseline-configuration-name</strong>: The name of the baseline configuration for the asset.</li>
                              
                              <li><strong>allows-authenticated-scan</strong>: Can the asset be check with an authenticated scan? (yes/no)</li>
                              
                              <li><strong>function</strong>: The function provided by the asset for the system.</li>
                              
                              
                              </ul>
                        </div>
                        
                        
                        <div class="constraint">
                           <p><span class="usa-tag">has cardinality</span> for <code class="path">prop[@name='asset-id']</code> the cardinality of  <code>prop[@name='asset-id']</code> is constrained: <b>1</b>; maximum <b>unbounded</b>.</p>
                        </div>
                        
                        
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span> for <code class="path">responsible-party/@role-id</code></p>
                           <p>The value <b>may be locally defined</b>, or one of the following:</p>
                           <ul>
                              
                              <li><strong>asset-owner</strong>: Accountable for ensuring the asset is managed in accordance with organizational
                                 policies and procedures.</li>
                              
                              <li><strong>asset-administrator</strong>: Responsible for administering a set of assets.</li>
                              
                              
                              <li><strong>security-operations</strong>: Members of the security operations center (SOC).</li>
                              
                              
                              <li><strong>network-operations</strong>: Members of the network operations center (NOC).</li>
                              
                              <li><strong>incident-response</strong>: Responsible for responding to an event that could lead to loss of, or disruption
                                 to, an organization's operations, services or functions.</li>
                              
                              <li><strong>help-desk</strong>: Responsible for providing information and support to users.</li>
                              
                              
                              <li><strong>configuration-management</strong>: Responsible for the configuration management processes governing changes to the
                                 asset.</li>
                              
                              </ul>
                        </div>
                        
                        
                        
                        
                        <div class="constraint">
                           <p><span class="usa-tag">is unique</span> for <code class="path">responsible-party</code>: any target value must be unique (i.e., occur only once)</p>
                        </div>
                        </details>
                     <details open="open">
                        <summary>Attribute (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-implementation-common/inventory-item/implemented-component/component-uuid" class="toc3 name">component-uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/implemented-components/component-uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Component Universally Unique Identifier Reference</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a> identifier reference to a <code>component</code> that is implemented as part of an inventory item.</p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (4):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-implementation-common/inventory-item/implemented-component/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/implemented-components/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-implementation-common/inventory-item/implemented-component/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/implemented-components/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-implementation-common/inventory-item/implemented-component/responsible-party" class="toc3 name">responsible-party</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/implemented-components/responsible-parties">Switch to JSON</a></div>
                                 <p class="formal-name">Responsible Party</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A <code>responsible-party</code> requires one or more <code>party-uuid</code> references creating a strong relationship arc between the referenced <code>role-id</code> and the reference parties. This differs in semantics from <code>responsible-role</code> which doesn't require that a <code>party-uuid</code> is referenced.</p>
                                          <p>The scope of use of this object determines if the responsibility has been performed
                                             or will be performed in the future. The containing object will describe the intent.</p>
                                       </div>
                                       <div class="remarks">
                                          <p>This construct is used to either: 1) associate a party or parties to a role defined
                                             on the component using the <code>responsible-role</code> construct, or 2) to define a party or parties that are responsible for a role defined
                                             within the context of the containing <code>inventory-item</code>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-party">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-implementation-common/inventory-item/implemented-component/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/implemented-components/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/inventory-item/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/inventory-item/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/last-modified" class="toc1 name">last-modified</h1>
         <p class="type"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/last-modified">Switch to JSON</a></div>
         <p class="formal-name">Last Modified Timestamp</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The date and time the document was last stored for later retrieval.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>This value represents the point in time when the OSCAL document was last updated,
                     or at the point of creation the creation date. Typically, this date value will be
                     machine generated at time of creation or modification. Ideally, this field will be
                     managed by the editing tool or service used to make modifications when storing the
                     modified document.</p>
                  <p>The intent of the last modified timestamp is to distinguish between significant change
                     milestones when the document may be accessed by multiple entities. This allows a given
                     entity to differentiate between mutiple document states at specific points in time.
                     It is possible to make multiple modifications to the document without storing these
                     changes. In such a case, the last modified timestamp might not be updated until the
                     document is finally stored.</p>
                  <p>In some cases, an OSCAL document may be derived from some source material in a different
                     format. In such a case, the <code>last-modified</code> value should indicate the last modification time of the OSCAL document instance,
                     not the source material.</p>
               </div>
            </details>
         </div>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/link" class="toc1 name">link</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/link">Switch to JSON</a></div>
         <p class="formal-name">Link</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A reference to a local or remote resource, that has a specific relation to the containing
            object.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>To provide a cryptographic hash for a remote target resource, a local reference to
                     a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                  <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (4)</summary>
            
            A local reference SHOULD NOT have a media-type.
            Since both link and back-matter/resource both allow specification of a media-type,
            the media-type on link may conflict with the any media-type entries on a resource's
            rlink or base64 objects. This constraint prevents this from occurring.
            
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">.[@rel=('reference') and starts-with(@href,'#')]/@href</code>: the target value must match the lexical form of the 'uri-reference' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">.[@rel=('reference') and starts-with(@href,'#')]</code>this value must correspond to a listing in the index <code>index-back-matter-resource</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">.[@rel=('reference') and not(starts-with(@href,'#'))]/@href</code>: the target value must match the lexical form of the 'uri' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">@resource-fragment</code>: a target (value) must match the regular expression '(?:[0-9a-zA-Z-._~/?!$&amp;'()*+,;=:@]|%[0-9A-F][0-9A-F])+'.</p>
            </div>
            </details>
         <details open="open">
            <summary>Attributes (4):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/link/href" class="toc2 name">href</h2>
                     <p class="type"><a href="/reference/datatypes/#uri-reference">uri-reference</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/link/href">Switch to JSON</a></div>
                     <p class="formal-name">Hypertext Reference</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A resolvable URL reference to a resource.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This value may be one of:</p>
                              <ol>
                                 
                                 <li>an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that points to a network resolvable resource,</li>
                                 
                                 <li>a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#relative-reference">relative reference</a> pointing to a network resolvable resource whose base URI is the URI of the containing
                                    document, or</li>
                                 
                                 <li>a bare URI fragment (i.e., `#uuid`) pointing to an OSCAL object by the objects identifier
                                    (e.g., id, uuid) in this or an imported document (see <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#linking-to-another-oscal-object">linking to another OSCAL object</a>). The specific object type will differ based on the link relationship type.</li>
                                 </ol>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/link/rel" class="toc2 name">rel</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/link/rel">Switch to JSON</a></div>
                     <p class="formal-name">Link Relation Type</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Describes the type of relationship provided by the link's hypertext reference. This
                        can be an indicator of the link's purpose.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed value</span></p>
                           <p>The value <b>may be locally defined</b>, or the following:</p>
                           <ul>
                              
                              <li><strong>reference</strong>: A generalized reference to a network resource (relative or absolute) or to a back-matter
                                 resource by UUID expressed as a bare URI fragment.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
               <div class="model-entry definition flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/link/media-type" class="toc2 name">media-type</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/link/media-type">Switch to JSON</a></div>
                     <p class="formal-name">Media Type</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p> The Internet Assigned Numbers Authority (IANA) <a href="https://www.iana.org/assignments/media-types/media-types.xhtml">Media Types Registry</a> defines a standardized set of media types, which may be used here.</p>
                              <p>The <code>application/oscal+xml</code>, <code>application/oscal+json</code> or <code>application/oscal+yaml</code> media types SHOULD be used when referencing OSCAL XML, JSON, or YAML resources respectively.</p>
                              <p>**Note: There is no official media type for YAML at this time.** OSCAL documents should
                                 specify <code>application/yaml</code> for general YAML content, or <code>application/oscal+yaml</code> for YAML-based OSCAL content. This approach aligns with use of a structured name
                                 suffix, per <a href="https://www.rfc-editor.org/rfc/rfc6838.html#section-4.2.8">RFC 6838 Section 4.2.8</a>.</p>
                              <p>Some earlier OSCAL content incorporated the model into the media type. For example:
                                 <code>application/oscal.catalog+xml</code>. This practice SHOULD be avoided, since the OSCAL model can be detected by parsing
                                 the initial content of the referenced resource.</p>
                           </div>
                           <div class="remarks">
                              <p>The <code>media-type</code> provides a hint about the content model of the referenced resource. A valid entry
                                 from the <a href="https://www.iana.org/assignments/media-types/media-types.xhtml">IANA Media Types registry</a> SHOULD be used.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/flag/oscal-metadata/media-type">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/link/resource-fragment" class="toc2 name">resource-fragment</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/link/resource-fragment">Switch to JSON</a></div>
                     <p class="formal-name">Resource Fragment</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> In case where the <code>href</code> points to a <code>back-matter/resource</code>, this value will indicate the URI <a href="https://www.rfc-editor.org/rfc/rfc3986#section-3.5">fragment</a> to append to any <code>rlink</code> associated with the resource. This value MUST be <a href="https://www.rfc-editor.org/rfc/rfc3986#section-2.1">URI encoded</a>.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/link/text" class="toc2 name">text</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/link/text">Switch to JSON</a></div>
                     <p class="formal-name">Link Text</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-metadata/location-type" class="toc1 name">location-type</h1>
         <p class="type"><a href="/reference/datatypes/#token">token</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-metadata/location-type">Switch to JSON</a></div>
         <p class="formal-name">Address Type</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Indicates the type of address.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>home</strong>: A home address.</li>
                  
                  <li><strong>work</strong>: A work address.</li>
                  </ul>
            </div>
            </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-metadata/location-uuid" class="toc1 name">location-uuid</h1>
         <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-metadata/location-uuid">Switch to JSON</a></div>
         <p class="formal-name">Location Universally Unique Identifier Reference</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Reference to a location by UUID.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span>this value must correspond to a listing in the index <code>index-metadata-location-uuid</code> using a key constructed of key field(s) <code>.</code></p>
            </div>
            </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/location-uuid" class="toc1 name">location-uuid</h1>
         <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/location-uuid">Switch to JSON</a></div>
         <p class="formal-name">Location Universally Unique Identifier Reference</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Reference to a location by UUID.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span>this value must correspond to a listing in the index <code>index-metadata-location-uuid</code> using a key constructed of key field(s) <code>.</code></p>
            </div>
            </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-metadata/media-type" class="toc1 name">media-type</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-metadata/media-type">Switch to JSON</a></div>
         <p class="formal-name">Media Type</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A label that indicates the nature of a resource, as a data serialization or format.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p> The Internet Assigned Numbers Authority (IANA) <a href="https://www.iana.org/assignments/media-types/media-types.xhtml">Media Types Registry</a> defines a standardized set of media types, which may be used here.</p>
                  <p>The <code>application/oscal+xml</code>, <code>application/oscal+json</code> or <code>application/oscal+yaml</code> media types SHOULD be used when referencing OSCAL XML, JSON, or YAML resources respectively.</p>
                  <p>**Note: There is no official media type for YAML at this time.** OSCAL documents should
                     specify <code>application/yaml</code> for general YAML content, or <code>application/oscal+yaml</code> for YAML-based OSCAL content. This approach aligns with use of a structured name
                     suffix, per <a href="https://www.rfc-editor.org/rfc/rfc6838.html#section-4.2.8">RFC 6838 Section 4.2.8</a>.</p>
                  <p>Some earlier OSCAL content incorporated the model into the media type. For example:
                     <code>application/oscal.catalog+xml</code>. This practice SHOULD be avoided, since the OSCAL model can be detected by parsing
                     the initial content of the referenced resource.</p>
               </div>
            </details>
         </div>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/metadata" class="toc1 name">metadata</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata">Switch to JSON</a></div>
         <p class="formal-name">Document Metadata</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Provides information about the containing document, and defines concepts that are
            shared across the document.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>All OSCAL documents use the same metadata structure, that provides a consistent way
                     of expressing OSCAL document metadata across all OSCAL models. The metadata section
                     also includes declarations of individual objects (i.e., roles, location, parties)
                     that may be referenced within and across linked OSCAL documents.</p>
                  <p>The metadata in an OSCAL document has few required fields, representing only the bare
                     minimum data needed to differentiate one instance from another. Tools and users creating
                     OSCAL documents may choose to use any of the optional fields, as well as extension
                     mechanisms (e.g., properties, links) to go beyond this minimum to suit their use cases.</p>
                  <p>A publisher of OSCAL content can use the <code>published</code>, <code>last-modified</code>, and <code>version</code> fields to establish information about an individual in a sequence of successive revisions
                     of a given OSCAL-based publication. The metadata for a previous revision can be represented
                     as a <code>revision</code> within this object. Links may also be provided using the <code>predecessor-version</code> and <code>successor-version</code> link relations to provide for direct access to the related resource. These relations
                     can be provided as a link child of this object or as <code>link</code> within a given <code>revision</code>.</p>
                  <p>A <code>responsible-party</code> entry in this context refers to roles and parties that have responsibility relative
                     to the production, review, publication, and use of the containing document.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (14)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">role</code> an index <code>index-metadata-role-ids</code> shall list values returned by targets <code>role</code> using keys constructed of key field(s) <code>@id</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">document-id</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">prop</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">.//prop</code> an index <code>index-metadata-property-uuid</code> shall list values returned by targets <code>.//prop</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">link</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">role</code> an index <code>index-metadata-role-id</code> shall list values returned by targets <code>role</code> using keys constructed of key field(s) <code>@id</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">location</code> an index <code>index-metadata-location-uuid</code> shall list values returned by targets <code>location</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">party</code> an index <code>index-metadata-party-uuid</code> shall list values returned by targets <code>party</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">party[@type='organization']</code> an index <code>index-metadata-party-organizations-uuid</code> shall list values returned by targets <code>party[@type='organization']</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">responsible-party</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">responsible-party/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>creator</strong>: Indicates the person or organization that created this content.</li>
                  
                  <li><strong>prepared-by</strong>: Indicates the person or organization that prepared this content.</li>
                  
                  <li><strong>prepared-for</strong>: Indicates the person or organization for which this content was created.</li>
                  
                  <li><strong>content-approver</strong>: Indicates the person or organization responsible for all content represented in
                     the "document".</li>
                  
                  <li><strong>contact</strong>: Indicates the person or organization to contact for questions or support related
                     to this content.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal')]/@name</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>keywords</strong>: The value identifies a comma-seperated listing of keywords associated with this
                     content. These keywords may be used as search terms for indexing and other applications.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">link/@rel</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>canonical</strong>: The link identifies the authoritative location for this resource. Defined by RFC
                     6596.</li>
                  
                  <li><strong>alternate</strong>: The link identifies an alternative location or format for this resource. Defined
                     by the HTML Living Standard</li>
                  
                  <li><strong>latest-version</strong>: This link identifies a resource containing the latest version in the version history.
                     Defined by RFC 5829.</li>
                  
                  <li><strong>predecessor-version</strong>: This link identifies a resource containing the predecessor version in the version
                     history. Defined by  RFC 5829.</li>
                  
                  <li><strong>successor-version</strong>: This link identifies a resource containing the predecessor version in the version
                     history. Defined by RFC 5829.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">document-id</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Elements (15):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/title" class="toc2 name">title</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/title">Switch to JSON</a></div>
                     <p class="formal-name">Document Title</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A name given to the document, which may be used by a tool for display and navigation.</p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/published" class="toc2 name">published</h2>
                     <p class="type"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/published">Switch to JSON</a></div>
                     <p class="formal-name">Publication Timestamp</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Typically, this date value will be machine-generated at the time the containing document
                                 is published.</p>
                              <p>In some cases, an OSCAL document may be derived from some source material provided
                                 in a different format. In such a case, the <code>published</code> value should indicate when the OSCAL document instance was last published, not the
                                 source material.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/published">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/last-modified" class="toc2 name">last-modified</h2>
                     <p class="type"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/last-modified">Switch to JSON</a></div>
                     <p class="formal-name">Last Modified Timestamp</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This value represents the point in time when the OSCAL document was last updated,
                                 or at the point of creation the creation date. Typically, this date value will be
                                 machine generated at time of creation or modification. Ideally, this field will be
                                 managed by the editing tool or service used to make modifications when storing the
                                 modified document.</p>
                              <p>The intent of the last modified timestamp is to distinguish between significant change
                                 milestones when the document may be accessed by multiple entities. This allows a given
                                 entity to differentiate between mutiple document states at specific points in time.
                                 It is possible to make multiple modifications to the document without storing these
                                 changes. In such a case, the last modified timestamp might not be updated until the
                                 document is finally stored.</p>
                              <p>In some cases, an OSCAL document may be derived from some source material in a different
                                 format. In such a case, the <code>last-modified</code> value should indicate the last modification time of the OSCAL document instance,
                                 not the source material.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/last-modified">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/version" class="toc2 name">version</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/version">Switch to JSON</a></div>
                     <p class="formal-name">Document Version</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A version may be a release number, sequence number, date, or other identifier sufficient
                                 to distinguish between different document revisions.</p>
                              <p>While not required, it is recommended that OSCAL content authors use <a href="https://semver.org/spec/v2.0.0.html">Semantic Versioning</a> as the version format. This allows for the easy identification of a version tree
                                 consisting of major, minor, and patch numbers.</p>
                              <p>A version is typically set by the document owner or by the tool used to maintain the
                                 content.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/version">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/oscal-version" class="toc2 name">oscal-version</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/oscal-version">Switch to JSON</a></div>
                     <p class="formal-name">OSCAL Version</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Indicates the version of the OSCAL model to which the document conforms, for example
                                 <q>1.1.0</q> or <q>1.0.0-milestone1</q>. That can be used as a hint for a tool indicating which version of the OSCAL XML
                                 or JSON schema to use for validation.</p>
                              <p>The OSCAL version serves a different purpose from the document version and is used
                                 to represent a different concept. If both have the same value, this is coincidental.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/oscal-version">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/revisions/revision" class="toc2 name">revision</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions">Switch to JSON</a></div>
                     <p class="formal-name">Revision History Entry</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> An entry in a sequential list of revisions to the containing document, expected to
                        be in reverse chronological order (i.e. latest first).</p>
                     <p><span class="usa-tag">wrapper element</span> <code class="name">revisions</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>While <code>published</code>, <code>last-modified</code>, and <code>oscal-version</code> are not required, values for these entries should be provided if the information
                                 is known. A <code>link</code> with a <code>rel</code> of <q>source</q> should be provided if the information is known.</p>
                           </div>
                        </details>
                     </div>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span> for <code class="path">link/@rel</code></p>
                           <p>The value <b>may be locally defined</b>, or one of the following:</p>
                           <ul>
                              
                              <li><strong>canonical</strong>: The link identifies the authoritative location for this resource. Defined by RFC
                                 6596.</li>
                              
                              <li><strong>alternate</strong>: The link identifies an alternative location or format for this resource. Defined
                                 by the HTML Living Standard</li>
                              
                              <li><strong>predecessor-version</strong>: This link identifies a resource containing the predecessor version in the version
                                 history. Defined by  RFC 5829.</li>
                              
                              <li><strong>successor-version</strong>: This link identifies a resource containing the predecessor version in the version
                                 history. Defined by RFC 5829.</li>
                              
                              <li><strong>version-history</strong>: This link identifies a resource containing the version history of this document.
                                 Defined by RFC 5829.</li>
                              </ul>
                        </div>
                        
                        </details>
                     <details open="open">
                        <summary>Elements (8):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/title" class="toc3 name">title</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/title">Switch to JSON</a></div>
                                 <p class="formal-name">Document Title</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A name given to the document revision, which may be used by a tool for display and
                                    navigation.</p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/published" class="toc3 name">published</h3>
                                 <p class="type"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/published">Switch to JSON</a></div>
                                 <p class="formal-name">Publication Timestamp</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Typically, this date value will be machine-generated at the time the containing document
                                             is published.</p>
                                          <p>In some cases, an OSCAL document may be derived from some source material provided
                                             in a different format. In such a case, the <code>published</code> value should indicate when the OSCAL document instance was last published, not the
                                             source material.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/published">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/last-modified" class="toc3 name">last-modified</h3>
                                 <p class="type"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/last-modified">Switch to JSON</a></div>
                                 <p class="formal-name">Last Modified Timestamp</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>This value represents the point in time when the OSCAL document was last updated,
                                             or at the point of creation the creation date. Typically, this date value will be
                                             machine generated at time of creation or modification. Ideally, this field will be
                                             managed by the editing tool or service used to make modifications when storing the
                                             modified document.</p>
                                          <p>The intent of the last modified timestamp is to distinguish between significant change
                                             milestones when the document may be accessed by multiple entities. This allows a given
                                             entity to differentiate between mutiple document states at specific points in time.
                                             It is possible to make multiple modifications to the document without storing these
                                             changes. In such a case, the last modified timestamp might not be updated until the
                                             document is finally stored.</p>
                                          <p>In some cases, an OSCAL document may be derived from some source material in a different
                                             format. In such a case, the <code>last-modified</code> value should indicate the last modification time of the OSCAL document instance,
                                             not the source material.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/last-modified">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/version" class="toc3 name">version</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/version">Switch to JSON</a></div>
                                 <p class="formal-name">Document Version</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A version may be a release number, sequence number, date, or other identifier sufficient
                                             to distinguish between different document revisions.</p>
                                          <p>While not required, it is recommended that OSCAL content authors use <a href="https://semver.org/spec/v2.0.0.html">Semantic Versioning</a> as the version format. This allows for the easy identification of a version tree
                                             consisting of major, minor, and patch numbers.</p>
                                          <p>A version is typically set by the document owner or by the tool used to maintain the
                                             content.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/version">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/oscal-version" class="toc3 name">oscal-version</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/oscal-version">Switch to JSON</a></div>
                                 <p class="formal-name">OSCAL Version</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Indicates the version of the OSCAL model to which the document conforms, for example
                                             <q>1.1.0</q> or <q>1.0.0-milestone1</q>. That can be used as a hint for a tool indicating which version of the OSCAL XML
                                             or JSON schema to use for validation.</p>
                                          <p>The OSCAL version serves a different purpose from the document version and is used
                                             to represent a different concept. If both have the same value, this is coincidental.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/oscal-version">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/revisions/revision/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/revisions/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/document-id" class="toc2 name">document-id</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/document-ids">Switch to JSON</a></div>
                     <p class="formal-name">Document Identifier</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A document identifier provides a <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with a <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that is used for a group of documents that are to be treated as different versions,
                                 representations or digital surrogates of the same document.</p>
                              <p>A document identifier provides an additional data point for identifying a document
                                 that can be assigned by a publisher or organization for purposes in a wider system,
                                 such as a digital object identifier (DOI) or a local content management system identifier.</p>
                              <p>Use of a document identifier allows for document creators to associate sets of documents
                                 that are related in some way by the same <code>document-id</code>.</p>
                              <p>An OSCAL document always has an implicit document identifier provided by the document's
                                 UUID, defined by the <code>uuid</code> on the top-level object. Having a default UUID-based identifier ensures all documents
                                 can be minimally identified when other document identifiers are not provided.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/document-id">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/role" class="toc2 name">role</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles">Switch to JSON</a></div>
                     <p class="formal-name">Role</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Defines a function, which might be assigned to a party in a specific situation.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Permissible values to be determined closer to the application (e.g. by a receiving
                                 authority).</p>
                              <p>OSCAL has defined a set of standardized roles for consistent use in OSCAL documents.
                                 This allows tools consuming OSCAL content to infer specific semantics when these roles
                                 are used. These roles are documented in the specific contexts of their use (e.g.,
                                 responsible-party, responsible-role). When using such a role, it is necessary to define
                                 these roles in this list, which will then allow such a role to be referenced.</p>
                           </div>
                        </details>
                     </div>
                     <details open="open">
                        <summary>Attribute (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/role/id" class="toc3 name">id</h3>
                                 <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles/id">Switch to JSON</a></div>
                                 <p class="formal-name">Role Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A unique identifier for the role.</p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (6):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/role/title" class="toc3 name">title</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles/title">Switch to JSON</a></div>
                                 <p class="formal-name">Role Title</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A name given to the role, which may be used by a tool for display and navigation.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/role/short-name" class="toc3 name">short-name</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles/short-name">Switch to JSON</a></div>
                                 <p class="formal-name">Role Short Name</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A short common name, abbreviation, or acronym for the role.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/role/description" class="toc3 name">description</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles/description">Switch to JSON</a></div>
                                 <p class="formal-name">Role Description</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A summary of the role's purpose and associated responsibilities.</p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/role/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/role/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/role/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/roles/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/location" class="toc2 name">location</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations">Switch to JSON</a></div>
                     <p class="formal-name">Location</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A physical point of presence, which may be associated with people, organizations,
                        or other concepts within the current or linked OSCAL document.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>An address might be sensitive in nature. In such cases a title, mailing address, email-address,
                                 and/or phone number may be used instead.</p>
                           </div>
                        </details>
                     </div>
                     <details>
                        <summary>Constraints (5)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed value</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal')]/@name</code></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>type</strong>: Characterizes the kind of location.</li>
                              </ul>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed value</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal') and @name='type']/@value</code></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>data-center</strong>: A location that contains computing assets. A class can be used to indicate the sub-type
                                 of data-center as primary or alternate.</li>
                              </ul>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal') and @name='type' and @value='data-center']/@class</code></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>primary</strong>: The location is a data-center used for normal operations.</li>
                              
                              <li><strong>alternate</strong>: The location is a data-center used for fail-over or backup operations.</li>
                              </ul>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">has cardinality</span> for <code class="path">address</code> the cardinality of  <code>address</code> is constrained: <b>1</b>; maximum <b>unbounded</b>.</p>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">has cardinality</span> for <code class="path">title|address|email-address|telephone-number</code> the cardinality of  <code>title|address|email-address|telephone-number</code> is constrained: <b>1</b>; maximum <b>unbounded</b>.</p>
                        </div>
                        </details>
                     <details open="open">
                        <summary>Attribute (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/uuid" class="toc3 name">uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Location Universally Unique Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A unique ID for the location, for reference.</p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (8):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/title" class="toc3 name">title</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/title">Switch to JSON</a></div>
                                 <p class="formal-name">Location Title</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A name given to the location, which may be used by a tool for display and navigation.</p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/address" class="toc3 name">address</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/address">Switch to JSON</a></div>
                                 <p class="formal-name">Address</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The physical address of the location, which will provided for physical locations.
                                             Virtual locations can omit this data item.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/address">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/email-address" class="toc3 name">email-address</h3>
                                 <p class="type"><a href="/reference/datatypes/#email">email</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/email-addresses">Switch to JSON</a></div>
                                 <p class="formal-name">Email Address</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A contact email associated with the location.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/email-address">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/telephone-number" class="toc3 name">telephone-number</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/telephone-numbers">Switch to JSON</a></div>
                                 <p class="formal-name">Telephone Number</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A phone number used to contact the location.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/telephone-number">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/url" class="toc3 name">url</h3>
                                 <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/urls">Switch to JSON</a></div>
                                 <p class="formal-name">Location URL</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> The uniform resource locator (URL) for a web site or other resource associated with
                                    the location.</p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>This data field is deprecated in favor of using a link with an appropriate relationship.</p>
                                       </div>
                                    </details>
                                 </div>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/location/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/locations/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/party" class="toc2 name">party</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties">Switch to JSON</a></div>
                     <p class="formal-name">Party</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> An organization or person, which may be associated with roles or other concepts within
                        the current or linked OSCAL document.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A party can be optionally associated with either an address or a location. While providing
                                 a meaningful location for a party is desired, there are some cases where it might
                                 not be possible to provide an exact location or even any location.</p>
                           </div>
                        </details>
                     </div>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal')]/@name</code></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>mail-stop</strong>: A mail stop associated with the party.</li>
                              
                              <li><strong>office</strong>: The name or number of the party's office.</li>
                              
                              <li><strong>job-title</strong>: The formal job title of a person.</li>
                              </ul>
                        </div>
                        </details>
                     <details open="open">
                        <summary>Attributes (2):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/uuid" class="toc3 name">uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Party Universally Unique Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A unique identifier for the party.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/type" class="toc3 name">type</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/type">Switch to JSON</a></div>
                                 <p class="formal-name">Party Type</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A category describing the kind of party the object describes.</p>
                                 <details>
                                    <summary>Constraint (1)</summary>
                                    
                                    <div class="constraint">
                                       <p><span class="usa-tag">allowed values</span></p>
                                       <p>The value <b>must</b> be one of the following:</p>
                                       <ul>
                                          
                                          <li><strong>person</strong>: A human being regarded as an individual.</li>
                                          
                                          <li><strong>organization</strong>: An organized group of one or more person individuals with a specific purpose.</li>
                                          </ul>
                                    </div>
                                    </details>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (10):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/name" class="toc3 name">name</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/name">Switch to JSON</a></div>
                                 <p class="formal-name">Party Name</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> The full name of the party. This is typically the legal name associated with the
                                    party.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/short-name" class="toc3 name">short-name</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/short-name">Switch to JSON</a></div>
                                 <p class="formal-name">Party Short Name</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A short common name, abbreviation, or acronym for the party.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/external-id" class="toc3 name">external-id</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/external-ids">Switch to JSON</a></div>
                                 <p class="formal-name">Party External Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> An identifier for a person or organization using a designated scheme. e.g. an Open
                                    Researcher and Contributor ID (ORCID).</p>
                                 <details open="open">
                                    <summary>Attribute (1):</summary>
                                    <div class="model field-model">
                                       <div class="model-entry definition define-flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-metadata/metadata/party/external-id/scheme" class="toc4 name">scheme</h4>
                                             <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/external-ids/scheme">Switch to JSON</a></div>
                                             <p class="formal-name">External Identifier Schema</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> Indicates the type of external identifier.</p>
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>This value must be an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that serves as a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#use-as-a-naming-system-identifier">naming system identifier</a>.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <details>
                                                <summary>Constraint (1)</summary>
                                                
                                                <div class="constraint">
                                                   <p><span class="usa-tag">allowed value</span></p>
                                                   <p>The value <b>may be locally defined</b>, or the following:</p>
                                                   <ul>
                                                      
                                                      <li><strong>http://orcid.org/</strong>: The identifier is Open Researcher and Contributor ID (ORCID).</li>
                                                      </ul>
                                                </div>
                                                </details>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/email-address" class="toc3 name">email-address</h3>
                                 <p class="type"><a href="/reference/datatypes/#email">email</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/email-addresses">Switch to JSON</a></div>
                                 <p class="formal-name">Email Address</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>This is a contact email associated with the party.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/email-address">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/telephone-number" class="toc3 name">telephone-number</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/telephone-numbers">Switch to JSON</a></div>
                                 <p class="formal-name">Telephone Number</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>A phone number used to contact the party.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/telephone-number">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/address" class="toc3 name">address</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/addresses">Switch to JSON</a></div>
                                 <p class="formal-name">Address</p>
                              </div>
                              <div class="body">
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/address">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/location-uuid" class="toc3 name">location-uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/location-uuids">Switch to JSON</a></div>
                                 <p class="formal-name">Location Universally Unique Identifier Reference</p>
                              </div>
                              <div class="body">
                                 <p class="definition-link"><a href="#/field/oscal-metadata/location-uuid">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/member-of-organization" class="toc3 name">member-of-organization</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/member-of-organizations">Switch to JSON</a></div>
                                 <p class="formal-name">Organizational Affiliation</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A reference to another <code>party</code> by UUID, typically an organization, that this subject is associated with.</p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Since the reference target of an organizational affiliation must be another <code>party</code> (whether further qualified as person or organization) as inidcated by its <code>uuid</code>. As a <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a> identifier with uniqueness across document and trans-document scope, this <code>uuid</code> value is sufficient to reference the data item locally or globally across related
                                             documents, e.g., in an imported OSCAL instance. </p>
                                          <p>Parties of both the <code>person</code> or <code>organization</code> type can be associated with an organization using the <code>member-of-organization</code>.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <details>
                                    <summary>Constraint (1)</summary>
                                    
                                    
                                    <div class="constraint">
                                       <p><span class="usa-tag">index has key</span>this value must correspond to a listing in the index <code>index-metadata-party-organizations-uuid</code> using a key constructed of key field(s) <code>.</code></p>
                                    </div>
                                    </details>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-metadata/metadata/party/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/parties/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/responsible-party" class="toc2 name">responsible-party</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/responsible-parties">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Party</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-party</code> requires one or more <code>party-uuid</code> references creating a strong relationship arc between the referenced <code>role-id</code> and the reference parties. This differs in semantics from <code>responsible-role</code> which doesn't require that a <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-party">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/action" class="toc2 name">action</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/actions">Switch to JSON</a></div>
                     <p class="formal-name">Action</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/action">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/metadata/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/metadata/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/network-architecture" class="toc1 name">network-architecture</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/network-architecture">Switch to JSON</a></div>
         <p class="formal-name">Network Architecture</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A description of the system's network architecture, optionally supplemented by diagrams
            that illustrate the network architecture.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">diagram</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/network-architecture/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/network-architecture/description">Switch to JSON</a></div>
                     <p class="formal-name">Network Architecture Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the system's network architecture.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/network-architecture/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/network-architecture/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/network-architecture/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/network-architecture/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/network-architecture/diagram" class="toc2 name">diagram</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/network-architecture/diagrams">Switch to JSON</a></div>
                     <p class="formal-name">Diagram</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A diagram must include a <code>link</code> with a rel value of "diagram", who's href references a remote URI or an internal
                                 reference within this document containing the diagram.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/diagram">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/network-architecture/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/network-architecture/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/oscal-version" class="toc1 name">oscal-version</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/oscal-version">Switch to JSON</a></div>
         <p class="formal-name">OSCAL Version</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The OSCAL model version the document was authored against and will conform to as
            valid.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Indicates the version of the OSCAL model to which the document conforms, for example
                     <q>1.1.0</q> or <q>1.0.0-milestone1</q>. That can be used as a hint for a tool indicating which version of the OSCAL XML
                     or JSON schema to use for validation.</p>
                  <p>The OSCAL version serves a different purpose from the document version and is used
                     to represent a different concept. If both have the same value, this is coincidental.</p>
               </div>
            </details>
         </div>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-control-common/parameter" class="toc1 name">param</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter">Switch to JSON</a></div>
         <p class="formal-name">Parameter</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
         <p><span class="usa-tag">use name</span> <code class="name">param</code></p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>In a catalog, a parameter is typically used as a placeholder for the future assignment
                     of a parameter value, although the OSCAL model allows for the direct assignment of
                     a value if desired by the control author. The <code>value</code> may be optionally used to specify one or more values. If no value is provided, then
                     it is expected that the value will be provided at the Profile or Implementation layer.</p>
                  <p>A parameter can include a variety of metadata options that support the future solicitation
                     of one or more values. A <code>label</code> provides a textual placeholder that can be used in a tool to solicit parameter value
                     input, or to display in catalog documentation. The <code>desc</code> provides a short description of what the parameter is used for, which can be used
                     in tooling to help a user understand how to use the parameter. A <code>constraint</code> can be used to provide criteria for the allowed values. A <code>guideline</code> provides a recommendation for the use of a parameter.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (2)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal')]/@name</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>label</strong>: A human-readable label for the parent context, which may be rendered in place of
                     the actual identifier for some use cases.</li>
                  
                  <li><strong>sort-id</strong>: An alternative identifier, whose value is easily sortable among other such values
                     in the document.</li>
                  
                  <li><strong>alt-identifier</strong>: An alternate or aliased identifier for the parent context.</li>
                  
                  
                  <li><strong>alt-label</strong>: An alternate to the value provided by the parameter's label. This will typically
                     be qualified by a class.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/rmf')]/@name</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>aggregates</strong>: The parent parameter provides an
                     aggregation of two or more other parameters, each described
                     by this property.</li>
                  </ul>
            </div>
            
            depends-on is deprecated
            
            </details>
         <details open="open">
            <summary>Attributes (3):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/id" class="toc2 name">id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/id">Switch to JSON</a></div>
                     <p class="formal-name">Parameter Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A unique identifier for the parameter.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/class" class="toc2 name">class</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/class">Switch to JSON</a></div>
                     <p class="formal-name">Parameter Class</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A textual label that provides a characterization of the type, purpose, use or scope
                        of the parameter.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/depends-on" class="toc2 name">depends-on</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/depends-on">Switch to JSON</a></div>
                     <p class="formal-name">Depends on</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> <strong>(deprecated)</strong> Another parameter invoking this one. This construct has been deprecated and should
                        not be used.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (8):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/label" class="toc2 name">label</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/label">Switch to JSON</a></div>
                     <p class="formal-name">Parameter Label</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A short, placeholder name for the parameter, which can be used as a substitute for
                        a <code>value</code> if no value is assigned.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The label value is intended use when rendering a parameter in generated documentation
                                 or a user interface when a parameter is referenced. Note that labels are not required
                                 to be distinctive, which means that parameters within the same control may have the
                                 same label.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/usage" class="toc2 name">usage</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/usage">Switch to JSON</a></div>
                     <p class="formal-name">Parameter Usage Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Describes the purpose and use of a parameter.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/constraint" class="toc2 name">constraint</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/constraints">Switch to JSON</a></div>
                     <p class="formal-name">Constraint</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">constraint</code></p>
                     <p class="definition-link"><a href="#/assembly/oscal-control-common/parameter-constraint">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/guideline" class="toc2 name">guideline</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/guidelines">Switch to JSON</a></div>
                     <p class="formal-name">Guideline</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">guideline</code></p>
                     <p class="definition-link"><a href="#/assembly/oscal-control-common/parameter-guideline">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/value" class="toc2 name">value</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/values">Switch to JSON</a></div>
                     <p class="formal-name">Parameter Value</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">value</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A set of values provided in a catalog can be redefined in OSCAL's <code>profile</code> or <code>system-security-plan</code> models.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-control-common/parameter-value">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/select" class="toc2 name">select</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/select">Switch to JSON</a></div>
                     <p class="formal-name">Selection</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">select</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                           </div>
                           <div class="remarks">
                              <p>The OSCAL parameter <code>value</code> construct can be used to prescribe a specific parameter value in a catalog or profile.
                                 In cases where a prescriptive value is not possible in a catalog or profile, it may
                                 be possible to constrain the set of possible values to a few options. Use of <code>select</code> in a parameter instead of <code>value</code> is a way of defining value options that <strong>may</strong> be set.</p>
                              <p>A set of allowed parameter values expressed as a set of options which may be selected.
                                 These options constrain the permissible values that may be selected for the containing
                                 parameter. When the value assignment is made, such as in an OSCAL profile or system
                                 security plan, the actual selected value can be examined to determine if it matches
                                 one of the permissible choices for the parameter value.</p>
                              <p>When the value of <code>how-many</code> is set to "one-or-more", multiple values may be assigned reflecting more than one
                                 choice.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-control-common/parameter-selection">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-implementation-common/param-id" class="toc1 name">param-id</h1>
         <p class="type"><a href="/reference/datatypes/#token">token</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-implementation-common/param-id">Switch to JSON</a></div>
         <p class="formal-name">Parameter ID</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#human-oriented">human-oriented</a> reference to a <code>parameter</code> within a control, who's catalog has been imported into the current implementation
            context.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-control-common/parameter-constraint" class="toc1 name">parameter-constraint</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-constraint">Switch to JSON</a></div>
         <p class="formal-name">Constraint</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A formal or informal expression of a constraint or test.</p>
         <details open="open">
            <summary>Elements (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter-constraint/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-constraint/description">Switch to JSON</a></div>
                     <p class="formal-name">Constraint Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A textual summary of the constraint to be applied.</p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter-constraint/test" class="toc2 name">test</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-constraint/tests">Switch to JSON</a></div>
                     <p class="formal-name">Constraint Test</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A test expression which is expected to be evaluated by a tool.</p>
                     <details open="open">
                        <summary>Elements (2):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-control-common/parameter-constraint/test/expression" class="toc3 name">expression</h3>
                                 <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-constraint/tests/expression">Switch to JSON</a></div>
                                 <p class="formal-name">Constraint test</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A formal (executable) expression of a constraint.</p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-control-common/parameter-constraint/test/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-constraint/tests/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-control-common/parameter-guideline" class="toc1 name">parameter-guideline</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-guideline">Switch to JSON</a></div>
         <p class="formal-name">Guideline</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A prose statement that provides a recommendation for the use of a parameter.</p>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter-guideline/prose" class="toc2 name">(unwrapped)</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-guideline/prose">Switch to JSON</a></div>
                     <p class="formal-name">Guideline Text</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Prose permits multiple paragraphs, lists, tables etc.</p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-control-common/parameter-selection" class="toc1 name">parameter-selection</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-selection">Switch to JSON</a></div>
         <p class="formal-name">Selection</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Presenting a choice among alternatives.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
               </div>
            </details>
         </div>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter-selection/how-many" class="toc2 name">how-many</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-selection/how-many">Switch to JSON</a></div>
                     <p class="formal-name">Parameter Cardinality</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Describes the number of selections that must occur. Without this setting, only one
                        value should be assumed to be permitted.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>one</strong>: Only one value is permitted.</li>
                              
                              <li><strong>one-or-more</strong>: One or more values are permitted.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/parameter-selection/choice" class="toc2 name">choice</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/parameter-selection/choice">Switch to JSON</a></div>
                     <p class="formal-name">Choice</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A value selection among several such options.</p>
                     <p><span class="usa-tag">use name</span> <code class="name">choice</code></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-control-common/parameter-value" class="toc1 name">parameter-value</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-control-common/parameter-value">Switch to JSON</a></div>
         <p class="formal-name">Parameter Value</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A parameter value or set of values.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-control-common/part" class="toc1 name">part</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part">Switch to JSON</a></div>
         <p class="formal-name">Part</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> An annotated, markup-based textual element of a control's or catalog group's definition,
            or a child of another part.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                     (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                     hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                  <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows references to this part from within a catalog, or within an instance
                     of another OSCAL model that has a need to reference the part. Examples of where part
                     referencing is used in OSCAL include:</p>
                  <ul>
                     
                     <li>Referencing a part by id to tailor (make modifications to) a control statement in
                        a profile.</li>
                     
                     <li>Referencing a control statement represented by a part in a system security plan implemented-requirement
                        where a statement-level response is desired.</li>
                     </ul>
                  <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                     <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                     Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                     Each organization is responsible for governance of their own extensions, and is strongly
                     encouraged to publish their extensions as standards to their user community. If no
                     <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                  <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                     DNS or other globally defined organization name should be used. For example, if FedRAMP
                     and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> <code>http://fedramp.gov/ns/oscal</code>, while DoD might use the <code>ns</code> <code>https://defense.gov</code> for any organization specific <code>name</code>.</p>
                  <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                     extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                     extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[has-oscal-namespace('http://csrc.nist.gov/ns/oscal')]/@name</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>label</strong>: A human-readable label for the parent context, which may be rendered in place of
                     the actual identifier for some use cases.</li>
                  
                  <li><strong>sort-id</strong>: An alternative identifier, whose value is easily sortable among other such values
                     in the document.</li>
                  
                  <li><strong>alt-identifier</strong>: An alternate or aliased identifier for the parent context.</li>
                  
                  </ul>
            </div>
            </details>
         <details open="open">
            <summary>Attributes (4):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/id" class="toc2 name">id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/id">Switch to JSON</a></div>
                     <p class="formal-name">Part Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A unique identifier for the part.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>While a part is not required to have an id, it is often desirable for an identifier
                                 to be provided, which allows the part to be referenced elsewhere in OSCAL document
                                 instances. For this reason, it is RECOMMENDED to provide a part identifier.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/name" class="toc2 name">name</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/name">Switch to JSON</a></div>
                     <p class="formal-name">Part Name</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A textual label that uniquely identifies the part's semantic type, which exists in
                        a value space qualified by the <code>ns</code>.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/ns" class="toc2 name">ns</h2>
                     <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/ns">Switch to JSON</a></div>
                     <p class="formal-name">Part Namespace</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> An optional namespace qualifying the part's <code>name</code>. This allows different organizations to associate distinct semantics with the same
                        name.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This value must be an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that serves as a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#use-as-a-naming-system-identifier">naming system identifier</a>.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/class" class="toc2 name">class</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/class">Switch to JSON</a></div>
                     <p class="formal-name">Part Class</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> An optional textual providing a sub-type or characterization of the part's <code>name</code>, or a category to which the part belongs.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>One use of this flag is to distinguish or discriminate between the semantics of multiple
                                 parts of the same control with the same <code>name</code> and <code>ns</code> (since even within a given namespace it can be useful to overload a name).</p>
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                              <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                                 content.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/title" class="toc2 name">title</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/title">Switch to JSON</a></div>
                     <p class="formal-name">Part Title</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> An optional name given to the part, which may be used by a tool for display and navigation.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/prose" class="toc2 name">(unwrapped)</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/prose">Switch to JSON</a></div>
                     <p class="formal-name">Part Text</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Permits multiple paragraphs, lists, tables etc.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/part" class="toc2 name">part</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/parts">Switch to JSON</a></div>
                     <p class="formal-name">Part</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                                 (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                                 hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                              <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows references to this part from within a catalog, or within an instance
                                 of another OSCAL model that has a need to reference the part. Examples of where part
                                 referencing is used in OSCAL include:</p>
                              <ul>
                                 
                                 <li>Referencing a part by id to tailor (make modifications to) a control statement in
                                    a profile.</li>
                                 
                                 <li>Referencing a control statement represented by a part in a system security plan implemented-requirement
                                    where a statement-level response is desired.</li>
                                 </ul>
                              <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                                 <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                                 Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                                 Each organization is responsible for governance of their own extensions, and is strongly
                                 encouraged to publish their extensions as standards to their user community. If no
                                 <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                              <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                                 DNS or other globally defined organization name should be used. For example, if FedRAMP
                                 and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> <code>http://fedramp.gov/ns/oscal</code>, while DoD might use the <code>ns</code> <code>https://defense.gov</code> for any organization specific <code>name</code>.</p>
                              <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                                 extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                                 extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-control-common/part">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-control-common/part/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-control-common/part/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/party-uuid" class="toc1 name">party-uuid</h1>
         <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/party-uuid">Switch to JSON</a></div>
         <p class="formal-name">Party Universally Unique Identifier Reference</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Reference to a party by UUID.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span>this value must correspond to a listing in the index <code>index-metadata-party-uuid</code> using a key constructed of key field(s) <code>.</code></p>
            </div>
            </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/port-range" class="toc1 name">port-range</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/port-range">Switch to JSON</a></div>
         <p class="formal-name">Port Range</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Where applicable this is the IPv4 port range on which the service operates.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>To be validated as a natural number (integer &gt;= 1). A single port uses the same value
                     for start and end. Use multiple 'port-range' entries for non-contiguous ranges.</p>
               </div>
            </details>
         </div>
         <details open="open">
            <summary>Attributes (3):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/port-range/start" class="toc2 name">start</h2>
                     <p class="type"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/port-range/start">Switch to JSON</a></div>
                     <p class="formal-name">Start</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Indicates the starting port number in a port range</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Should be a number within a permitted range</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/port-range/end" class="toc2 name">end</h2>
                     <p class="type"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/port-range/end">Switch to JSON</a></div>
                     <p class="formal-name">End</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Indicates the ending port number in a port range</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Should be a number within a permitted range</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/port-range/transport" class="toc2 name">transport</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/port-range/transport">Switch to JSON</a></div>
                     <p class="formal-name">Transport</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Indicates the transport type.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>TCP</strong>: Transmission Control Protocol</li>
                              
                              <li><strong>UDP</strong>: User Datagram Protocol</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/property" class="toc1 name">prop</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property">Switch to JSON</a></div>
         <p class="formal-name">Property</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> An attribute, characteristic, or quality of the containing object expressed as a
            namespace qualified name/value pair.</p>
         <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Properties permit the deployment and management of arbitrary controlled values, within
                     OSCAL objects. A property can be included for any purpose useful to an application
                     or implementation. Typically, properties will be used to sort, filter, select, order,
                     and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                     an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                     lexical composition of properties may be constrained by external processes to ensure
                     consistency.</p>
                  <p>Property allows for associated remarks that describe why the specific property value
                     was applied to the containing object, or the significance of the value in the context
                     of the containing object.</p>
               </div>
            </details>
         </div>
         <details open="open">
            <summary>Attributes (6):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/property/name" class="toc2 name">name</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property/name">Switch to JSON</a></div>
                     <p class="formal-name">Property Name</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A textual label, within a namespace, that uniquely identifies a specific attribute,
                        characteristic, or quality of the property's containing object.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed value</span></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              
                              <li><strong>marking</strong>: A label or descriptor that is tied to a sensitivity or classification marking system.
                                 An optional class can be used to define the specific marking system used for the associated
                                 value.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/property/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Property Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A unique identifier for a property.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/property/ns" class="toc2 name">ns</h2>
                     <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property/ns">Switch to JSON</a></div>
                     <p class="formal-name">Property Namespace</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This value must be an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that serves as a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#use-as-a-naming-system-identifier">naming system identifier</a>.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/property/value" class="toc2 name">value</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property/value">Switch to JSON</a></div>
                     <p class="formal-name">Property Value</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/property/class" class="toc2 name">class</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property/class">Switch to JSON</a></div>
                     <p class="formal-name">Property Class</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A textual label that provides a sub-type or characterization of the property's <code>name</code>.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This can be used to further distinguish or discriminate between the semantics of multiple
                                 properties of the same object with the same <code>name</code> and <code>ns</code>, or to group properties into categories.</p>
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value. It is available for grouping, but unlike <code>group</code> is not expected specifically to designate any group membership as such.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/property/group" class="toc2 name">group</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property/group">Switch to JSON</a></div>
                     <p class="formal-name">Property Group</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> An identifier for relating distinct sets of properties.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Different sets of properties may relate to separate contexts. Declare a group on a
                                 property to associate it with one or more other properties in a given context.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/property/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/property/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/protocol" class="toc1 name">protocol</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/protocol">Switch to JSON</a></div>
         <p class="formal-name">Service Protocol Information</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Information about the protocol used to provide a service.</p>
         <details open="open">
            <summary>Attributes (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/protocol/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/protocol/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Service Protocol Information Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this service protocol information elsewhere in
                        <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#scope">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>service protocol</code> can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/protocol/name" class="toc2 name">name</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/protocol/name">Switch to JSON</a></div>
                     <p class="formal-name">Protocol Name</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The common name of the protocol, which should be the appropriate "service name" from
                        the <a href="https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml">IANA Service Name and Transport Protocol Port Number Registry</a>. </p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The short name of the protocol (e.g., https).</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/protocol/title" class="toc2 name">title</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/protocol/title">Switch to JSON</a></div>
                     <p class="formal-name">Protocol Title</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A human readable name for the protocol (e.g., Transport Layer Security).</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/protocol/port-range" class="toc2 name">port-range</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/protocol/port-ranges">Switch to JSON</a></div>
                     <p class="formal-name">Port Range</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To be validated as a natural number (integer &gt;= 1). A single port uses the same value
                                 for start and end. Use multiple 'port-range' entries for non-contiguous ranges.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/port-range">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-ssp/provided-uuid" class="toc1 name">provided-uuid</h1>
         <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-ssp/provided-uuid">Switch to JSON</a></div>
         <p class="formal-name">Provided UUID</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a> identifier reference to an inherited control implementation that a leveraging system
            is inheriting from a leveraged system.</p>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/published" class="toc1 name">published</h1>
         <p class="type"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/published">Switch to JSON</a></div>
         <p class="formal-name">Publication Timestamp</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The date and time the document was last made available.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Typically, this date value will be machine-generated at the time the containing document
                     is published.</p>
                  <p>In some cases, an OSCAL document may be derived from some source material provided
                     in a different format. In such a case, the <code>published</code> value should indicate when the OSCAL document instance was last published, not the
                     source material.</p>
               </div>
            </details>
         </div>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/remarks" class="toc1 name">remarks</h1>
         <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/remarks">Switch to JSON</a></div>
         <p class="formal-name">Remarks</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Additional commentary about the containing object.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                     by OSCAL.</p>
               </div>
            </details>
         </div>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-ssp/responsibility-uuid" class="toc1 name">responsibility-uuid</h1>
         <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-ssp/responsibility-uuid">Switch to JSON</a></div>
         <p class="formal-name">Responsibility UUID</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a> identifier reference to a control implementation that satisfies a responsibility
            imposed by a leveraged system.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/responsible-party" class="toc1 name">responsible-party</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-party">Switch to JSON</a></div>
         <p class="formal-name">Responsible Party</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A reference to a set of persons and/or organizations that have responsibility for
            performing the referenced role in the context of the containing object.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>A <code>responsible-party</code> requires one or more <code>party-uuid</code> references creating a strong relationship arc between the referenced <code>role-id</code> and the reference parties. This differs in semantics from <code>responsible-role</code> which doesn't require that a <code>party-uuid</code> is referenced.</p>
                  <p>The scope of use of this object determines if the responsibility has been performed
                     or will be performed in the future. The containing object will describe the intent.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span>this value must correspond to a listing in the index <code>index-metadata-role-id</code> using a key constructed of key field(s) <code>@role-id</code></p>
            </div>
            </details>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-party/role-id" class="toc2 name">role-id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-party/role-id">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Role</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A reference to a <code>role</code> performed by a <code>party</code>.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (4):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-party/party-uuid" class="toc2 name">party-uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-party/party-uuids">Switch to JSON</a></div>
                     <p class="formal-name">Party Universally Unique Identifier Reference</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Specifies one or more parties responsible for performing the associated <code>role</code>.</p>
                     <p class="definition-link"><a href="#/field/oscal-metadata/party-uuid">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-party/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-party/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-party/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-party/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-party/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-party/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-metadata/responsible-role" class="toc1 name">responsible-role</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-role">Switch to JSON</a></div>
         <p class="formal-name">Responsible Role</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A reference to a role with responsibility for performing a function relative to the
            containing object, optionally associated with a set of persons and/or organizations
            that perform that role.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                  <p>The scope of use of this object determines if the responsibility has been performed
                     or will be performed in the future. The containing object will describe the intent.</p>
               </div>
            </details>
         </div>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-role/role-id" class="toc2 name">role-id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-role/role-id">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Role ID</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#human-oriented">human-oriented</a> identifier reference to a <code>role</code> performed.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (4):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-role/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-role/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-role/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-role/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-role/party-uuid" class="toc2 name">party-uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-role/party-uuids">Switch to JSON</a></div>
                     <p class="formal-name">Party Universally Unique Identifier Reference</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Specifies zero or more parties responsible for performing the associated <code>role</code>.</p>
                     <p class="definition-link"><a href="#/field/oscal-metadata/party-uuid">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-metadata/responsible-role/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-metadata/responsible-role/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/role-id" class="toc1 name">role-id</h1>
         <p class="type"><a href="/reference/datatypes/#token">token</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/role-id">Switch to JSON</a></div>
         <p class="formal-name">Role Identifier Reference</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Reference to a role by UUID.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span>this value must correspond to a listing in the index <code>index-metadata-role-id</code> using a key constructed of key field(s) <code>.</code></p>
            </div>
            </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/security-impact-level" class="toc1 name">security-impact-level</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/security-impact-level">Switch to JSON</a></div>
         <p class="formal-name">Security Impact Level</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The overall level of expected impact resulting from unauthorized disclosure, modification,
            or loss of access to information.</p>
         <details open="open">
            <summary>Elements (3):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/security-impact-level/security-objective-confidentiality" class="toc2 name">security-objective-confidentiality</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/security-impact-level/security-objective-confidentiality">Switch to JSON</a></div>
                     <p class="formal-name">Security Objective: Confidentiality</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A target-level of confidentiality for the system, based on the sensitivity of information
                        within the system.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/security-impact-level/security-objective-integrity" class="toc2 name">security-objective-integrity</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/security-impact-level/security-objective-integrity">Switch to JSON</a></div>
                     <p class="formal-name">Security Objective: Integrity</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A target-level of integrity for the system, based on the sensitivity of information
                        within the system.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/security-impact-level/security-objective-availability" class="toc2 name">security-objective-availability</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/security-impact-level/security-objective-availability">Switch to JSON</a></div>
                     <p class="formal-name">Security Objective: Availability</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A target-level of availability for the system, based on the sensitivity of information
                        within the system.</p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-ssp/selected" class="toc1 name">selected</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-ssp/selected">Switch to JSON</a></div>
         <p class="formal-name">Selected Level (Confidentiality, Integrity, or Availability)</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> The selected (Confidentiality, Integrity, or Availability) security impact level.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/set-parameter" class="toc1 name">set-parameter</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/set-parameter">Switch to JSON</a></div>
         <p class="formal-name">Set Parameter Value</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Identifies the parameter that will be set by the enclosed value.</p>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/set-parameter/param-id" class="toc2 name">param-id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/set-parameter/param-id">Switch to JSON</a></div>
                     <p class="formal-name">Parameter ID</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/flag/oscal-implementation-common/param-id">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/set-parameter/value" class="toc2 name">value</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/set-parameter/values">Switch to JSON</a></div>
                     <p class="formal-name">Parameter Value</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A parameter value or set of values.</p>
                     <p><span class="usa-tag">use name</span> <code class="name">value</code></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/set-parameter/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/set-parameter/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/statement" class="toc1 name">statement</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement">Switch to JSON</a></div>
         <p class="formal-name">Specific Control Statement</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Identifies which statements within a control are addressed.</p>
         <details>
            <summary>Constraints (3)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">responsible-role/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>asset-owner</strong>: Accountable for ensuring the asset is managed in accordance with organizational
                     policies and procedures.</li>
                  
                  <li><strong>asset-administrator</strong>: Responsible for administering a set of assets.</li>
                  
                  
                  <li><strong>security-operations</strong>: Members of the security operations center (SOC).</li>
                  
                  
                  <li><strong>network-operations</strong>: Members of the network operations center (NOC).</li>
                  
                  <li><strong>incident-response</strong>: Responsible for responding to an event that could lead to loss of, or disruption
                     to, an organization's operations, services or functions.</li>
                  
                  <li><strong>help-desk</strong>: Responsible for providing information and support to users.</li>
                  
                  
                  <li><strong>configuration-management</strong>: Responsible for the configuration management processes governing changes to the
                     asset.</li>
                  
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">responsible-role</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">by-component</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            </details>
         <details open="open">
            <summary>Attributes (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/statement/statement-id" class="toc2 name">statement-id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement/statement-id">Switch to JSON</a></div>
                     <p class="formal-name">Control Statement Reference</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A reference to the specific implemented statement associated with a control.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/flag/oscal-implementation-common/statement-id">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/statement/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Control Statement Reference Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this control statement elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The <em>UUID</em> of the <code>control statement</code> in the source OSCAL instance is sufficient to reference the data item locally or
                        globally (e.g., in an imported OSCAL instance).</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (5):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/statement/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/statement/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/statement/responsible-role" class="toc2 name">responsible-role</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement/responsible-roles">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Role</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/statement/by-component" class="toc2 name">by-component</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement/by-components">Switch to JSON</a></div>
                     <p class="formal-name">Component Control Implementation</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Use of <code>set-parameter</code> in this context, sets the parameter for the control referenced in the containing
                                 <code>implemented-requirement</code> applied to the referenced component. If the <code>by-component</code> is used as a child of a <code>statement</code>, then the parameter value also applies only in the context of the referenced statement.
                                 If the same parameter is also set in the <code>control-implementation</code> or a specific <code>implemented-requirement</code>, then this <code>by-component/set-parameter</code> value will override the other value(s) in the context of the referenced component,
                                 control, and statement (if parent).</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/by-component">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/statement/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/statement/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-implementation-common/statement-id" class="toc1 name">statement-id</h1>
         <p class="type"><a href="/reference/datatypes/#token">token</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-implementation-common/statement-id">Switch to JSON</a></div>
         <p class="formal-name">Control Statement Reference</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#human-oriented">human-oriented</a> identifier reference to a <code>control statement</code>.</p>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/status" class="toc1 name">status</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/status">Switch to JSON</a></div>
         <p class="formal-name">Status</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Describes the operational status of the system.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>If 'other' is selected, a remark must be included to describe the current state.</p>
               </div>
            </details>
         </div>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/status/state" class="toc2 name">state</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/status/state">Switch to JSON</a></div>
                     <p class="formal-name">State</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The current operating status.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>operational</strong>: The system is currently operating in production.</li>
                              
                              <li><strong>under-development</strong>: The system is being designed, developed, or implemented</li>
                              
                              <li><strong>under-major-modification</strong>: The system is undergoing a major change, development, or transition.</li>
                              
                              <li><strong>disposition</strong>: The system is no longer operational.</li>
                              
                              <li><strong>other</strong>: Some other state.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/status/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/status/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/system-characteristics" class="toc1 name">system-characteristics</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics">Switch to JSON</a></div>
         <p class="formal-name">System Characteristics</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Contains the characteristics of the system, such as its name, purpose, and security
            impact level.</p>
         <details>
            <summary>Constraints (7)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>identity-assurance-level</strong>: A value of 1, 2, or 3 as defined by SP 800-63-3.
                     </li>
                  
                  <li><strong>authenticator-assurance-level</strong>: A value of 1, 2, or 3 as defined by SP 800-63-3.
                     </li>
                  
                  <li><strong>federation-assurance-level</strong>: A value of 1, 2, or 3 as defined by SP 800-63-3.
                     </li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name=('identity-assurance-level','authenticator-assurance-level','federation-assurance-level')]/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>1</strong>: As defined by SP 800-63-3.
                     </li>
                  
                  <li><strong>2</strong>: As defined by SP 800-63-3.
                     </li>
                  
                  <li><strong>3</strong>: As defined by SP 800-63-3.
                     </li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>cloud-deployment-model</strong>: The associated value is one of: public-cloud, private-cloud, community-cloud, government-only-cloud,
                     hybrid-cloud, or other.</li>
                  
                  <li><strong>cloud-service-model</strong>: The associated value is one of: saas, paas, iaas, or other.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='cloud-deployment-model']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>public-cloud</strong>: The public cloud deployment model as defined by The NIST Definition of Cloud Computing.
                     </li>
                  
                  <li><strong>private-cloud</strong>: The private cloud deployment model as defined by The NIST Definition of Cloud Computing.
                     </li>
                  
                  <li><strong>community-cloud</strong>: The community cloud deployment model as defined by The NIST Definition of Cloud
                     Computing.
                     </li>
                  
                  
                  <li><strong>government-only-cloud</strong>: A specific type of community-cloud for use only by government services.</li>
                  
                  <li><strong>other</strong>: Any other type of cloud deployment model that is exclusive to the other choices.</li>
                  The hybrid cloud deployment model, as defined by The NIST Definition of Cloud Computing,
                  can be supported by selecting two or more of the existing deployment models.
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='cloud-service-model']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>saas</strong>: Software as a service (SaaS) cloud service model as defined by The NIST Definition
                     of Cloud Computing.
                     </li>
                  
                  <li><strong>paas</strong>: Platform as a service (PaaS) cloud service model as defined by The NIST Definition
                     of Cloud Computing.
                     </li>
                  
                  <li><strong>iaas</strong>: Infrastructure as a service (IaaS) cloud service model as defined by The NIST Definition
                     of Cloud Computing.
                     </li>
                  
                  <li><strong>other</strong>: Any other type of cloud service model that is exclusive to the other choices.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">responsible-party</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">responsible-party/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>authorizing-official</strong>: The authorizing official for this system.</li>
                  
                  <li><strong>authorizing-official-poc</strong>: The authorizing official's designated point of contact (POC) for this system.</li>
                  
                  <li><strong>system-owner</strong>: The executive ultimately accountable for the system.</li>
                  
                  <li><strong>system-poc-management</strong>: The primary management-level point of contact (POC) for the system.</li>
                  
                  <li><strong>system-poc-technical</strong>: The primary technical point of contact (POC) for the system.</li>
                  
                  <li><strong>system-poc-other</strong>: Other point of contact (POC) for the system that is not the management or technical
                     POC.</li>
                  
                  <li><strong>information-system-security-officer</strong>: The primary role responsible for ensuring the organization operates the system securely.</li>
                  
                  <li><strong>privacy-poc</strong>: The point of contact (POC) responsible for identifying privacy information within
                     the system, and ensuring its protection if present.</li>
                  
                  </ul>
            </div>
            </details>
         <details open="open">
            <summary>Elements (16):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/system-id" class="toc2 name">system-id</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/system-ids">Switch to JSON</a></div>
                     <p class="formal-name">System Identification</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-implementation-common/system-id">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/system-name" class="toc2 name">system-name</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/system-name">Switch to JSON</a></div>
                     <p class="formal-name">System Name - Full</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The full name of the system.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/system-name-short" class="toc2 name">system-name-short</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/system-name-short">Switch to JSON</a></div>
                     <p class="formal-name">System Name - Short</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A short name for the system, such as an acronym, that is suitable for display in
                        a data table or summary list.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Since <code>system-name-short</code> is optional, if the <code>system-name-short</code> is not provided, the <code>system-name</code> can be used as a substitute.</p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/description">Switch to JSON</a></div>
                     <p class="formal-name">System Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the system.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/date-authorized" class="toc2 name">date-authorized</h2>
                     <p class="type"><a href="/reference/datatypes/#date">date</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/date-authorized">Switch to JSON</a></div>
                     <p class="formal-name">System Authorization Date</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-ssp/date-authorized">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/security-sensitivity-level" class="toc2 name">security-sensitivity-level</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/security-sensitivity-level">Switch to JSON</a></div>
                     <p class="formal-name">Security Sensitivity Level</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> The overall information system sensitivity categorization, such as defined by <a href="https://doi.org/10.6028/NIST.FIPS.199">FIPS-199</a>.</p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Often, organizations require the security sensitivity level to correspond with the
                                 highest confidentiality, integrity, or availability level identified by <code>security-impact-level</code>. </p>
                           </div>
                        </details>
                     </div>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/system-information" class="toc2 name">system-information</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/system-information">Switch to JSON</a></div>
                     <p class="formal-name">System Information</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/system-information">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/security-impact-level" class="toc2 name">security-impact-level</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/security-impact-level">Switch to JSON</a></div>
                     <p class="formal-name">Security Impact Level</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/security-impact-level">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/status" class="toc2 name">status</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/status">Switch to JSON</a></div>
                     <p class="formal-name">Status</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>If 'other' is selected, a remark must be included to describe the current state.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/status">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/authorization-boundary" class="toc2 name">authorization-boundary</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/authorization-boundary">Switch to JSON</a></div>
                     <p class="formal-name">Authorization Boundary</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/authorization-boundary">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/network-architecture" class="toc2 name">network-architecture</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/network-architecture">Switch to JSON</a></div>
                     <p class="formal-name">Network Architecture</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/network-architecture">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/data-flow" class="toc2 name">data-flow</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/data-flow">Switch to JSON</a></div>
                     <p class="formal-name">Data Flow</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/data-flow">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/responsible-party" class="toc2 name">responsible-party</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/responsible-parties">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Party</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-party</code> requires one or more <code>party-uuid</code> references creating a strong relationship arc between the referenced <code>role-id</code> and the reference parties. This differs in semantics from <code>responsible-role</code> which doesn't require that a <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-party">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-characteristics/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-characteristics/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/system-component" class="toc1 name">system-component</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component">Switch to JSON</a></div>
         <p class="formal-name">Component</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A defined component that can be part of an implemented system.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Components may be products, services, application programming interface (APIs), policies,
                     processes, plans, guidance, standards, or other tangible items that enable security
                     and/or privacy.</p>
                  <p>The <code>type</code> indicates which of these component types is represented.</p>
                  <p>When defining a <code>service</code> component where are relationship to other components is known, one or more <code>link</code> entries with rel values of provided-by and used-by can be used to link to the specific
                     component identifier(s) that provide and use the service respectively.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (24)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  
                  <li><strong>implementation-point</strong>: Relative placement of component ('internal' or 'external') to the system.</li>
                  
                  <li><strong>leveraged-authorization-uuid</strong>: UUID of the related leveraged-authorization assembly in this SSP.</li>
                  
                  <li><strong>inherited-uuid</strong>: UUID of the component as it was assigned in the leveraged system's SSP.</li>
                  
                  
                  
                  
                  
                  
                  
                  <li><strong>asset-type</strong>: Simple indication of the asset's function, such as Router, Storage Array, DNS Server.</li>
                  
                  <li><strong>asset-id</strong>: An organizationally specific identifier that is used to uniquely identify a logical
                     or tangible item by the organization that owns the item.</li>
                  
                  <li><strong>asset-tag</strong>: An asset tag assigned by the organization responsible for maintaining the logical
                     or tangible item.</li>
                  
                  <li><strong>public</strong>: Identifies whether the asset is publicly accessible (yes/no)</li>
                  
                  <li><strong>virtual</strong>: Identifies whether the asset is virtualized (yes/no)</li>
                  
                  <li><strong>vlan-id</strong>: Virtual LAN identifier of the asset.</li>
                  
                  <li><strong>network-id</strong>: The network identifier of the asset.</li>
                  
                  <li><strong>label</strong>: A human-readable label for the parent context.</li>
                  
                  <li><strong>sort-id</strong>: An alternative identifier, whose value is easily sortable among other such values
                     in the document.</li>
                  
                  <li><strong>baseline-configuration-name</strong>: The name of the baseline configuration for the asset.</li>
                  
                  <li><strong>allows-authenticated-scan</strong>: Can the asset be check with an authenticated scan? (yes/no)</li>
                  
                  <li><strong>function</strong>: The function provided by the asset for the system.</li>
                  
                  
                  
                  
                  <li><strong>version</strong>: The version of the component.</li>
                  
                  <li><strong>patch-level</strong>: The specific patch level of the component.</li>
                  
                  <li><strong>model</strong>: The model of the component.</li>
                  
                  
                  <li><strong>release-date</strong>: The date the component was released, such as a software release date or policy publication
                     date.</li>
                  
                  <li><strong>validation-type</strong>: Used with component-type='validation' to provide a well-known name for a kind of
                     validation.</li>
                  
                  <li><strong>validation-reference</strong>: Used with component-type='validation' to indicate the validating body's assigned
                     identifier for their validation of this component.</li>
                  
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">link/@rel</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  
                  
                  
                  
                  <li><strong>depends-on</strong>: A reference to another component that this component has a dependency on.</li>
                  
                  
                  <li><strong>validation</strong>: A reference to another component of component-type=validation, that is a validation
                     (e.g., FIPS 140-2) for this component</li>
                  
                  <li><strong>proof-of-compliance</strong>: A pointer to a validation record (e.g., FIPS 140-2) or other compliance information.</li>
                  
                  
                  <li><strong>baseline-template</strong>: A reference to the baseline template used to configure the asset.</li>
                  
                  <li><strong>uses-service</strong>: This service is used by the referenced component identifier.</li>
                  
                  <li><strong>system-security-plan</strong>: A link to the system security plan of the external system.</li>
                  
                  
                  <li><strong>uses-network</strong>: This component uses the network provided by the identified network component.</li>
                  
                  <li><strong>imported-from</strong>: The hyperlink identifies a URI pointing to the component in a component-definition
                     that originally defined the component.</li>
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">responsible-role/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  
                  
                  
                  <li><strong>asset-owner</strong>: Accountable for ensuring the asset is managed in accordance with organizational
                     policies and procedures.</li>
                  
                  <li><strong>asset-administrator</strong>: Responsible for administering a set of assets.</li>
                  
                  
                  <li><strong>security-operations</strong>: Members of the security operations center (SOC).</li>
                  
                  
                  <li><strong>network-operations</strong>: Members of the network operations center (NOC).</li>
                  
                  <li><strong>incident-response</strong>: Responsible for responding to an event that could lead to loss of, or disruption
                     to, an organization's operations, services or functions.</li>
                  
                  <li><strong>help-desk</strong>: Responsible for providing information and support to users.</li>
                  
                  
                  <li><strong>configuration-management</strong>: Responsible for the configuration management processes governing changes to the
                     asset.</li>
                  
                  
                  <li><strong>maintainer</strong>: Responsible for the creation and maintenance of a component.</li>
                  
                  <li><strong>provider</strong>: Organization responsible for providing the component, if this is different from
                     the "maintainer" (e.g., a reseller).</li>
                  
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='asset-type']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  
                  
                  <li><strong>operating-system</strong>: System software that manages computer hardware, software resources, and provides
                     common services for computer programs.</li>
                  
                  <li><strong>database</strong>: An electronic collection of data, or information, that is specially organized for
                     rapid search and retrieval.</li>
                  
                  <li><strong>web-server</strong>: A system that delivers content or services to end users over the Internet or an
                     intranet.</li>
                  
                  <li><strong>dns-server</strong>: A system that resolves domain names to internet protocol (IP) addresses.</li>
                  
                  <li><strong>email-server</strong>: A computer system that sends and receives electronic mail messages.</li>
                  
                  <li><strong>directory-server</strong>: A  system that stores, organizes and provides access to directory information in
                     order to unify network resources.</li>
                  
                  <li><strong>pbx</strong>: A private branch exchange (PBX) provides a a private telephone switchboard.</li>
                  
                  <li><strong>firewall</strong>: A network security system that monitors and controls incoming and outgoing network
                     traffic based on predetermined security rules.</li>
                  
                  <li><strong>router</strong>: A physical or virtual networking device that forwards data packets between computer
                     networks.</li>
                  
                  <li><strong>switch</strong>: A physical or virtual networking device that connects devices within a computer
                     network by using packet switching to receive and forward data to the destination device.</li>
                  
                  <li><strong>storage-array</strong>: A consolidated, block-level data storage capability.</li>
                  
                  <li><strong>appliance</strong>: A physical or virtual machine that centralizes hardware, software, or services for
                     a specific purpose.</li>
                  
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='allows-authenticated-scan']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>yes</strong>: The component allows an authenticated scan.</li>
                  
                  <li><strong>no</strong>: The component does not allow an authenticated scan.</li>
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='public']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>yes</strong>: The component is publicly accessible.</li>
                  
                  <li><strong>no</strong>: The component is not publicly accessible.</li>
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='virtual']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>yes</strong>: The component is virtualized.</li>
                  
                  <li><strong>no</strong>: The component is not virtualized.</li>
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='implementation-point']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>internal</strong>: The component is implemented within the system boundary.</li>
                  
                  <li><strong>external</strong>: The component is implemented outside the system boundary.</li>
                  </ul>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">prop[@name='physical-location']</code>this value must correspond to a listing in the index <code>index-metadata-location-uuid</code> using a key constructed of key field(s) <code>@value</code></p>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">prop[@name='inherited-uuid']/@value</code>: the target value must match the lexical form of the 'uuid' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">prop[@name='release-date']/@value</code>: the target value must match the lexical form of the 'date' data type.</p>
            </div>
            
            
            
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">(.)[@type=('software', 'hardware', 'service')]/prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>vendor-name</strong>: The name of the company or organization </li>
                  </ul>
            </div>
            
            
            
            
            
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">(.)[@type='validation']/link/@rel</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>validation-details</strong>: A link to an online information provided by the authorizing body.</li>
                  </ul>
            </div>
            
            
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">(.)[@type='software']/prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>software-identifier</strong>: If a "software" component-type, the identifier, such as a SWID tag, for the software
                     component.</li>
                  
                  </ul>
            </div>
            
            
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">(.)[@type='service']/link/@rel</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>provided-by</strong>: This service is provided by the referenced component identifier.</li>
                  
                  
                  <li><strong>used-by</strong>: This service is used by the referenced component identifier.</li>
                  
                  </ul>
            </div>
            
            
            
            
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">(.)[@type='interconnection']/prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>isa-title</strong>: Title of the Interconnection Security Agreement (ISA).</li>
                  
                  <li><strong>isa-date</strong>: Date of the Interconnection Security Agreement (ISA).</li>
                  
                  <li><strong>isa-remote-system-name</strong>: The name of the remote interconnected system.</li>
                  
                  <li><strong>ipv4-address</strong>: An Internet Protocol Version 4 interconnection address</li>
                  
                  <li><strong>ipv6-address</strong>: An Internet Protocol Version 6 interconnection address</li>
                  
                  <li><strong>direction</strong>: An Internet Protocol Version 6 interconnection address</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name=('ipv4-address','ipv6-address')]/@class</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>local</strong>: The identified IP address is for this system.</li>
                  
                  <li><strong>remote</strong>: The identified IP address is for the remote system to which this system is connected.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">(.)[@type='interconnection']/link/@rel</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  
                  <li><strong>isa-agreement</strong>: A link to the system interconnection agreement.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">(.)[@type='interconnection']/responsible-role/@role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>isa-poc-local</strong>: Interconnection Security Agreement (ISA) point of contact (POC) for this system.</li>
                  
                  <li><strong>isa-poc-remote</strong>: Interconnection Security Agreement (ISA) point of contact (POC) for the remote interconnected
                     system.</li>
                  
                  <li><strong>isa-authorizing-official-local</strong>: Interconnection Security Agreement (ISA) authorizing official for this system.</li>
                  
                  <li><strong>isa-authorizing-official-remote</strong>: Interconnection Security Agreement (ISA) authorizing official for the remote interconnected
                     system.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">prop[@name='isa-date']/@value</code>: the target value must match the lexical form of the 'dateTime' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">prop[@name='ipv4-address']/@value</code>: the target value must match the lexical form of the 'ip-v4-address' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">prop[@name='ipv6-address']/@value</code>: the target value must match the lexical form of the 'ip-v6-address' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='direction']/@value</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>incoming</strong>: Data from the remote system flows into this system.</li>
                  
                  <li><strong>outgoing</strong>: Data from this system flows to the remote system.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">responsible-role</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Attributes (2):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/uuid">Switch to JSON</a></div>
                     <p class="formal-name">Component Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this component elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#scope">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>component</code> can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
               <div class="model-entry definition flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/type" class="toc2 name">type</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/type">Switch to JSON</a></div>
                     <p class="formal-name">Component Type</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">type</code></p>
                     <p class="definition-link"><a href="#/flag/oscal-implementation-common/system-component-type">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (9):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/title" class="toc2 name">title</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/title">Switch to JSON</a></div>
                     <p class="formal-name">Component Title</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A human readable name for the system component.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/description">Switch to JSON</a></div>
                     <p class="formal-name">Component Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A description of the component, including information about its function.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/purpose" class="toc2 name">purpose</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/purpose">Switch to JSON</a></div>
                     <p class="formal-name">Purpose</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the technological or business purpose of the component.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/status" class="toc2 name">status</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/status">Switch to JSON</a></div>
                     <p class="formal-name">Status</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Describes the operational status of the system component.</p>
                     <details open="open">
                        <summary>Attribute (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-implementation-common/system-component/status/state" class="toc3 name">state</h3>
                                 <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/status/state">Switch to JSON</a></div>
                                 <p class="formal-name">State</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> The operational status.</p>
                                 <details>
                                    <summary>Constraint (1)</summary>
                                    
                                    <div class="constraint">
                                       <p><span class="usa-tag">allowed values</span></p>
                                       <p>The value <b>must</b> be one of the following:</p>
                                       <ul>
                                          
                                          <li><strong>under-development</strong>: The component is being designed, developed, or implemented.</li>
                                          
                                          <li><strong>operational</strong>: The component is currently operational and is available for use in the system.</li>
                                          
                                          <li><strong>disposition</strong>: The component is no longer operational.</li>
                                          
                                          <li><strong>other</strong>: Some other state.</li>
                                          </ul>
                                    </div>
                                    </details>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-implementation-common/system-component/status/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/status/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/responsible-role" class="toc2 name">responsible-role</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/responsible-roles">Switch to JSON</a></div>
                     <p class="formal-name">Responsible Role</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A <code>responsible-role</code> allows zero or more <code>party-uuid</code> references, each of which creates a relationship arc between the referenced <code>role-id</code> and the referenced party. This differs in semantics from <code>responsible-party</code>, which requires that at least one <code>party-uuid</code> is referenced.</p>
                              <p>The scope of use of this object determines if the responsibility has been performed
                                 or will be performed in the future. The containing object will describe the intent.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/responsible-role">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/protocol" class="toc2 name">protocol</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/protocols">Switch to JSON</a></div>
                     <p class="formal-name">Service Protocol Information</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Used for <code>service</code> components to define the protocols supported by the service.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/protocol">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-component/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-component/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-flag">
      <div class="definition-header">
         <h1 id="/flag/oscal-implementation-common/system-component-type" class="toc1 name">system-component-type</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/flag/oscal-implementation-common/system-component-type">Switch to JSON</a></div>
         <p class="formal-name">Component Type</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A category describing the purpose of the component.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>this-system</strong>: The system as a whole.</li>
                  
                  <li><strong>system</strong>: An external system, which may be a leveraged system or the other side of an interconnection.</li>
                  
                  <li><strong>interconnection</strong>: A connection to something outside this system.</li>
                  
                  <li><strong>software</strong>: Any software, operating system, or firmware.</li>
                  
                  <li><strong>hardware</strong>: A physical device.</li>
                  
                  <li><strong>service</strong>: A service that may provide APIs.</li>
                  
                  <li><strong>policy</strong>: An enforceable policy.</li>
                  
                  <li><strong>physical</strong>: A tangible asset used to provide physical protections or countermeasures.</li>
                  
                  
                  <li><strong>process-procedure</strong>: A list of steps or actions to take to achieve some end result.</li>
                  
                  <li><strong>plan</strong>: An applicable plan.</li>
                  
                  <li><strong>guidance</strong>: Any guideline or recommendation.</li>
                  
                  <li><strong>standard</strong>: Any organizational or industry standard.</li>
                  
                  <li><strong>validation</strong>: An external assessment performed on some other component, that has been validated
                     by a third-party.</li>
                  
                  
                  <li><strong>network</strong>: A physical or virtual network.</li>
                  </ul>
            </div>
            </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-implementation-common/system-id" class="toc1 name">system-id</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-implementation-common/system-id">Switch to JSON</a></div>
         <p class="formal-name">System Identification</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#human-oriented">human-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this system identification property elsewhere
            in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#scope">this or other OSCAL instances</a>. When referencing an externally defined <code>system identification</code>, the <code>system identification</code> must be used in the context of the external / imported OSCAL instance (e.g., uri-reference).
            This string should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same system across revisions
            of the document.</p>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model field-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/field/oscal-implementation-common/system-id/identifier-type" class="toc2 name">identifier-type</h2>
                     <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-implementation-common/system-id/identifier-type">Switch to JSON</a></div>
                     <p class="formal-name">Identification System Type</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Identifies the identification system from which the provided identifier was assigned.
                        </p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>This value must be an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that serves as a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#use-as-a-naming-system-identifier">naming system identifier</a>.</p>
                           </div>
                        </details>
                     </div>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span></p>
                           <p>The value <b>may be locally defined</b>, or one of the following:</p>
                           <ul>
                              
                              <li><strong>https://fedramp.gov</strong>: **deprecated** The identifier was assigned by FedRAMP. This has been deprecated;
                                 use http://fedramp.gov/ns/oscal instead.</li>
                              
                              <li><strong>http://fedramp.gov/ns/oscal</strong>: The identifier was assigned by FedRAMP.</li>
                              
                              <li><strong>https://ietf.org/rfc/rfc4122</strong>: **deprecated** A Universally Unique Identifier (UUID) as defined by RFC4122. This
                                 value has been deprecated; use http://ietf.org/rfc/rfc4122 instead.</li>
                              
                              <li><strong>http://ietf.org/rfc/rfc4122</strong>: A Universally Unique Identifier (UUID) as defined by RFC4122.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/system-implementation" class="toc1 name">system-implementation</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation">Switch to JSON</a></div>
         <p class="formal-name">System Implementation</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Provides information as to how the system is implemented.</p>
         <details>
            <summary>Constraints (13)</summary>
            
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">leveraged-authorization</code> an index <code>index-system-implementation-leveraged-authorization-uuid</code> shall list values returned by targets <code>leveraged-authorization</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">component/prop[@name='leveraged-authorization-uuid']</code>this value must correspond to a listing in the index <code>index-system-implementation-leveraged-authorization-uuid</code> using a key constructed of key field(s) <code>@value</code></p>
            </div>
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">component</code> an index <code>index-system-implementation-component-uuid</code> shall list values returned by targets <code>component</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">component/link[@rel='depends-on']</code>this value must correspond to a listing in the index <code>index-system-implementation-component-uuid</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">component[@type='validation']</code> an index <code>index-system-implementation-component-uuid-validation</code> shall list values returned by targets <code>component[@type='validation']</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">component/link[@rel='validated-by']</code>this value must correspond to a listing in the index <code>index-system-implementation-component-uuid-validation</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">component/link[@rel='proof-of-compliance']</code>this value must correspond to a listing in the index <code>index-system-implementation-component-uuid-validation</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">component[@type='service']</code> an index <code>index-system-implementation-component-uuid-service</code> shall list values returned by targets <code>component[@type='service']</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">component/link[@rel='uses-service']</code>this value must correspond to a listing in the index <code>index-system-implementation-component-uuid-service</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">component[@type='service']</code> an index <code>index-system-implementation-component-uuid-software</code> shall list values returned by targets <code>component[@type='service']</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">component[@type='service']/link[@rel='provided-by']</code>this value must correspond to a listing in the index <code>index-system-implementation-component-uuid-software</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">(component | inventory-item)/prop[@name='allows-authenticated-scan']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>yes</strong>: The component allows an authenticated scan.</li>
                  
                  <li><strong>no</strong>: The component does not allow an authenticated scan.</li>
                  </ul>
            </div>
            
            
            
            
            <div class="constraint">
               <p><span class="usa-tag">is unique</span> for <code class="path">user</code>: any target value must be unique (i.e., occur only once)</p>
            </div>
            </details>
         <details open="open">
            <summary>Elements (7):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-implementation/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-implementation/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization" class="toc2 name">leveraged-authorization</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations">Switch to JSON</a></div>
                     <p class="formal-name">Leveraged Authorization</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A description of another authorized system from which this system inherits capabilities
                        that satisfy security requirements. Another term for this concept is a <em>common control provider</em>.</p>
                     <details>
                        <summary>Constraints (4)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed value</span> for <code class="path">link/@rel</code></p>
                           <p>The value <b>must</b> be one of the following:</p>
                           <ul>
                              
                              <li><strong>system-security-plan</strong>: A reference to the system security plan for the leveraged authorization.</li>
                              </ul>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">matches</span> for <code class="path">link[@rel='system-security-plan']/@href[starts-with(.,'#')]</code>: the target value must match the lexical form of the 'uri-reference' data type.</p>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">index has key</span> for <code class="path">link[@rel='system-security-plan' and starts-with(@href,'#')]</code>this value must correspond to a listing in the index <code>index-back-matter-resource</code> using a key constructed of key field(s) <code>@href</code></p>
                        </div>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">matches</span> for <code class="path">link[@rel='system-security-plan']/@href[not(starts-with(.,'#'))]</code>: the target value must match the lexical form of the 'uri' data type.</p>
                        </div>
                        </details>
                     <details open="open">
                        <summary>Attribute (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/uuid" class="toc3 name">uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations/uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Leveraged Authorization Universally Unique Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope and can be used to reference this leveraged authorization elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>leveraged authorization</code> can be used to reference the data item locally or globally (e.g., in an imported
                                    OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                                    of the document.</p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (6):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/title" class="toc3 name">title</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations/title">Switch to JSON</a></div>
                                 <p class="formal-name">title field</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A human readable name for the leveraged authorization in the context of the system.</p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/party-uuid" class="toc3 name">party-uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations/party-uuid">Switch to JSON</a></div>
                                 <p class="formal-name">party-uuid field</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a> identifier reference to the <code>party</code> that manages the leveraged system.</p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/date-authorized" class="toc3 name">date-authorized</h3>
                                 <p class="type"><a href="/reference/datatypes/#date">date</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations/date-authorized">Switch to JSON</a></div>
                                 <p class="formal-name">System Authorization Date</p>
                              </div>
                              <div class="body">
                                 <p class="definition-link"><a href="#/field/oscal-ssp/date-authorized">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/remarks" class="toc3 name">remarks</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/leveraged-authorizations/remarks">Switch to JSON</a></div>
                                 <p class="formal-name">Remarks</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                             by OSCAL.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-implementation/user" class="toc2 name">user</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/users">Switch to JSON</a></div>
                     <p class="formal-name">System User</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">user</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Permissible values to be determined closer to the application, such as by a receiving
                                 authority.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/system-user">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-implementation/component" class="toc2 name">component</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/components">Switch to JSON</a></div>
                     <p class="formal-name">Component</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">component</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Components may be products, services, application programming interface (APIs), policies,
                                 processes, plans, guidance, standards, or other tangible items that enable security
                                 and/or privacy.</p>
                              <p>The <code>type</code> indicates which of these component types is represented.</p>
                              <p>When defining a <code>service</code> component where are relationship to other components is known, one or more <code>link</code> entries with rel values of provided-by and used-by can be used to link to the specific
                                 component identifier(s) that provide and use the service respectively.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/system-component">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-implementation/inventory-item" class="toc2 name">inventory-item</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/inventory-items">Switch to JSON</a></div>
                     <p class="formal-name">Inventory Item</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>A set of <code>inventory-item</code> entries that represent the managed inventory instances of the system.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/inventory-item">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-implementation/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-implementation/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/system-information" class="toc1 name">system-information</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information">Switch to JSON</a></div>
         <p class="formal-name">System Information</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Contains details about all information types that are stored, processed, or transmitted
            by the system, such as privacy information, and those defined in <a href="https://doi.org/10.6028/NIST.SP.800-60v2r1">NIST SP 800-60</a>.</p>
         <details>
            <summary>Constraints (7)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or the following:</p>
               <ul>
                  
                  <li><strong>privacy-designation</strong>: Is this a privacy sensitive system? yes or no</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='privacy-designation']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>yes</strong>: The system is privacy sensitive.</li>
                  
                  <li><strong>no</strong>: The system is not privacy sensitive.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed value</span> for <code class="path">link/@rel</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>privacy-impact-assessment</strong>: A link to the privacy impact assessment.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">link[@rel='privacy-impact-assessment']/@href[starts-with(.,'#')]</code>: the target value must match the lexical form of the 'uri-reference' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">index has key</span> for <code class="path">link[@rel='privacy-impact-assessment' and starts-with(@href,'#')]</code>this value must correspond to a listing in the index <code>index-back-matter-resource</code> using a key constructed of key field(s) <code>@href</code></p>
            </div>
            
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span> for <code class="path">link[@rel='privacy-impact-assessment']/@href[not(starts-with(.,'#'))]</code>: the target value must match the lexical form of the 'uri' data type.</p>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">information-type/(confidentiality-impact|integrity-impact|availability-impact)/(base|selected)</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>fips-199-low</strong>: A 'low' sensitivity level as defined in FIPS-199.
                     </li>
                  
                  <li><strong>fips-199-moderate</strong>: A 'moderate' sensitivity level as defined in FIPS-199.
                     </li>
                  
                  <li><strong>fips-199-high</strong>: A 'high' sensitivity level as defined in FIPS-199.
                     </li>
                  FIPS-199 taxonomy is provided here as a starting point. We will provide other taxonomies
                  based on community requests.
                  </ul>
            </div>
            </details>
         <details open="open">
            <summary>Elements (3):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-information/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-information/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition define-assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-information/information-type" class="toc2 name">information-type</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types">Switch to JSON</a></div>
                     <p class="formal-name">Information Type</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Contains details about one information type that is stored, processed, or transmitted
                        by the system, such as privacy information, and those defined in <a href="https://doi.org/10.6028/NIST.SP.800-60v2r1">NIST SP 800-60</a>.</p>
                     <details open="open">
                        <summary>Attribute (1):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-flag">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/uuid" class="toc3 name">uuid</h3>
                                 <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/uuid">Switch to JSON</a></div>
                                 <p class="formal-name">Information Type Universally Unique Identifier</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this information type elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>information type</code> can be used to reference the data item locally or globally (e.g., in an imported
                                    OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                                    of the document.</p>
                              </div>
                           </div>
                        </div>
                     </details>
                     <details open="open">
                        <summary>Elements (8):</summary>
                        <div class="model assembly-model">
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/title" class="toc3 name">title</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/title">Switch to JSON</a></div>
                                 <p class="formal-name">title field</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A human readable name for the information type. This title should be meaningful within
                                    the context of the system.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-field">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/description" class="toc3 name">description</h3>
                                 <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                                 <p class="occurrence">[1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/description">Switch to JSON</a></div>
                                 <p class="formal-name">Information Type Description</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A summary of how this information type is used within the system.</p>
                              </div>
                           </div>
                           <div class="model-entry definition define-assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/categorization" class="toc3 name">categorization</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/categorizations">Switch to JSON</a></div>
                                 <p class="formal-name">Information Type Categorization</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> A set of information type identifiers qualified by the given identification <code>system</code> used, such as NIST SP 800-60.</p>
                                 <details open="open">
                                    <summary>Attribute (1):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-flag">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/system-information/information-type/categorization/system" class="toc4 name">system</h4>
                                             <p class="type"><a href="/reference/datatypes/#uri">uri</a></p>
                                             <p class="occurrence">[0 or 1]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/categorizations/system">Switch to JSON</a></div>
                                             <p class="formal-name">Information Type Identification System</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> Specifies the information type identification system used.</p>
                                             <div class="remarks-group usa-prose">
                                                <details open="open">
                                                   <summary class="subhead">Remarks</summary>
                                                   <div class="remarks">
                                                      <p>This value must be an <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#absolute-uri">absolute URI</a> that serves as a <a href="https://pages.nist.gov/OSCAL/concepts/uri-use/#use-as-a-naming-system-identifier">naming system identifier</a>.</p>
                                                   </div>
                                                </details>
                                             </div>
                                             <details>
                                                <summary>Constraint (1)</summary>
                                                
                                                <div class="constraint">
                                                   <p><span class="usa-tag">allowed value</span></p>
                                                   <p>The value <b>may be locally defined</b>, or the following:</p>
                                                   <ul>
                                                      
                                                      <li><strong>http://doi.org/10.6028/NIST.SP.800-60v2r1</strong>: Based on the section identifiers in NIST Special Publication 800-60 Volume II Revision
                                                         1.</li>
                                                      </ul>
                                                </div>
                                                </details>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                                 <details open="open">
                                    <summary>Elements (1):</summary>
                                    <div class="model assembly-model">
                                       <div class="model-entry definition define-field">
                                          <div class="instance-header">
                                             <h4 id="/assembly/oscal-ssp/system-information/information-type/categorization/information-type-id" class="toc4 name">information-type-id</h4>
                                             <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                                             <p class="occurrence">[0 to ∞]</p>
                                             <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/categorizations/information-type-ids">Switch to JSON</a></div>
                                             <p class="formal-name">Information Type Systematized Identifier</p>
                                          </div>
                                          <div class="body">
                                             <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#human-oriented">human-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier qualified by the given identification <code>system</code> used, such as NIST SP 800-60. This identifier has <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope and can be used to reference this system elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. This id should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                                                of the document.</p>
                                          </div>
                                       </div>
                                    </div>
                                 </details>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/prop" class="toc3 name">property</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/props">Switch to JSON</a></div>
                                 <p class="formal-name">Property</p>
                              </div>
                              <div class="body">
                                 <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>Properties permit the deployment and management of arbitrary controlled values, within
                                             OSCAL objects. A property can be included for any purpose useful to an application
                                             or implementation. Typically, properties will be used to sort, filter, select, order,
                                             and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                             an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                             lexical composition of properties may be constrained by external processes to ensure
                                             consistency.</p>
                                          <p>Property allows for associated remarks that describe why the specific property value
                                             was applied to the containing object, or the significance of the value in the context
                                             of the containing object.</p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/link" class="toc3 name">link</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 to ∞]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/links">Switch to JSON</a></div>
                                 <p class="formal-name">Link</p>
                              </div>
                              <div class="body">
                                 <div class="remarks-group usa-prose">
                                    <details open="open">
                                       <summary class="subhead">Remarks</summary>
                                       <div class="remarks">
                                          <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                             a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                          <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                                       </div>
                                    </details>
                                 </div>
                                 <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact" class="toc3 name">confidentiality-impact</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/confidentiality-impact">Switch to JSON</a></div>
                                 <p class="formal-name">Impact Level</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> The expected level of impact resulting from the unauthorized disclosure of the described
                                    information.</p>
                                 <p><span class="usa-tag">use name</span> <code class="name">confidentiality-impact</code></p>
                                 <p class="definition-link"><a href="#/assembly/oscal-ssp/impact">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/integrity-impact" class="toc3 name">integrity-impact</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/integrity-impact">Switch to JSON</a></div>
                                 <p class="formal-name">Impact Level</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> The expected level of impact resulting from the unauthorized modification of the
                                    described information.</p>
                                 <p><span class="usa-tag">use name</span> <code class="name">integrity-impact</code></p>
                                 <p class="definition-link"><a href="#/assembly/oscal-ssp/impact">See definition</a></p>
                              </div>
                           </div>
                           <div class="model-entry definition assembly">
                              <div class="instance-header">
                                 <h3 id="/assembly/oscal-ssp/system-information/information-type/availability-impact" class="toc3 name">availability-impact</h3>
                                 <p class="type">assembly<br class="br" /> </p>
                                 <p class="occurrence">[0 or 1]</p>
                                 <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-information/information-types/availability-impact">Switch to JSON</a></div>
                                 <p class="formal-name">Impact Level</p>
                              </div>
                              <div class="body">
                                 <p class="description"><span class="usa-tag">description</span> The expected level of impact resulting from the disruption of access to or use of
                                    the described information or the information system.</p>
                                 <p><span class="usa-tag">use name</span> <code class="name">availability-impact</code></p>
                                 <p class="definition-link"><a href="#/assembly/oscal-ssp/impact">See definition</a></p>
                              </div>
                           </div>
                        </div>
                     </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-ssp/system-security-plan" class="toc1 name">system-security-plan</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan">Switch to JSON</a></div>
         <p class="formal-name">System Security Plan (SSP)</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A system security plan, such as those described in NIST SP 800-18.</p>
         <p><span class="usa-tag">root name</span> <code class="name">system-security-plan</code></p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">index</span> for <code class="path">control-implementation/implemented-requirement//by-component|doc(system-implementation/leveraged-authorization/link[@rel='system-security-plan']/@href)/system-security-plan/control-implementation/implemented-requirement//by-component</code> an index <code>by-component-uuid</code> shall list values returned by targets <code>control-implementation/implemented-requirement//by-component|doc(system-implementation/leveraged-authorization/link[@rel='system-security-plan']/@href)/system-security-plan/control-implementation/implemented-requirement//by-component</code> using keys constructed of key field(s) <code>@uuid</code></p>
            </div>
            </details>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-security-plan/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan/uuid">Switch to JSON</a></div>
                     <p class="formal-name">System Security Plan Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this system security plan (SSP) elsewhere in
                        <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#ssp-identifiers">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>SSP</code> can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance).This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (6):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-security-plan/metadata" class="toc2 name">metadata</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan/metadata">Switch to JSON</a></div>
                     <p class="formal-name">Document Metadata</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>All OSCAL documents use the same metadata structure, that provides a consistent way
                                 of expressing OSCAL document metadata across all OSCAL models. The metadata section
                                 also includes declarations of individual objects (i.e., roles, location, parties)
                                 that may be referenced within and across linked OSCAL documents.</p>
                              <p>The metadata in an OSCAL document has few required fields, representing only the bare
                                 minimum data needed to differentiate one instance from another. Tools and users creating
                                 OSCAL documents may choose to use any of the optional fields, as well as extension
                                 mechanisms (e.g., properties, links) to go beyond this minimum to suit their use cases.</p>
                              <p>A publisher of OSCAL content can use the <code>published</code>, <code>last-modified</code>, and <code>version</code> fields to establish information about an individual in a sequence of successive revisions
                                 of a given OSCAL-based publication. The metadata for a previous revision can be represented
                                 as a <code>revision</code> within this object. Links may also be provided using the <code>predecessor-version</code> and <code>successor-version</code> link relations to provide for direct access to the related resource. These relations
                                 can be provided as a link child of this object or as <code>link</code> within a given <code>revision</code>.</p>
                              <p>A <code>responsible-party</code> entry in this context refers to roles and parties that have responsibility relative
                                 to the production, review, publication, and use of the containing document.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/metadata">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-security-plan/import-profile" class="toc2 name">import-profile</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan/import-profile">Switch to JSON</a></div>
                     <p class="formal-name">Import Profile</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/import-profile">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-security-plan/system-characteristics" class="toc2 name">system-characteristics</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan/system-characteristics">Switch to JSON</a></div>
                     <p class="formal-name">System Characteristics</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/system-characteristics">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-security-plan/system-implementation" class="toc2 name">system-implementation</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan/system-implementation">Switch to JSON</a></div>
                     <p class="formal-name">System Implementation</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/system-implementation">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-security-plan/control-implementation" class="toc2 name">control-implementation</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan/control-implementation">Switch to JSON</a></div>
                     <p class="formal-name">Control Implementation</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Use of <code>set-parameter</code> in this context, sets the parameter for all controls referenced by any <code>implemented-requirement</code> contained in this context. Any <code>set-parameter</code> defined in a child context will override this value. If not overridden by a child,
                                 this value applies in the child context.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-ssp/control-implementation">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-ssp/system-security-plan/back-matter" class="toc2 name">back-matter</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-ssp/system-security-plan/back-matter">Switch to JSON</a></div>
                     <p class="formal-name">Back matter</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Provides a collection of identified <code>resource</code> objects that can be referenced by a <code>link</code> with a <code>rel</code> value of "reference" and an <code>href</code> value that is a fragment "#" followed by a reference to a reference's <code>uuid</code>. Other specialized link "rel" values also use this pattern when indicated in that
                                 context of use.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/back-matter">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-assembly">
      <div class="definition-header">
         <h1 id="/assembly/oscal-implementation-common/system-user" class="toc1 name">system-user</h1>
         <p class="type">assembly<br class="br" /> </p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user">Switch to JSON</a></div>
         <p class="formal-name">System User</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A type of user that interacts with the system based on an associated role.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>Permissible values to be determined closer to the application, such as by a receiving
                     authority.</p>
               </div>
            </details>
         </div>
         <details>
            <summary>Constraints (4)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop/@name</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>type</strong>: The type of user, such as internal, external, or general-public.</li>
                  
                  <li><strong>privilege-level</strong>: The user's privilege level within the system, such as privileged, non-privileged,
                     no-logical-access.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='type']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>internal</strong>: A user account for a person or entity that is part of the organization who owns
                     or operates the system.</li>
                  
                  <li><strong>external</strong>: A user account for a person or entity that is not part of the organization who owns
                     or operates the system.</li>
                  
                  <li><strong>general-public</strong>: A user of the system considered to be outside </li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">prop[@name='privilege-level']/@value</code></p>
               <p>The value <b>must</b> be one of the following:</p>
               <ul>
                  
                  <li><strong>privileged</strong>: This role has elevated access to the system, such as a group or system administrator.</li>
                  
                  <li><strong>non-privileged</strong>: This role has typical user-level access to the system without elevated access.</li>
                  
                  <li><strong>no-logical-access</strong>: This role has no access to the system, such as a manager who approves access as
                     part of a process.</li>
                  </ul>
            </div>
            
            <div class="constraint">
               <p><span class="usa-tag">allowed values</span> for <code class="path">role-id</code></p>
               <p>The value <b>may be locally defined</b>, or one of the following:</p>
               <ul>
                  
                  <li><strong>asset-owner</strong>: Accountable for ensuring the asset is managed in accordance with organizational
                     policies and procedures.</li>
                  
                  <li><strong>asset-administrator</strong>: Responsible for administering a set of assets.</li>
                  
                  
                  <li><strong>security-operations</strong>: Members of the security operations center (SOC).</li>
                  
                  
                  <li><strong>network-operations</strong>: Members of the network operations center (NOC).</li>
                  
                  <li><strong>incident-response</strong>: Responsible for responding to an event that could lead to loss of, or disruption
                     to, an organization's operations, services or functions.</li>
                  
                  <li><strong>help-desk</strong>: Responsible for providing information and support to users.</li>
                  
                  
                  <li><strong>configuration-management</strong>: Responsible for the configuration management processes governing changes to the
                     asset.</li>
                  
                  </ul>
            </div>
            </details>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/uuid" class="toc2 name">uuid</h2>
                     <p class="type"><a href="/reference/datatypes/#uuid">uuid</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/uuid">Switch to JSON</a></div>
                     <p class="formal-name">User Universally Unique Identifier</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#machine-oriented">machine-oriented</a>, <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#globally-unique">globally unique</a> identifier with <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#cross-instance">cross-instance</a> scope that can be used to reference this user class elsewhere in <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#scope">this or other OSCAL instances</a>. The locally defined <em>UUID</em> of the <code>system user</code> can be used to reference the data item locally or globally (e.g., in an imported
                        OSCAL instance). This UUID should be assigned <a href="https://pages.nist.gov/OSCAL/concepts/identifier-use/#consistency">per-subject</a>, which means it should be consistently used to identify the same subject across revisions
                        of the document.</p>
                  </div>
               </div>
            </div>
         </details>
         <details open="open">
            <summary>Elements (8):</summary>
            <div class="model assembly-model">
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/title" class="toc2 name">title</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-line">markup-line</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/title">Switch to JSON</a></div>
                     <p class="formal-name">User Title</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A name given to the user, which may be used by a tool for display and navigation.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/short-name" class="toc2 name">short-name</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/short-name">Switch to JSON</a></div>
                     <p class="formal-name">User Short Name</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A short common name, abbreviation, or acronym for the user.</p>
                  </div>
               </div>
               <div class="model-entry definition define-field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/description" class="toc2 name">description</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/description">Switch to JSON</a></div>
                     <p class="formal-name">User Description</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> A summary of the user's purpose within the system.</p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/prop" class="toc2 name">property</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/props">Switch to JSON</a></div>
                     <p class="formal-name">Property</p>
                  </div>
                  <div class="body">
                     <p><span class="usa-tag">use name</span> <code class="name">prop</code></p>
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>Properties permit the deployment and management of arbitrary controlled values, within
                                 OSCAL objects. A property can be included for any purpose useful to an application
                                 or implementation. Typically, properties will be used to sort, filter, select, order,
                                 and arrange OSCAL content objects, to relate OSCAL objects to one another, or to associate
                                 an OSCAL object to class hierarchies, taxonomies, or external authorities. Thus, the
                                 lexical composition of properties may be constrained by external processes to ensure
                                 consistency.</p>
                              <p>Property allows for associated remarks that describe why the specific property value
                                 was applied to the containing object, or the significance of the value in the context
                                 of the containing object.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/property">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/link" class="toc2 name">link</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/links">Switch to JSON</a></div>
                     <p class="formal-name">Link</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a href="https://www.w3.org/TR/html401/struct/links.html#edef-LINK">link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/assembly/oscal-metadata/link">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/role-id" class="toc2 name">role-id</h2>
                     <p class="type"><a href="/reference/datatypes/#token">token</a></p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/role-ids">Switch to JSON</a></div>
                     <p class="formal-name">Role Identifier Reference</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/field/oscal-metadata/role-id">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition assembly">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/authorized-privilege" class="toc2 name">authorized-privilege</h2>
                     <p class="type">assembly<br class="br" /> </p>
                     <p class="occurrence">[0 to ∞]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/authorized-privileges">Switch to JSON</a></div>
                     <p class="formal-name">Privilege</p>
                  </div>
                  <div class="body">
                     <p class="definition-link"><a href="#/assembly/oscal-implementation-common/authorized-privilege">See definition</a></p>
                  </div>
               </div>
               <div class="model-entry definition field">
                  <div class="instance-header">
                     <h2 id="/assembly/oscal-implementation-common/system-user/remarks" class="toc2 name">remarks</h2>
                     <p class="type"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/assembly/oscal-implementation-common/system-user/remarks">Switch to JSON</a></div>
                     <p class="formal-name">Remarks</p>
                  </div>
                  <div class="body">
                     <div class="remarks-group usa-prose">
                        <details open="open">
                           <summary class="subhead">Remarks</summary>
                           <div class="remarks">
                              <p>The <code>remarks</code> field SHOULD not be used to store arbitrary data. Instead, a <code>prop</code> or <code>link</code> should be used to annotate or reference any additional data not formally supported
                                 by OSCAL.</p>
                           </div>
                        </details>
                     </div>
                     <p class="definition-link"><a href="#/field/oscal-metadata/remarks">See definition</a></p>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/telephone-number" class="toc1 name">telephone-number</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/telephone-number">Switch to JSON</a></div>
         <p class="formal-name">Telephone Number</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> A telephone service number as defined by <a href="https://www.itu.int/rec/T-REC-E.164-201011-I/en">ITU-T E.164</a>.</p>
         <details>
            <summary>Constraint (1)</summary>
            
            <div class="constraint">
               <p><span class="usa-tag">matches</span>: a target (value) must match the regular expression '^[0-9]{3}[0-9]{1,12}$'.</p>
            </div>
            </details>
         <details open="open">
            <summary>Attribute (1):</summary>
            <div class="model field-model">
               <div class="model-entry definition define-flag">
                  <div class="instance-header">
                     <h2 id="/field/oscal-metadata/telephone-number/type" class="toc2 name">type</h2>
                     <p class="type"><a href="/reference/datatypes/#string">string</a></p>
                     <p class="occurrence">[0 or 1]</p>
                     <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/telephone-number/type">Switch to JSON</a></div>
                     <p class="formal-name">type flag</p>
                  </div>
                  <div class="body">
                     <p class="description"><span class="usa-tag">description</span> Indicates the type of phone number.</p>
                     <details>
                        <summary>Constraint (1)</summary>
                        
                        <div class="constraint">
                           <p><span class="usa-tag">allowed values</span></p>
                           <p>The value <b>may be locally defined</b>, or one of the following:</p>
                           <ul>
                              
                              <li><strong>home</strong>: A home phone number.</li>
                              
                              <li><strong>office</strong>: An office phone number.</li>
                              
                              <li><strong>mobile</strong>: A mobile phone number.</li>
                              </ul>
                        </div>
                        </details>
                  </div>
               </div>
            </div>
         </details>
      </div>
   </div>
   <div class="model-entry definition define-field">
      <div class="definition-header">
         <h1 id="/field/oscal-metadata/version" class="toc1 name">version</h1>
         <p class="type"><a href="/reference/datatypes/#string">string</a></p>
         <div class="crosslink"><a class="usa-button" href="../json-definitions/#/field/oscal-metadata/version">Switch to JSON</a></div>
         <p class="formal-name">Document Version</p>
      </div>
      <div class="body">
         <p class="description"><span class="usa-tag">description</span> Used to distinguish a specific revision of an OSCAL document from other previous
            and future versions.</p>
         <div class="remarks-group usa-prose">
            <details open="open">
               <summary class="subhead">Remarks</summary>
               <div class="remarks">
                  <p>A version may be a release number, sequence number, date, or other identifier sufficient
                     to distinguish between different document revisions.</p>
                  <p>While not required, it is recommended that OSCAL content authors use <a href="https://semver.org/spec/v2.0.0.html">Semantic Versioning</a> as the version format. This allows for the easy identification of a version tree
                     consisting of major, minor, and patch numbers.</p>
                  <p>A version is typically set by the document owner or by the tool used to maintain the
                     content.</p>
               </div>
            </details>
         </div>
      </div>
   </div>
</div>{{< /rawhtml >}}
