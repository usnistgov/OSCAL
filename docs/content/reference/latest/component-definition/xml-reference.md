---
title: "OSCAL Component Definition Model XML Format Reference"
heading: "OSCAL Component Definition Model XML Format Reference"
description: A reference for the OSCAL Component Definition model XML format.
weight: 60
sidenav:
  title: XML Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
aliases:
  - /docs/schemas/oscal-component-xml/
  - /documentation/schema/component/xml-schema/
  - /documentation/schema/implementation-layer/component/xml-schema/
---

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-reference">
   <h2><span class="usa-tag">Schema version:</span> 1.0.0-rc1</h2>
   <section class="xml-element">
      <div class="header">
         <div class="crosslink"><a href="../json-reference/#/component-definition"><button class="schema-link">Switch to JSON</button></a></div>
         <h1 id="/component-definition" class="toc1 head">component-definition</h1>
      </div>
      <p>See <a href="../xml-outline/#/component-definition">/component-definition</a> in the element map.</p>
      <div class="obj-desc">
         <div class="obj-matrix">
            <p class="obj-name">element Component Definition</p>
            <p class="occurrence"><span class="cardinality">[1]</span></p>
            <p>An element </p>
         </div>
         <p class="description">A collection of component descriptions, which may optionally be grouped by capability.</p>
         
         --&gt;      </div>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/component-definition/uuid"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/component-definition/@uuid" class="toc2 head">@uuid</h2>
         </div>
         <p>See <a href="../xml-outline/#/component-definition/@uuid">/component-definition/@uuid</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">attribute Component Definition Universally Unique Identifier</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
            </div>
            <p class="description">A globally unique identifier for this component definition instance. This UUID should
               be changed when this document is revised.</p>
            
            --&gt;      </div>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/component-definition/metadata"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/component-definition/metadata" class="toc2 head">metadata</h2>
         </div>
         <p>See <a href="../xml-outline/#/component-definition/metadata">/component-definition/metadata</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Publication metadata</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An element </p>
            </div>
            <p class="description">Provides information about the publication and availability of the containing document.</p>
            
            --&gt;      
            
            --&gt;      </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/title"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/title">/component-definition/metadata/title</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Document Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
               </div>
               <p class="description">A name given to the document, which may be used by a tool for display and navigation.</p>
               <div class="value" id="">
                  <p>Value: A markup-line </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/published"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/published" class="toc3 head">published</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/published">/component-definition/metadata/published</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Publication Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a></p>
               </div>
               <p class="description">The date and time the document was published. The date-time value must be formatted
                  according to <a>RFC 3339</a> with full time and time zone included.</p>
               <div class="value" id="">
                  <p>Value: A dateTime-with-timezone </p>
               </div>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>This value represents the point in time when the OSCAL document was published. Typically,
                        this date value will be machine generated at the time the containing document is published.</p>
                     <p>In some cases, an OSCAL document may be derived from some source material in a different
                        format. In such a case, the <code>published</code> value should indicate when the OSCAL document was published, not the source material.
                        Where necessary, the publication date of the original source material can be captured
                        as a named property or custom metadata construct.</p>
                     <p>A publisher of OSCAL content can use this data point along with its siblings <code>last-modified</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                        The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/last-modified"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/last-modified" class="toc3 head">last-modified</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/last-modified">/component-definition/metadata/last-modified</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Last Modified Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a></p>
               </div>
               <p class="description">The date and time the document was last modified. The date-time value must be formatted
                  according to <a>RFC 3339</a> with full time and time zone included.</p>
               <div class="value" id="">
                  <p>Value: A dateTime-with-timezone </p>
               </div>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>This value represents the point in time when the OSCAL document was last updated,
                        or at the point of creation the creation date. Typically, this date value will be
                        machine generated at time of creation or modification.</p>
                     <p>In some cases, an OSCAL document may be derived from some source material in a different
                        format. In such a case, the <code>last-modified</code> value should indicate the modification time of the OSCAL document, not the source
                        material.</p>
                     <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                        The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/version"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/version" class="toc3 head">version</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/version">/component-definition/metadata/version</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Document Version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.string">string</a></p>
               </div>
               <p class="description">A string used to distinguish the current version of the document from other previous
                  (and future) versions.</p>
               <div class="value" id="">
                  <p>Value: A string </p>
               </div>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A version string may be a release number, sequence number, date, or other identifier
                        suffcient to distinguish between different document versions. This version is typically
                        set by the document owner or by the tool used to maintain the content.</p>
                     <p>While not required, it is recommended that OSCAL content authors use <a>Semantic Versioning</a> as a format for version strings. This allows for the easy identification of a version
                        tree consisting of major, minor, and patch numbers.</p>
                     <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>last-modified</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                        The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/oscal-version"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/oscal-version" class="toc3 head">oscal-version</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/oscal-version">/component-definition/metadata/oscal-version</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element OSCAL version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.string">string</a></p>
               </div>
               <p class="description">The OSCAL model version the document was authored against.</p>
               <div class="value" id="">
                  <p>Value: A string </p>
               </div>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Indicates the version of the OSCAL model to which this data set conforms, for example
                        <q>1.1.0</q> or <q>1.0.0-M1</q>. That can be used as a hint by a tool to indicate which version of the OSCAL XML
                        or JSON schema to use for validation.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/revisions" class="toc3 head">revisions</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/revisions">/component-definition/metadata/revisions</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/revisions/revision" class="toc4 head">revision</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision">/component-definition/metadata/revisions/revision</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Revision History Entry</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An entry in a sequential list of revisions to the containing document in reverse chronological
                     order (i.e., most recent previous revision first).</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>While <code>published</code>, <code>last-modified</code>, <code>oscal-version</code>, and <code>version</code> are not required, values for these entries should be provided if the information
                           is known. For a revision entry to be considered valid, at least one of the following
                           items must be provided: <code>published</code>, <code>last-modified</code>, <code>version</code>, or a <code>link</code> with a <code>rel</code> of <q>source</q>.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/title"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/title" class="toc5 head">title</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/title">/component-definition/metadata/revisions/revision/title</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Document Title</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A name given to the document revision, which may be used by a tool for display and
                        navigation.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/published"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/published" class="toc5 head">published</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/published">/component-definition/metadata/revisions/revision/published</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Publication Timestamp</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a></p>
                     </div>
                     <p class="description">The date and time the document was published. The date-time value must be formatted
                        according to <a>RFC 3339</a> with full time and time zone included.</p>
                     <div class="value" id="">
                        <p>Value: A dateTime-with-timezone </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>This value represents the point in time when the OSCAL document was published. Typically,
                              this date value will be machine generated at the time the containing document is published.</p>
                           <p>In some cases, an OSCAL document may be derived from some source material in a different
                              format. In such a case, the <code>published</code> value should indicate when the OSCAL document was published, not the source material.
                              Where necessary, the publication date of the original source material can be captured
                              as a named property or custom metadata construct.</p>
                           <p>A publisher of OSCAL content can use this data point along with its siblings <code>last-modified</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                              The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/last-modified"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/last-modified" class="toc5 head">last-modified</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/last-modified">/component-definition/metadata/revisions/revision/last-modified</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Last Modified Timestamp</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a></p>
                     </div>
                     <p class="description">The date and time the document was last modified. The date-time value must be formatted
                        according to <a>RFC 3339</a> with full time and time zone included.</p>
                     <div class="value" id="">
                        <p>Value: A dateTime-with-timezone </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>This value represents the point in time when the OSCAL document was last updated,
                              or at the point of creation the creation date. Typically, this date value will be
                              machine generated at time of creation or modification.</p>
                           <p>In some cases, an OSCAL document may be derived from some source material in a different
                              format. In such a case, the <code>last-modified</code> value should indicate the modification time of the OSCAL document, not the source
                              material.</p>
                           <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>version</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                              The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/version"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/version" class="toc5 head">version</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/version">/component-definition/metadata/revisions/revision/version</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Document Version</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A string used to distinguish the current version of the document from other previous
                        (and future) versions.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A version string may be a release number, sequence number, date, or other identifier
                              suffcient to distinguish between different document versions. This version is typically
                              set by the document owner or by the tool used to maintain the content.</p>
                           <p>While not required, it is recommended that OSCAL content authors use <a>Semantic Versioning</a> as a format for version strings. This allows for the easy identification of a version
                              tree consisting of major, minor, and patch numbers.</p>
                           <p>A publisher of OSCAL content can use this data point along with its siblings <code>published</code> and <code>last-modified</code> to establish a sequence of successive revisions of a given OSCAL-based publication.
                              The metadata for previous revisions can be represented as a <code>revision</code> in this object.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/oscal-version"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/oscal-version" class="toc5 head">oscal-version</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/oscal-version">/component-definition/metadata/revisions/revision/oscal-version</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element OSCAL version</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">The OSCAL model version the document was authored against.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Indicates the version of the OSCAL model to which this data set conforms, for example
                              <q>1.1.0</q> or <q>1.0.0-M1</q>. That can be used as a hint by a tool to indicate which version of the OSCAL XML
                              or JSON schema to use for validation.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/prop">/component-definition/metadata/revisions/revision/prop</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Property</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                        qualified name/value pair. The value of a property is a simple scalar value, which
                        may be expressed as a list of values.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
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
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/prop/@name">/component-definition/metadata/revisions/revision/prop/@name</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/prop/@uuid">/component-definition/metadata/revisions/revision/prop/@uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/prop/@ns">/component-definition/metadata/revisions/revision/prop/@ns</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uri">uri</a></p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated values used in a property. This allows the semantics associated
                                 with a given name/value pair to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/prop/@value">/component-definition/metadata/revisions/revision/prop/@value</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/prop/@class">/component-definition/metadata/revisions/revision/prop/@class</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/prop/remarks">/component-definition/metadata/revisions/revision/prop/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/link">/component-definition/metadata/revisions/revision/link</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A reference to a local or remote resource</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To provide a cryptographic hash for a remote target resource, a local reference to
                              a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                           <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/link/@href">/component-definition/metadata/revisions/revision/link/@href</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                 that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                              <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                 "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                              <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                 resource. A relative URI will be resolved relative to the location of the document
                                 containing the link.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/link/@rel">/component-definition/metadata/revisions/revision/link/@rel</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/link/@media-type">/component-definition/metadata/revisions/revision/link/@media-type</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/metadata/revisions/revision/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/link/text">/component-definition/metadata/revisions/revision/link/text</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                        <div class="value" id="">
                           <p>Value: A markup-line </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/revisions/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/revisions/revision/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/revisions/revision/remarks">/component-definition/metadata/revisions/revision/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/document-ids"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/document-id" class="toc3 head">document-id</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/document-id">/component-definition/metadata/document-id</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Document Identifier</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element of type <a href="link.to.string">string</a></p>
               </div>
               <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                  that are to be treated as different versions of the same document. If this element
                  does not appear, or if the value of this element is empty, the value of "document-id"
                  is equal to the value of the "uuid" flag of the top-level root element.</p>
               <div class="value" id="">
                  <p>Value: A string </p>
               </div>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>This element is optional, but it will always have a valid value, as if it is missing
                        the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
                        allows for document creators to retroactively link an update to the original version,
                        by providing a document-id on the new document that is equal to the uuid of the original
                        document.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/document-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/document-id/@scheme" class="toc4 head">@scheme</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/document-id/@scheme">/component-definition/metadata/document-id/@scheme</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Document Identification Scheme</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                     the value of the element will be interpreted as a string of characters. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/prop">/component-definition/metadata/prop</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Property</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                  qualified name/value pair. The value of a property is a simple scalar value, which
                  may be expressed as a list of values.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
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
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/prop/@name">/component-definition/metadata/prop/@name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/prop/@uuid">/component-definition/metadata/prop/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/prop/@ns">/component-definition/metadata/prop/@ns</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">A namespace qualifying the property's name. This allows different organizations to
                     associate distinct semantics with the same name.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                           names and associated values used in a property. This allows the semantics associated
                           with a given name/value pair to be defined on an organization-by-organization basis.</p>
                        <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                        <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/prop/@value">/component-definition/metadata/prop/@value</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/prop/@class">/component-definition/metadata/prop/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/prop/remarks">/component-definition/metadata/prop/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/link">/component-definition/metadata/link</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Link</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/link/@href">/component-definition/metadata/link/@href</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                        <p>If a local reference using a fragment is used, this will be indicated by a fragment
                           "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                        <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                           resource. A relative URI will be resolved relative to the location of the document
                           containing the link.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/link/@rel">/component-definition/metadata/link/@rel</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/link/@media-type">/component-definition/metadata/link/@media-type</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/link/text">/component-definition/metadata/link/text</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/role" class="toc3 head">role</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/role">/component-definition/metadata/role</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Role</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Permissible values to be determined closer to the application (e.g. by a receiving
                        authority).</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/role/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/role/@id">/component-definition/metadata/role/@id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Role Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A unique identifier for a specific role instance. This identifier's uniqueness is
                     document scoped and is intended to be consistent for the same role across minor revisions
                     of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>OSCAL has defined a set of standardized roles for consistent use in OSCAL documents.
                           This allows tools consuming OSCAL content to infer specific semantics when these roles
                           are used. These roles are documented in the specific contexts of their use (e.g.,
                           responsible-party, responsible-role). When using such a role, it is necessary to define
                           these roles in this list, which will then allow such a role to be referenced.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/role/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/role/title">/component-definition/metadata/role/title</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Role Title</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A name given to the role, which may be used by a tool for display and navigation.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/short-name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/role/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/role/short-name">/component-definition/metadata/role/short-name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Role Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the role.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/role/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/role/description">/component-definition/metadata/role/description</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Role Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">A summary of the role's purpose and associated responsibilities.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/role/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/role/prop">/component-definition/metadata/role/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/prop/@name">/component-definition/metadata/role/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/prop/@uuid">/component-definition/metadata/role/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/prop/@ns">/component-definition/metadata/role/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/prop/@value">/component-definition/metadata/role/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/prop/@class">/component-definition/metadata/role/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/prop/remarks">/component-definition/metadata/role/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/role/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/role/link">/component-definition/metadata/role/link</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/link/@href">/component-definition/metadata/role/link/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/link/@rel">/component-definition/metadata/role/link/@rel</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/link/@media-type">/component-definition/metadata/role/link/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/role/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/role/link/text">/component-definition/metadata/role/link/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/role/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/role/remarks">/component-definition/metadata/role/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/location" class="toc3 head">location</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/location">/component-definition/metadata/location</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Location</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A location, with associated metadata that can be referenced.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/@uuid">/component-definition/metadata/location/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Location Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given location across
                     revisions of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/title">/component-definition/metadata/location/title</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Location Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A name given to the location, which may be used by a tool for display and navigation.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/address"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/address" class="toc4 head">address</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/address">/component-definition/metadata/location/address</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Address</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A postal address for the location.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>Typically, the physical address of the location will be used here. If this information
                           is sensitive, then a mailing address can be used instead.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/address/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/address/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/address/@type">/component-definition/metadata/location/address/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/address/addr-lines"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/address/addr-line" class="toc5 head">addr-line</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/address/addr-line">/component-definition/metadata/location/address/addr-line</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Address line</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A single line of an address.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/address/city"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/address/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/address/city">/component-definition/metadata/location/address/city</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/address/state"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/address/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/address/state">/component-definition/metadata/location/address/state</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/address/postal-code"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/address/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/address/postal-code">/component-definition/metadata/location/address/postal-code</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/address/country"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/address/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/address/country">/component-definition/metadata/location/address/country</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/email-addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/email-address" class="toc4 head">email-address</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/email-address">/component-definition/metadata/location/email-address</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Email Address</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.email">email</a></p>
                  </div>
                  <p class="description">An email address as defined by <a>RFC 5322 Section 3.4.1</a>. </p>
                  <div class="value" id="">
                     <p>Value: An email </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>This is a contact email associated with the location.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/telephone-numbers"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/telephone-number" class="toc4 head">telephone-number</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/telephone-number">/component-definition/metadata/location/telephone-number</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Telephone Number</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Contact number by telephone.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A phone number used to contact the location.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/telephone-numbers/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/telephone-number/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/telephone-number/@type">/component-definition/metadata/location/telephone-number/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/urls"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/url" class="toc4 head">url</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/url">/component-definition/metadata/location/url</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Location URL</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">The uniform resource locator (URL) for a web site or Internet presence associated
                     with the location.</p>
                  <div class="value" id="">
                     <p>Value: An uri </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/prop">/component-definition/metadata/location/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/prop/@name">/component-definition/metadata/location/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/prop/@uuid">/component-definition/metadata/location/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/prop/@ns">/component-definition/metadata/location/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/prop/@value">/component-definition/metadata/location/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/prop/@class">/component-definition/metadata/location/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/prop/remarks">/component-definition/metadata/location/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/link">/component-definition/metadata/location/link</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/link/@href">/component-definition/metadata/location/link/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/link/@rel">/component-definition/metadata/location/link/@rel</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/link/@media-type">/component-definition/metadata/location/link/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/location/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/location/link/text">/component-definition/metadata/location/link/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/locations/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/location/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/location/remarks">/component-definition/metadata/location/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/party" class="toc3 head">party</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/party">/component-definition/metadata/party</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Party (organization or person)</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A responsible entity which is either a person or an organization.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/@uuid">/component-definition/metadata/party/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Party Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given party across
                     revisions of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/@type" class="toc4 head">@type</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/@type">/component-definition/metadata/party/@type</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Party Type</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">A category describing the kind of party the object describes.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/name">/component-definition/metadata/party/name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Party Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">The full name of the party. This is typically the legal name associated with the party.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/short-name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/short-name">/component-definition/metadata/party/short-name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Party Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the party.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/external-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/external-id" class="toc4 head">external-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/external-id">/component-definition/metadata/party/external-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Party External Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">An identifier for a person or organization using a designated scheme. e.g. an Open
                     Researcher and Contributor ID (ORCID)</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/external-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/external-id/@scheme" class="toc5 head">@scheme</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/external-id/@scheme">/component-definition/metadata/party/external-id/@scheme</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute External Identifier Schema</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">Indicates the type of external identifier.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/prop">/component-definition/metadata/party/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/prop/@name">/component-definition/metadata/party/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/prop/@uuid">/component-definition/metadata/party/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/prop/@ns">/component-definition/metadata/party/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/prop/@value">/component-definition/metadata/party/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/prop/@class">/component-definition/metadata/party/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/prop/remarks">/component-definition/metadata/party/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/link">/component-definition/metadata/party/link</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/link/@href">/component-definition/metadata/party/link/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/link/@rel">/component-definition/metadata/party/link/@rel</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/link/@media-type">/component-definition/metadata/party/link/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/link/text">/component-definition/metadata/party/link/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/email-addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/email-address" class="toc4 head">email-address</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/email-address">/component-definition/metadata/party/email-address</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Email Address</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.email">email</a></p>
                  </div>
                  <p class="description">An email address as defined by <a>RFC 5322 Section 3.4.1</a>. </p>
                  <div class="value" id="">
                     <p>Value: An email </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>This is a contact email associated with the party.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/telephone-numbers"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/telephone-number" class="toc4 head">telephone-number</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/telephone-number">/component-definition/metadata/party/telephone-number</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Telephone Number</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Contact number by telephone.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A phone number used to contact the party.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/telephone-numbers/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/telephone-number/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/telephone-number/@type">/component-definition/metadata/party/telephone-number/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/address" class="toc4 head">address</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/address">/component-definition/metadata/party/address</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Address</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A postal address for the location.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/addresses/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/address/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/address/@type">/component-definition/metadata/party/address/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/addresses/addr-lines"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/address/addr-line" class="toc5 head">addr-line</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/address/addr-line">/component-definition/metadata/party/address/addr-line</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Address line</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A single line of an address.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/addresses/city"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/address/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/address/city">/component-definition/metadata/party/address/city</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/addresses/state"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/address/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/address/state">/component-definition/metadata/party/address/state</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/addresses/postal-code"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/address/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/address/postal-code">/component-definition/metadata/party/address/postal-code</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/addresses/country"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/party/address/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/party/address/country">/component-definition/metadata/party/address/country</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/location-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/location-uuid" class="toc4 head">location-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/location-uuid">/component-definition/metadata/party/location-uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Location Reference</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
                  <div class="value" id="">
                     <p>Value: An uuid </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/member-of-organizations"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/member-of-organization" class="toc4 head">member-of-organization</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/member-of-organization">/component-definition/metadata/party/member-of-organization</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Organizational Affiliation</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">Identifies that the party object is a member of the organization associated with the
                     provided UUID.</p>
                  <div class="value" id="">
                     <p>Value: An uuid </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Parties of both the <code>person</code> or <code>organization</code> type can be associated with an organization using the <code>member-of-organization</code>. </p>
                     </div>
                     <div class="remarks">
                        <p>Parties of both the <code>person</code> or <code>organization</code> type can be associated with an organization using the <code>member-of-organization</code>. </p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/parties/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/party/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/party/remarks">/component-definition/metadata/party/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/responsible-party" class="toc3 head">responsible-party</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party">/component-definition/metadata/responsible-party</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Responsible Party</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A reference to a set of organizations or persons that have responsibility for performing
                  a referenced role in the context of the containing object.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/responsible-party/@role-id" class="toc4 head">@role-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/@role-id">/component-definition/metadata/responsible-party/@role-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Responsible Role</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">The role that the party is responsible for.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/responsible-party/party-uuid" class="toc4 head">party-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/party-uuid">/component-definition/metadata/responsible-party/party-uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Party Reference</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An element of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                  <div class="value" id="">
                     <p>Value: An uuid </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>Specifies one or more parties that are responsible for performing the associated <code>role</code>. </p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/responsible-party/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/prop">/component-definition/metadata/responsible-party/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/prop/@name">/component-definition/metadata/responsible-party/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/prop/@uuid">/component-definition/metadata/responsible-party/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/prop/@ns">/component-definition/metadata/responsible-party/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/prop/@value">/component-definition/metadata/responsible-party/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/prop/@class">/component-definition/metadata/responsible-party/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/prop/remarks">/component-definition/metadata/responsible-party/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/responsible-party/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/link">/component-definition/metadata/responsible-party/link</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/link/@href">/component-definition/metadata/responsible-party/link/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/link/@rel">/component-definition/metadata/responsible-party/link/@rel</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/link/@media-type">/component-definition/metadata/responsible-party/link/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/metadata/responsible-party/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/link/text">/component-definition/metadata/responsible-party/link/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/responsible-parties/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/metadata/responsible-party/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/metadata/responsible-party/remarks">/component-definition/metadata/responsible-party/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/metadata/remarks"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/metadata/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/metadata/remarks">/component-definition/metadata/remarks</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/component-definition/import-component-definitions"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/component-definition/import-component-definition" class="toc2 head">import-component-definition</h2>
         </div>
         <p>See <a href="../xml-outline/#/component-definition/import-component-definition">/component-definition/import-component-definition</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Import Component Definition</p>
               <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
               <p>An element of type <a href="link.to.empty">empty</a></p>
            </div>
            <p class="description">Loads a component definition from another resource.</p>
            
            --&gt;      </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/import-component-definitions/href"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/import-component-definition/@href" class="toc3 head">@href</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/import-component-definition/@href">/component-definition/import-component-definition/@href</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Hyperlink Reference</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
               </div>
               <p class="description">A link to a resource that defines a set of components and/or capabilities to import
                  into this collection.</p>
               
               --&gt;      </div>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/component-definition/components"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/component-definition/component" class="toc2 head">component</h2>
         </div>
         <p>See <a href="../xml-outline/#/component-definition/component">/component-definition/component</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Component</p>
               <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
               <p>An element </p>
            </div>
            <p class="description">A defined component that can be part of an implemented system.</p>
            
            --&gt;      
            
            --&gt;      
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>Components may be products, services, APIs, policies, processes, plans, guidance,
                     standards, or other tangible items that enable security and/or privacy.</p>
                  <p>The <code>type</code> indicates which of these component types is represented.</p>
                  <p>A group of components may be aggregated into a <code>capability</code>. For example, an account management capability that consists of an account management
                     process, and a Lightweight Directory Access Protocol (LDAP) software implementation.</p>
                  <p>Capabilities are expressed by combining one or more components.</p>
               </div>
            </details>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/uuid"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/@uuid" class="toc3 head">@uuid</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/@uuid">/component-definition/component/@uuid</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Component Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
               </div>
               <p class="description">The unique identifier for the component.</p>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/type"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/@type" class="toc3 head">@type</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/@type">/component-definition/component/@type</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Component Type</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.string">string</a></p>
               </div>
               <p class="description">A category describing the purpose of the component.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/title"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/title">/component-definition/component/title</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Component Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
               </div>
               <p class="description">A human readable name for the component.</p>
               <div class="value" id="">
                  <p>Value: A markup-line </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/description"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/description" class="toc3 head">description</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/description">/component-definition/component/description</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Component Description</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
               </div>
               <p class="description">A description of the component, including information about its function.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/purpose"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/purpose" class="toc3 head">purpose</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/purpose">/component-definition/component/purpose</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Purpose</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
               </div>
               <p class="description">A summary of the technological or business purpose of the component.</p>
               <div class="value" id="">
                  <p>Value: A markup-line </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/prop">/component-definition/component/prop</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Property</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                  qualified name/value pair. The value of a property is a simple scalar value, which
                  may be expressed as a list of values.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
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
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/prop/@name">/component-definition/component/prop/@name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/prop/@uuid">/component-definition/component/prop/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/prop/@ns">/component-definition/component/prop/@ns</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">A namespace qualifying the property's name. This allows different organizations to
                     associate distinct semantics with the same name.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                           names and associated values used in a property. This allows the semantics associated
                           with a given name/value pair to be defined on an organization-by-organization basis.</p>
                        <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                        <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/prop/@value">/component-definition/component/prop/@value</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/prop/@class">/component-definition/component/prop/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/prop/remarks">/component-definition/component/prop/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/link">/component-definition/component/link</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Link</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/link/@href">/component-definition/component/link/@href</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                        <p>If a local reference using a fragment is used, this will be indicated by a fragment
                           "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                        <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                           resource. A relative URI will be resolved relative to the location of the document
                           containing the link.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/link/@rel">/component-definition/component/link/@rel</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/link/@media-type">/component-definition/component/link/@media-type</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/link/text">/component-definition/component/link/text</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/responsible-role" class="toc3 head">responsible-role</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/responsible-role">/component-definition/component/responsible-role</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Responsible Role</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A reference to one or more roles with responsibility for performing a function relative
                  to the containing object.</p>
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/responsible-role/@role-id" class="toc4 head">@role-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/@role-id">/component-definition/component/responsible-role/@role-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Responsible Role ID</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">The role that is responsible for the business function.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/responsible-role/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/prop">/component-definition/component/responsible-role/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/prop/@name">/component-definition/component/responsible-role/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/prop/@uuid">/component-definition/component/responsible-role/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/prop/@ns">/component-definition/component/responsible-role/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/prop/@value">/component-definition/component/responsible-role/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/prop/@class">/component-definition/component/responsible-role/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/prop/remarks">/component-definition/component/responsible-role/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/responsible-role/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/link">/component-definition/component/responsible-role/link</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/link/@href">/component-definition/component/responsible-role/link/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/link/@rel">/component-definition/component/responsible-role/link/@rel</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/link/@media-type">/component-definition/component/responsible-role/link/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/responsible-role/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/link/text">/component-definition/component/responsible-role/link/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/responsible-role/party-uuid" class="toc4 head">party-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/party-uuid">/component-definition/component/responsible-role/party-uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Party Reference</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                  <div class="value" id="">
                     <p>Value: An uuid </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/responsible-roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/responsible-role/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/responsible-role/remarks">/component-definition/component/responsible-role/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/protocol" class="toc3 head">protocol</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/protocol">/component-definition/component/protocol</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Service Protocol Information</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Information about the protocol used to provide a service.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks in-use">
                     <p class="nb">(In use)</p>
                     <p>Used for <code>service</code> components to define the protocols supported by the service.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/protocol/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/protocol/@uuid">/component-definition/component/protocol/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Service Protocol Information Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A globally unique identifier that can be used to reference this service protocol entry
                     elsewhere in an OSCAL document. A UUID should be consistently used for a given resource
                     across revisions of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/protocol/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/protocol/@name">/component-definition/component/protocol/@name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Protocol Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">The common name of the protocol, which should be the appropriate "service name" from
                     the <a>IANA Service Name and Transport Protocol Port Number Registry</a>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The short name of the protocol (e.g., https).</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/protocol/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/protocol/title">/component-definition/component/protocol/title</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Protocol Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A human readable name for the protocol (e.g., Transport Layer Security).</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols/port-ranges"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/protocol/port-range" class="toc4 head">port-range</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/protocol/port-range">/component-definition/component/protocol/port-range</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Port Range</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.empty">empty</a></p>
                  </div>
                  <p class="description">Where applicable this is the IPv4 port range on which the service operates.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To be validated as a natural number (integer &gt;= 1). A single port uses the same value
                           for start and end. Use multiple 'port-range' entries for non-contiguous ranges.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols/port-ranges/start"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/protocol/port-range/@start" class="toc5 head">@start</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/protocol/port-range/@start">/component-definition/component/protocol/port-range/@start</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Start</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.nonNegativeInteger">nonNegativeInteger</a></p>
                     </div>
                     <p class="description">Indicates the starting port number in a port range</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Should be a number within a permitted range</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols/port-ranges/end"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/protocol/port-range/@end" class="toc5 head">@end</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/protocol/port-range/@end">/component-definition/component/protocol/port-range/@end</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute End</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.nonNegativeInteger">nonNegativeInteger</a></p>
                     </div>
                     <p class="description">Indicates the ending port number in a port range</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Should be a number within a permitted range</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/protocols/port-ranges/transport"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/protocol/port-range/@transport" class="toc5 head">@transport</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/protocol/port-range/@transport">/component-definition/component/protocol/port-range/@transport</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Transport</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Indicates the transport type.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/control-implementation" class="toc3 head">control-implementation</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/control-implementation">/component-definition/component/control-implementation</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Control Implementation Set</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Defines how the component or capability supports a set of controls.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Use of <code>set-parameter</code> in this context, sets the parameter for all related controls referenced in an <code>implemented-requirement</code>. If the same parameter is also set in a specific <code>implemented-requirement</code>, then the new value will override this value.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/control-implementation/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/@uuid">/component-definition/component/control-implementation/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Control Implementation Set Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier for the set of implemented controls.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/source"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/control-implementation/@source" class="toc4 head">@source</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/@source">/component-definition/component/control-implementation/@source</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Source Resource Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                  </div>
                  <p class="description">A reference to an OSCAL catalog or profile providing the referenced control or subcontrol
                     definition.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/control-implementation/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/description">/component-definition/component/control-implementation/description</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Control Implementation Description</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">A description of how the specified set of controls are implemented for the containing
                     component or capability.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/control-implementation/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/prop">/component-definition/component/control-implementation/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/prop/@name">/component-definition/component/control-implementation/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/prop/@uuid">/component-definition/component/control-implementation/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/prop/@ns">/component-definition/component/control-implementation/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/prop/@value">/component-definition/component/control-implementation/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/prop/@class">/component-definition/component/control-implementation/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/prop/remarks">/component-definition/component/control-implementation/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/control-implementation/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/link">/component-definition/component/control-implementation/link</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/link/@href">/component-definition/component/control-implementation/link/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/link/@rel">/component-definition/component/control-implementation/link/@rel</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/link/@media-type">/component-definition/component/control-implementation/link/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/link/text">/component-definition/component/control-implementation/link/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/set-parameters"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/control-implementation/set-parameter" class="toc4 head">set-parameter</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/set-parameter">/component-definition/component/control-implementation/set-parameter</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Set Parameter Value</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/set-parameters/param-id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/set-parameter/@param-id" class="toc5 head">@param-id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/set-parameter/@param-id">/component-definition/component/control-implementation/set-parameter/@param-id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Parameter ID</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                        the current implementation context.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/set-parameters/values"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/set-parameter/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/set-parameter/value">/component-definition/component/control-implementation/set-parameter/value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Parameter Value</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A parameter value or set of values.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/set-parameters/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/set-parameter/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/set-parameter/remarks">/component-definition/component/control-implementation/set-parameter/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/component/control-implementation/implemented-requirement" class="toc4 head">implemented-requirement</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement">/component-definition/component/control-implementation/implemented-requirement</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Control Implementation</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Describes how the containing component or capability implements an individual control.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/@uuid">/component-definition/component/control-implementation/implemented-requirement/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Control Implementation Identifier</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier for a specific control implementation.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/control-id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/@control-id" class="toc5 head">@control-id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/@control-id">/component-definition/component/control-implementation/implemented-requirement/@control-id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Control Identifier Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/description"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/description" class="toc5 head">description</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/description">/component-definition/component/control-implementation/implemented-requirement/description</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Control Implementation Description</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">A description of how the specified control is implemented for the containing component
                        or capability.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/prop">/component-definition/component/control-implementation/implemented-requirement/prop</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Property</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                        qualified name/value pair. The value of a property is a simple scalar value, which
                        may be expressed as a list of values.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
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
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/prop/@name">/component-definition/component/control-implementation/implemented-requirement/prop/@name</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/prop/@uuid">/component-definition/component/control-implementation/implemented-requirement/prop/@uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/prop/@ns">/component-definition/component/control-implementation/implemented-requirement/prop/@ns</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uri">uri</a></p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated values used in a property. This allows the semantics associated
                                 with a given name/value pair to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/prop/@value">/component-definition/component/control-implementation/implemented-requirement/prop/@value</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/prop/@class">/component-definition/component/control-implementation/implemented-requirement/prop/@class</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/prop/remarks">/component-definition/component/control-implementation/implemented-requirement/prop/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/link">/component-definition/component/control-implementation/implemented-requirement/link</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A reference to a local or remote resource</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To provide a cryptographic hash for a remote target resource, a local reference to
                              a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                           <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/link/@href">/component-definition/component/control-implementation/implemented-requirement/link/@href</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                 that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                              <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                 "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                              <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                 resource. A relative URI will be resolved relative to the location of the document
                                 containing the link.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/link/@rel">/component-definition/component/control-implementation/implemented-requirement/link/@rel</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/link/@media-type">/component-definition/component/control-implementation/implemented-requirement/link/@media-type</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/link/text">/component-definition/component/control-implementation/implemented-requirement/link/text</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                        <div class="value" id="">
                           <p>Value: A markup-line </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/set-parameter" class="toc5 head">set-parameter</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/set-parameter">/component-definition/component/control-implementation/implemented-requirement/set-parameter</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Set Parameter Value</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/param-id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/set-parameter/@param-id" class="toc6 head">@param-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/@param-id">/component-definition/component/control-implementation/implemented-requirement/set-parameter/@param-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Parameter ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                           the current implementation context.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/values"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/set-parameter/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/value">/component-definition/component/control-implementation/implemented-requirement/set-parameter/value</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Parameter Value</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An element of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">A parameter value or set of values.</p>
                        <div class="value" id="">
                           <p>Value: A string </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/set-parameter/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/remarks">/component-definition/component/control-implementation/implemented-requirement/set-parameter/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role" class="toc5 head">responsible-role</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role">/component-definition/component/control-implementation/implemented-requirement/responsible-role</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Responsible Role</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A reference to one or more roles with responsibility for performing a function relative
                        to the containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/@role-id" class="toc6 head">@role-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/@role-id">/component-definition/component/control-implementation/implemented-requirement/responsible-role/@role-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Responsible Role ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">The role that is responsible for the business function.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop">/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Property</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
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
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@name">/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@name</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@uuid">/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@uuid</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@ns">/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@ns</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uri">uri</a></p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@value">/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@value</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@class">/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@class</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/remarks">/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/remarks</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                           <div class="value" id="">
                              <p>Value: A markup-multiline </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link">/component-definition/component/control-implementation/implemented-requirement/responsible-role/link</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@href">/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@href</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@rel">/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@rel</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@media-type">/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@media-type</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/text">/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/text</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                           <div class="value" id="">
                              <p>Value: A markup-line </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/party-uuid" class="toc6 head">party-uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/party-uuid">/component-definition/component/control-implementation/implemented-requirement/responsible-role/party-uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Party Reference</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                        <div class="value" id="">
                           <p>Value: An uuid </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/remarks">/component-definition/component/control-implementation/implemented-requirement/responsible-role/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/statement" class="toc5 head">statement</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement">/component-definition/component/control-implementation/implemented-requirement/statement</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Control Statement Implementation</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Identifies which statements within a control are addressed.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/statement-id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/statement/@statement-id" class="toc6 head">@statement-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/@statement-id">/component-definition/component/control-implementation/implemented-requirement/statement/@statement-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Control Statement Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A reference to a control statement by its identifier</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/statement/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/@uuid">/component-definition/component/control-implementation/implemented-requirement/statement/@uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Control Statement Reference Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">A globally unique identifier that can be used to reference this control statement
                           entry elsewhere in an OSCAL document. A UUID should be consistently used for a given
                           resource across revisions of the document.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/description"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/statement/description" class="toc6 head">description</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/description">/component-definition/component/control-implementation/implemented-requirement/statement/description</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Statement Implementation Description</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">A summary of how the containing control statement is implemented by the component
                           or capability.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/statement/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/prop">/component-definition/component/control-implementation/implemented-requirement/statement/prop</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Property</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
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
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@name">/component-definition/component/control-implementation/implemented-requirement/statement/prop/@name</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@uuid">/component-definition/component/control-implementation/implemented-requirement/statement/prop/@uuid</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@ns">/component-definition/component/control-implementation/implemented-requirement/statement/prop/@ns</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uri">uri</a></p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@value">/component-definition/component/control-implementation/implemented-requirement/statement/prop/@value</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@class">/component-definition/component/control-implementation/implemented-requirement/statement/prop/@class</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/remarks">/component-definition/component/control-implementation/implemented-requirement/statement/prop/remarks</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                           <div class="value" id="">
                              <p>Value: A markup-multiline </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/statement/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/link">/component-definition/component/control-implementation/implemented-requirement/statement/link</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@href">/component-definition/component/control-implementation/implemented-requirement/statement/link/@href</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@rel">/component-definition/component/control-implementation/implemented-requirement/statement/link/@rel</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@media-type">/component-definition/component/control-implementation/implemented-requirement/statement/link/@media-type</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/link/text">/component-definition/component/control-implementation/implemented-requirement/statement/link/text</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                           <div class="value" id="">
                              <p>Value: A markup-line </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role" class="toc6 head">responsible-role</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Responsible Role</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A reference to one or more roles with responsibility for performing a function relative
                           to the containing object.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/@role-id" class="toc7 head">@role-id</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/@role-id">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/@role-id</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Responsible Role ID</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">The role that is responsible for the business function.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop" class="toc7 head">prop</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Property</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element </p>
                           </div>
                           <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                              qualified name/value pair. The value of a property is a simple scalar value, which
                              may be expressed as a list of values.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
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
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@name" class="toc8 head">@name</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@name">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@name</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Name</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                              </div>
                              <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                                 quality of the property's containing object.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid" class="toc8 head">@uuid</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Universally Unique Identifier</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                              </div>
                              <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                                 document. A UUID should be consistently used for a given location across revisions
                                 of the document.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns" class="toc8 head">@ns</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Namespace</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.uri">uri</a></p>
                              </div>
                              <p class="description">A namespace qualifying the property's name. This allows different organizations to
                                 associate distinct semantics with the same name.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                       names and associated values used in a property. This allows the semantics associated
                                       with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                    <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                       to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                    <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                                 </div>
                              </details>
                           </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@value" class="toc8 head">@value</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@value">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@value</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Value</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>An attribute of type <a href="link.to.string">string</a></p>
                              </div>
                              <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@class" class="toc8 head">@class</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@class">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@class</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Class</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                              </div>
                              <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                                 multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                       a specific <code>class</code> value.</p>
                                 </div>
                              </details>
                           </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks" class="toc8 head">remarks</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">element Remarks</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                              </div>
                              <p class="description">Additional commentary on the containing object.</p>
                              <div class="value" id="">
                                 <p>Value: A markup-multiline </p>
                              </div>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link" class="toc7 head">link</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Link</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element </p>
                           </div>
                           <p class="description">A reference to a local or remote resource</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                    a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                 <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                              </div>
                           </details>
                        </div>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@href" class="toc8 head">@href</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@href">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@href</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Hypertext Reference</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                              </div>
                              <p class="description">A resolvable URL reference to a resource.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                       that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                    <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                       "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                    <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                       resource. A relative URI will be resolved relative to the location of the document
                                       containing the link.</p>
                                 </div>
                              </details>
                           </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@rel" class="toc8 head">@rel</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@rel">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@rel</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Relation</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                              </div>
                              <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                                 of the link's purpose.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type" class="toc8 head">@media-type</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Media Type</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.string">string</a></p>
                              </div>
                              <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                                 <a>Media Types Registry</a>. </p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/text" class="toc8 head">text</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/text">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/text</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">element Link Text</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                              </div>
                              <p class="description">A textual label to associate with the link, which may be used for presentation in
                                 a tool.</p>
                              <div class="value" id="">
                                 <p>Value: A markup-line </p>
                              </div>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/party-uuid" class="toc7 head">party-uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/party-uuid">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/party-uuid</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Party Reference</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element of type <a href="link.to.uuid">uuid</a></p>
                           </div>
                           <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                           <div class="value" id="">
                              <p>Value: An uuid </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/remarks">/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/remarks</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                           <div class="value" id="">
                              <p>Value: A markup-multiline </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/component/control-implementation/implemented-requirement/statement/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/statement/remarks">/component-definition/component/control-implementation/implemented-requirement/statement/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/component/control-implementation/implemented-requirement/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/component/control-implementation/implemented-requirement/remarks">/component-definition/component/control-implementation/implemented-requirement/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/components/remarks"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/component/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/component/remarks">/component-definition/component/remarks</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/component-definition/capability" class="toc2 head">capability</h2>
         </div>
         <p>See <a href="../xml-outline/#/component-definition/capability">/component-definition/capability</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Capability</p>
               <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
               <p>An element </p>
            </div>
            <p class="description">A grouping of other components and/or capabilities.</p>
            
            --&gt;      
            
            --&gt;      </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/uuid"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/@uuid" class="toc3 head">@uuid</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/@uuid">/component-definition/capability/@uuid</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Capability Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
               </div>
               <p class="description">A unique identifier for a capability.</p>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/name"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/@name" class="toc3 head">@name</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/@name">/component-definition/capability/@name</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Capability Name</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.string">string</a></p>
               </div>
               <p class="description">The capability's human-readable name.</p>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/description"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/description" class="toc3 head">description</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/description">/component-definition/capability/description</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Capability Description</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
               </div>
               <p class="description">A summary of the capability.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/prop">/component-definition/capability/prop</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Property</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                  qualified name/value pair. The value of a property is a simple scalar value, which
                  may be expressed as a list of values.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
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
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/prop/@name">/component-definition/capability/prop/@name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/prop/@uuid">/component-definition/capability/prop/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/prop/@ns">/component-definition/capability/prop/@ns</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">A namespace qualifying the property's name. This allows different organizations to
                     associate distinct semantics with the same name.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                           names and associated values used in a property. This allows the semantics associated
                           with a given name/value pair to be defined on an organization-by-organization basis.</p>
                        <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                        <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/prop/@value">/component-definition/capability/prop/@value</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/prop/@class">/component-definition/capability/prop/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/prop/remarks">/component-definition/capability/prop/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/link">/component-definition/capability/link</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Link</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/link/@href">/component-definition/capability/link/@href</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                           that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                        <p>If a local reference using a fragment is used, this will be indicated by a fragment
                           "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                        <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                           resource. A relative URI will be resolved relative to the location of the document
                           containing the link.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/link/@rel">/component-definition/capability/link/@rel</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/link/@media-type">/component-definition/capability/link/@media-type</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/link/text">/component-definition/capability/link/text</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/incorporates-components"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/incorporates-component" class="toc3 head">incorporates-component</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/incorporates-component">/component-definition/capability/incorporates-component</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Incorporates Component</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">TBD</p>
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/incorporates-components/component-uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/incorporates-component/@component-uuid" class="toc4 head">@component-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/incorporates-component/@component-uuid">/component-definition/capability/incorporates-component/@component-uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Component Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A reference to a component by its identifier</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/incorporates-components/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/incorporates-component/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/incorporates-component/description">/component-definition/capability/incorporates-component/description</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Component Description</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">A description of the component, including information about its function.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/control-implementation" class="toc3 head">control-implementation</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation">/component-definition/capability/control-implementation</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Control Implementation Set</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Defines how the component or capability supports a set of controls.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Use of <code>set-parameter</code> in this context, sets the parameter for all related controls referenced in an <code>implemented-requirement</code>. If the same parameter is also set in a specific <code>implemented-requirement</code>, then the new value will override this value.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/control-implementation/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/@uuid">/component-definition/capability/control-implementation/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Control Implementation Set Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier for the set of implemented controls.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/source"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/control-implementation/@source" class="toc4 head">@source</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/@source">/component-definition/capability/control-implementation/@source</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Source Resource Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                  </div>
                  <p class="description">A reference to an OSCAL catalog or profile providing the referenced control or subcontrol
                     definition.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/control-implementation/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/description">/component-definition/capability/control-implementation/description</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Control Implementation Description</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">A description of how the specified set of controls are implemented for the containing
                     component or capability.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/control-implementation/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/prop">/component-definition/capability/control-implementation/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/prop/@name">/component-definition/capability/control-implementation/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/prop/@uuid">/component-definition/capability/control-implementation/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/prop/@ns">/component-definition/capability/control-implementation/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/prop/@value">/component-definition/capability/control-implementation/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/prop/@class">/component-definition/capability/control-implementation/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/prop/remarks">/component-definition/capability/control-implementation/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/control-implementation/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/link">/component-definition/capability/control-implementation/link</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/link/@href">/component-definition/capability/control-implementation/link/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                              that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                           <p>If a local reference using a fragment is used, this will be indicated by a fragment
                              "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                           <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                              resource. A relative URI will be resolved relative to the location of the document
                              containing the link.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/link/@rel">/component-definition/capability/control-implementation/link/@rel</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/link/@media-type">/component-definition/capability/control-implementation/link/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/link/text">/component-definition/capability/control-implementation/link/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/control-implementation/set-parameter" class="toc4 head">set-parameter</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/set-parameter">/component-definition/capability/control-implementation/set-parameter</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Set Parameter Value</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters/param-id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/set-parameter/@param-id" class="toc5 head">@param-id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/set-parameter/@param-id">/component-definition/capability/control-implementation/set-parameter/@param-id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Parameter ID</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                        the current implementation context.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters/values"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/set-parameter/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/set-parameter/value">/component-definition/capability/control-implementation/set-parameter/value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Parameter Value</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A parameter value or set of values.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/set-parameter/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/set-parameter/remarks">/component-definition/capability/control-implementation/set-parameter/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/capability/control-implementation/implemented-requirement" class="toc4 head">implemented-requirement</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement">/component-definition/capability/control-implementation/implemented-requirement</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Control Implementation</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Describes how the containing component or capability implements an individual control.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/@uuid">/component-definition/capability/control-implementation/implemented-requirement/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Control Implementation Identifier</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier for a specific control implementation.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/control-id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/@control-id" class="toc5 head">@control-id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/@control-id">/component-definition/capability/control-implementation/implemented-requirement/@control-id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Control Identifier Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/description"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/description" class="toc5 head">description</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/description">/component-definition/capability/control-implementation/implemented-requirement/description</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Control Implementation Description</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">A description of how the specified control is implemented for the containing component
                        or capability.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/prop">/component-definition/capability/control-implementation/implemented-requirement/prop</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Property</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                        qualified name/value pair. The value of a property is a simple scalar value, which
                        may be expressed as a list of values.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
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
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/prop/@name">/component-definition/capability/control-implementation/implemented-requirement/prop/@name</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/prop/@uuid">/component-definition/capability/control-implementation/implemented-requirement/prop/@uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/prop/@ns">/component-definition/capability/control-implementation/implemented-requirement/prop/@ns</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uri">uri</a></p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated values used in a property. This allows the semantics associated
                                 with a given name/value pair to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/prop/@value">/component-definition/capability/control-implementation/implemented-requirement/prop/@value</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/prop/@class">/component-definition/capability/control-implementation/implemented-requirement/prop/@class</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/prop/remarks">/component-definition/capability/control-implementation/implemented-requirement/prop/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/link">/component-definition/capability/control-implementation/implemented-requirement/link</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A reference to a local or remote resource</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To provide a cryptographic hash for a remote target resource, a local reference to
                              a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                           <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/link/@href">/component-definition/capability/control-implementation/implemented-requirement/link/@href</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                 that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                              <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                 "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                              <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                 resource. A relative URI will be resolved relative to the location of the document
                                 containing the link.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/link/@rel">/component-definition/capability/control-implementation/implemented-requirement/link/@rel</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/link/@media-type">/component-definition/capability/control-implementation/implemented-requirement/link/@media-type</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/link/text">/component-definition/capability/control-implementation/implemented-requirement/link/text</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                        <div class="value" id="">
                           <p>Value: A markup-line </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/set-parameter" class="toc5 head">set-parameter</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter">/component-definition/capability/control-implementation/implemented-requirement/set-parameter</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Set Parameter Value</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Identifies the parameter that will be set by the enclosed value.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/param-id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/set-parameter/@param-id" class="toc6 head">@param-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/@param-id">/component-definition/capability/control-implementation/implemented-requirement/set-parameter/@param-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Parameter ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A reference to a parameter within a control, who's catalog has been imported into
                           the current implementation context.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/set-parameter/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/value">/component-definition/capability/control-implementation/implemented-requirement/set-parameter/value</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Parameter Value</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An element of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">A parameter value or set of values.</p>
                        <div class="value" id="">
                           <p>Value: A string </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/set-parameter/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/remarks">/component-definition/capability/control-implementation/implemented-requirement/set-parameter/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role" class="toc5 head">responsible-role</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role">/component-definition/capability/control-implementation/implemented-requirement/responsible-role</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Responsible Role</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A reference to one or more roles with responsibility for performing a function relative
                        to the containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/@role-id" class="toc6 head">@role-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/@role-id">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/@role-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Responsible Role ID</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">The role that is responsible for the business function.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Property</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
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
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@name">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@name</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@uuid">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@uuid</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@ns">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@ns</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uri">uri</a></p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@value">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@value</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@class">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@class</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/remarks">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/remarks</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                           <div class="value" id="">
                              <p>Value: A markup-multiline </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@href">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@href</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@rel">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@rel</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@media-type">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@media-type</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/text">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/text</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                           <div class="value" id="">
                              <p>Value: A markup-line </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/party-uuid" class="toc6 head">party-uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/party-uuid">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/party-uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Party Reference</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                        <div class="value" id="">
                           <p>Value: An uuid </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/remarks">/component-definition/capability/control-implementation/implemented-requirement/responsible-role/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/statement" class="toc5 head">statement</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement">/component-definition/capability/control-implementation/implemented-requirement/statement</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Control Statement Implementation</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Identifies which statements within a control are addressed.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/statement-id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/statement/@statement-id" class="toc6 head">@statement-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/@statement-id">/component-definition/capability/control-implementation/implemented-requirement/statement/@statement-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Control Statement Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A reference to a control statement by its identifier</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/statement/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/@uuid">/component-definition/capability/control-implementation/implemented-requirement/statement/@uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Control Statement Reference Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">A globally unique identifier that can be used to reference this control statement
                           entry elsewhere in an OSCAL document. A UUID should be consistently used for a given
                           resource across revisions of the document.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/description"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/statement/description" class="toc6 head">description</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/description">/component-definition/capability/control-implementation/implemented-requirement/statement/description</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Statement Implementation Description</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">A summary of how the containing control statement is implemented by the component
                           or capability.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop">/component-definition/capability/control-implementation/implemented-requirement/statement/prop</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Property</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
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
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@name">/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@name</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@uuid">/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@uuid</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@ns">/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@ns</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uri">uri</a></p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                    names and associated values used in a property. This allows the semantics associated
                                    with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                 <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                    to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                 <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@value">/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@value</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@class">/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@class</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                    a specific <code>class</code> value.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/remarks">/component-definition/capability/control-implementation/implemented-requirement/statement/prop/remarks</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                           <div class="value" id="">
                              <p>Value: A markup-multiline </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/statement/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/link">/component-definition/capability/control-implementation/implemented-requirement/statement/link</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                 a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                              <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                           </div>
                        </details>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@href">/component-definition/capability/control-implementation/implemented-requirement/statement/link/@href</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                    that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                 <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                    "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                 <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                    resource. A relative URI will be resolved relative to the location of the document
                                    containing the link.</p>
                              </div>
                           </details>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@rel">/component-definition/capability/control-implementation/implemented-requirement/statement/link/@rel</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@media-type">/component-definition/capability/control-implementation/implemented-requirement/statement/link/@media-type</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/text">/component-definition/capability/control-implementation/implemented-requirement/statement/link/text</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Link Text</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                           </div>
                           <p class="description">A textual label to associate with the link, which may be used for presentation in
                              a tool.</p>
                           <div class="value" id="">
                              <p>Value: A markup-line </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role" class="toc6 head">responsible-role</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Responsible Role</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A reference to one or more roles with responsibility for performing a function relative
                           to the containing object.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/@role-id" class="toc7 head">@role-id</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/@role-id">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/@role-id</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Responsible Role ID</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">The role that is responsible for the business function.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop" class="toc7 head">prop</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Property</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element </p>
                           </div>
                           <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                              qualified name/value pair. The value of a property is a simple scalar value, which
                              may be expressed as a list of values.</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
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
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@name" class="toc8 head">@name</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@name">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@name</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Name</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                              </div>
                              <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                                 quality of the property's containing object.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid" class="toc8 head">@uuid</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Universally Unique Identifier</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                              </div>
                              <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                                 document. A UUID should be consistently used for a given location across revisions
                                 of the document.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns" class="toc8 head">@ns</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Namespace</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.uri">uri</a></p>
                              </div>
                              <p class="description">A namespace qualifying the property's name. This allows different organizations to
                                 associate distinct semantics with the same name.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                       names and associated values used in a property. This allows the semantics associated
                                       with a given name/value pair to be defined on an organization-by-organization basis.</p>
                                    <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                       to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                                    <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                                 </div>
                              </details>
                           </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@value" class="toc8 head">@value</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@value">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@value</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Value</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>An attribute of type <a href="link.to.string">string</a></p>
                              </div>
                              <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@class" class="toc8 head">@class</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@class">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@class</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Property Class</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                              </div>
                              <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                                 multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                       a specific <code>class</code> value.</p>
                                 </div>
                              </details>
                           </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks" class="toc8 head">remarks</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">element Remarks</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                              </div>
                              <p class="description">Additional commentary on the containing object.</p>
                              <div class="value" id="">
                                 <p>Value: A markup-multiline </p>
                              </div>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link" class="toc7 head">link</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Link</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element </p>
                           </div>
                           <p class="description">A reference to a local or remote resource</p>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           <details open="open" class="remarks-group">
                              <summary>Remarks</summary>
                              <div class="remarks">
                                 <p>To provide a cryptographic hash for a remote target resource, a local reference to
                                    a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                                 <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                              </div>
                           </details>
                        </div>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@href" class="toc8 head">@href</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@href">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@href</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Hypertext Reference</p>
                                 <p class="occurrence"><span class="cardinality">[1]</span></p>
                                 <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                              </div>
                              <p class="description">A resolvable URL reference to a resource.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              <details open="open" class="remarks-group">
                                 <summary>Remarks</summary>
                                 <div class="remarks">
                                    <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                                       that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                                    <p>If a local reference using a fragment is used, this will be indicated by a fragment
                                       "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                                    <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URI pointing to the location of the referenced
                                       resource. A relative URI will be resolved relative to the location of the document
                                       containing the link.</p>
                                 </div>
                              </details>
                           </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@rel" class="toc8 head">@rel</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@rel">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@rel</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Relation</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                              </div>
                              <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                                 of the link's purpose.</p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type" class="toc8 head">@media-type</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Media Type</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.string">string</a></p>
                              </div>
                              <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                                 <a>Media Types Registry</a>. </p>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/text" class="toc8 head">text</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/text">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/text</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">element Link Text</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                              </div>
                              <p class="description">A textual label to associate with the link, which may be used for presentation in
                                 a tool.</p>
                              <div class="value" id="">
                                 <p>Value: A markup-line </p>
                              </div>
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      
                              
                              --&gt;      </div>
                        </section>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/party-uuid" class="toc7 head">party-uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/party-uuid">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/party-uuid</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Party Reference</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element of type <a href="link.to.uuid">uuid</a></p>
                           </div>
                           <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                           <div class="value" id="">
                              <p>Value: An uuid </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/remarks">/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/remarks</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                           <div class="value" id="">
                              <p>Value: A markup-multiline </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/capability/control-implementation/implemented-requirement/statement/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/statement/remarks">/component-definition/capability/control-implementation/implemented-requirement/statement/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/capability/control-implementation/implemented-requirement/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/capability/control-implementation/implemented-requirement/remarks">/component-definition/capability/control-implementation/implemented-requirement/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/capabilities/remarks"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/capability/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/capability/remarks">/component-definition/capability/remarks</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/component-definition/back-matter" class="toc2 head">back-matter</h2>
         </div>
         <p>See <a href="../xml-outline/#/component-definition/back-matter">/component-definition/back-matter</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Back matter</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An element </p>
            </div>
            <p class="description">A collection of resources, which may be included directly or by reference.</p>
            
            --&gt;      
            
            --&gt;      
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>Provides a collection of identified <code>resource</code> objects that can be referenced by a <code>link</code> with a <code>rel</code> value of "reference" and an <code>href</code> value that is a fragment "#" followed by a reference to a reference identifier. Other
                     specialized link "rel" values also use this pattern when indicated in that context
                     of use.</p>
               </div>
            </details>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/component-definition/back-matter/resource" class="toc3 head">resource</h3>
            </div>
            <p>See <a href="../xml-outline/#/component-definition/back-matter/resource">/component-definition/back-matter/resource</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Resource</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A resource associated with content in the containing document. A resource may be directly
                  included in the document base64 encoded or may point to one or more equivalent internet
                  resources.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                        resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                        for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                        the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                        This allows the document consumer to choose a preferred item to process based on a
                        the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                        in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                        from any of the available formats indicated by the items.</p>
                     <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                  </div>
                  <div class="remarks">
                     <p>A resource can be used in two ways. 1) it may point to an specific retrievable network
                        resource using a <code>rlink</code>, or 2) it may be included as an attachment using a <code>base64</code>. A resource may contain multiple <code>rlink</code> and <code>base64</code> entries that represent alternative download locations (rlink) and attachments (base64)
                        for the same resource. Both rlink and base64 allow for a <code>media-type</code> to be specified, which is used to distinguish between different representations of
                        the same resource (e.g., Microsoft Word, PDF). When multiple <code>rlink</code> and <code>base64</code> items are included for a given resource, all items must contain equivalent information.
                        This allows the document consumer to choose a preferred item to process based on a
                        the selected item's <code>media-type</code>. This is extremely important when the items represent OSCAL content that is represented
                        in alternate formats (i.e., XML, JSON, YAML), allowing the same OSCAL data to be processed
                        from any of the available formats indicated by the items.</p>
                     <p>When a resource includes a citation, then the <code>title</code> and <code>citation</code> properties must both be included.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/@uuid">/component-definition/back-matter/resource/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Resource Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A globally unique identifier that can be used to reference this defined resource elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given resource across
                     revisions of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/title">/component-definition/back-matter/resource/title</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Resource Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A name given to the resource, which may be used by a tool for display and navigation.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/description">/component-definition/back-matter/resource/description</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Resource Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">A short summary of the resource used to indicate the purpose of the resource.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/prop">/component-definition/back-matter/resource/prop</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Property</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                     qualified name/value pair. The value of a property is a simple scalar value, which
                     may be expressed as a list of values.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/prop/@name">/component-definition/back-matter/resource/prop/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/prop/@uuid">/component-definition/back-matter/resource/prop/@uuid</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/prop/@ns">/component-definition/back-matter/resource/prop/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the property's name. This allows different organizations to
                        associate distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated values used in a property. This allows the semantics associated
                              with a given name/value pair to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/prop/@value">/component-definition/back-matter/resource/prop/@value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/prop/@class">/component-definition/back-matter/resource/prop/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/prop/remarks">/component-definition/back-matter/resource/prop/remarks</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/document-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/document-id" class="toc4 head">document-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/document-id">/component-definition/back-matter/resource/document-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Document Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                     that are to be treated as different versions of the same document. If this element
                     does not appear, or if the value of this element is empty, the value of "document-id"
                     is equal to the value of the "uuid" flag of the top-level root element.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>This element is optional, but it will always have a valid value, as if it is missing
                           the value of "document-id" is assumed to be equal to the UUID of the root. This requirement
                           allows for document creators to retroactively link an update to the original version,
                           by providing a document-id on the new document that is equal to the uuid of the original
                           document.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/document-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/document-id/@scheme" class="toc5 head">@scheme</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/document-id/@scheme">/component-definition/back-matter/resource/document-id/@scheme</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Document Identification Scheme</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                        the value of the element will be interpreted as a string of characters. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/citation" class="toc4 head">citation</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation">/component-definition/back-matter/resource/citation</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Citation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A citation consisting of end note text and optional structured bibliographic data.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The <code>text</code> is used to define the endnote text, without any required bibliographic structure.
                           If structured bibliographic data is needed, then the <code>biblio</code> can be used for this purpose.</p>
                        <p>A <code>biblio</code> can be used to capture a structured bibliographical citation in an appropriate format.</p>
                     </div>
                     <div class="remarks">
                        <p>The <code>text</code> is used to define the endnote text, without any required bibliographic structure.
                           If structured bibliographic data is needed, then the <code>biblio</code> can be used for this purpose.</p>
                        <p>A <code>biblio</code> can be used to capture a structured bibliographical citation in an appropriate format.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/citation/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/text">/component-definition/back-matter/resource/citation/text</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Citation Text</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A line of citation text.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/citation/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/prop">/component-definition/back-matter/resource/citation/prop</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Property</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                        qualified name/value pair. The value of a property is a simple scalar value, which
                        may be expressed as a list of values.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
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
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/back-matter/resource/citation/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/prop/@name">/component-definition/back-matter/resource/citation/prop/@name</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/back-matter/resource/citation/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/prop/@uuid">/component-definition/back-matter/resource/citation/prop/@uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/back-matter/resource/citation/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/prop/@ns">/component-definition/back-matter/resource/citation/prop/@ns</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uri">uri</a></p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                                 names and associated values used in a property. This allows the semantics associated
                                 with a given name/value pair to be defined on an organization-by-organization basis.</p>
                              <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                                 to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                              <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/back-matter/resource/citation/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/prop/@value">/component-definition/back-matter/resource/citation/prop/@value</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/back-matter/resource/citation/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/prop/@class">/component-definition/back-matter/resource/citation/prop/@class</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                                 a specific <code>class</code> value.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/back-matter/resource/citation/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/prop/remarks">/component-definition/back-matter/resource/citation/prop/remarks</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/citation/biblio"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/citation/biblio" class="toc5 head">biblio</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/citation/biblio">/component-definition/back-matter/resource/citation/biblio</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Bibliographic Definition</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A container for structured bibliographic information. The model of this information
                        is undefined by OSCAL.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/rlinks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/rlink" class="toc4 head">rlink</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/rlink">/component-definition/back-matter/resource/rlink</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Resource link</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A pointer to an external resource with an optional hash for verification and change
                     detection.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>This construct is different from <code>link</code>, which makes no provision for a hash or formal title.</p>
                        <p>Multiple <code>rlink</code> can be included for a resource. In such a case, all provided <code>rlink</code> items are intended to be equivalent in content, but may differ in structure. A <code>media-type</code> is used to identify the format of a given rlink, and can be used to differentiate
                           a items in a collection of rlinks. The <code>media-type</code> also provides a hint to the OSCAL document consumer about the structure of the resource
                           referenced by the <code>rlink</code>. </p>
                     </div>
                     <div class="remarks">
                        <p>This construct is different from <code>link</code>, which makes no provision for a hash or formal title.</p>
                        <p>Multiple <code>rlink</code> can be included for a resource. In such a case, all provided <code>rlink</code> items are intended to be equivalent in content, but may differ in structure. A <code>media-type</code> is used to identify the format of a given rlink, and can be used to differentiate
                           a items in a collection of rlinks. The <code>media-type</code> also provides a hint to the OSCAL document consumer about the structure of the resource
                           referenced by the <code>rlink</code>. </p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/rlinks/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/rlink/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/rlink/@href">/component-definition/back-matter/resource/rlink/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URI reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/rlinks/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/rlink/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/rlink/@media-type">/component-definition/back-matter/resource/rlink/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/rlinks/hashes"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/rlink/hash" class="toc5 head">hash</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/rlink/hash">/component-definition/back-matter/resource/rlink/hash</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Hash</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A representation of a cryptographic digest generated over a resource using a specified
                        hash algorithm.</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks in-use">
                           <p class="nb">(In use)</p>
                           <p>When appearing as part of a <code>resource/rlink</code>, the hash applies to the resource referenced by the <code>href</code>. </p>
                        </div>
                        <div class="remarks">
                           <p>A hash value can be used to authenticate that a referenced resource is the same resources
                              as was pointed to by the author of the reference.</p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/rlinks/hashes/algorithm"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/component-definition/back-matter/resource/rlink/hash/@algorithm" class="toc6 head">@algorithm</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/rlink/hash/@algorithm">/component-definition/back-matter/resource/rlink/hash/@algorithm</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Hash algorithm</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Method by which a hash is derived</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Any other value used MUST be a value defined in the W3C <a>XML Security Algorithm Cross-Reference</a> Digest Methods (W3C, April 2013) or <a>RFC 6931 Section 2.1.5</a> New SHA Functions.</p>
                           </div>
                        </details>
                     </div>
                  </section>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/base64"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/base64" class="toc4 head">base64</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/base64">/component-definition/back-matter/resource/base64</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Base64</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.base64Binary">base64Binary</a></p>
                  </div>
                  <p class="description">The Base64 alphabet in RFC 2045 - aligned with XSD.</p>
                  <div class="value" id="">
                     <p>Value: A base64Binary </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/base64/filename"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/base64/@filename" class="toc5 head">@filename</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/base64/@filename">/component-definition/back-matter/resource/base64/@filename</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute File Name</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">Name of the file before it was encoded as Base64 to be embedded in a <code>resource</code>. This is the name that will be assigned to the file when the file is decoded.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/base64/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/component-definition/back-matter/resource/base64/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/base64/@media-type">/component-definition/back-matter/resource/base64/@media-type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/component-definition/back-matter/resources/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/component-definition/back-matter/resource/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/component-definition/back-matter/resource/remarks">/component-definition/back-matter/resource/remarks</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
      </section>
   </section>
</div>