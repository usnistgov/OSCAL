---
title: "OSCAL Catalog Model XML Format Reference"
heading: "OSCAL Catalog Model XML Format Reference"
description: A reference for the OSCAL Catalog model XML format.
weight: 60
sidenav:
  title: XML Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
aliases:
  - /docs/schemas/oscal-catalog-xml/
  - /documentation/schema/catalog/xml-schema/
  - /documentation/schema/catalog-layer/catalog/xml-schema/
---

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-reference">
   <h2><span class="usa-tag">Schema version:</span> 1.0.0-rc2</h2>
   <section class="xml-element">
      <div class="header">
         <div class="crosslink"><a href="../json-reference/#/catalog"><button class="schema-link">Switch to JSON</button></a></div>
         <h1 id="/catalog" class="toc1 head">catalog</h1>
      </div>
      <p>See <a href="../xml-outline/#/catalog">/catalog</a> in the element map.</p>
      <div class="obj-desc">
         <div class="obj-matrix">
            <p class="obj-name">element Catalog</p>
            <p class="occurrence"><span class="cardinality">[1]</span></p>
            <p>An element </p>
         </div>
         <p class="description">A collection of controls.</p>
         
         --&gt;      
         <details open="open" class="remarks-group">
            <summary>Remarks</summary>
            <div class="remarks">
               <p>Catalogs may use one or more <code>group</code> objects to subdivide the control contents of a catalog.</p>
               <p>An OSCAL catalog model provides a structured representation of control information.</p>
            </div>
            <div class="remarks">
               <p>Catalogs may use one or more <code>group</code> objects to subdivide the control contents of a catalog.</p>
               <p>An OSCAL catalog model provides a structured representation of control information.</p>
            </div>
         </details>
      </div>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/catalog/uuid"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/catalog/@uuid" class="toc2 head">@uuid</h2>
         </div>
         <p>See <a href="../xml-outline/#/catalog/@uuid">/catalog/@uuid</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">attribute Catalog Universally Unique Identifier</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
            </div>
            <p class="description">A globally unique identifier for this catalog instance. This UUID should be changed
               when this document is revised.</p>
            
            --&gt;      </div>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/catalog/metadata"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/catalog/metadata" class="toc2 head">metadata</h2>
         </div>
         <p>See <a href="../xml-outline/#/catalog/metadata">/catalog/metadata</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/title"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/title">/catalog/metadata/title</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/published"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/published" class="toc3 head">published</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/published">/catalog/metadata/published</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/last-modified"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/last-modified" class="toc3 head">last-modified</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/last-modified">/catalog/metadata/last-modified</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/version"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/version" class="toc3 head">version</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/version">/catalog/metadata/version</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/oscal-version"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/oscal-version" class="toc3 head">oscal-version</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/oscal-version">/catalog/metadata/oscal-version</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/revisions" class="toc3 head">revisions</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/revisions">/catalog/metadata/revisions</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/revisions/revision" class="toc4 head">revision</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision">/catalog/metadata/revisions/revision</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/title"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/title" class="toc5 head">title</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/title">/catalog/metadata/revisions/revision/title</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/published"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/published" class="toc5 head">published</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/published">/catalog/metadata/revisions/revision/published</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/last-modified"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/last-modified" class="toc5 head">last-modified</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/last-modified">/catalog/metadata/revisions/revision/last-modified</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/version"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/version" class="toc5 head">version</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/version">/catalog/metadata/revisions/revision/version</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/oscal-version"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/oscal-version" class="toc5 head">oscal-version</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/oscal-version">/catalog/metadata/revisions/revision/oscal-version</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/prop">/catalog/metadata/revisions/revision/prop</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/prop/@name">/catalog/metadata/revisions/revision/prop/@name</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/prop/@uuid">/catalog/metadata/revisions/revision/prop/@uuid</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/prop/@ns">/catalog/metadata/revisions/revision/prop/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/prop/@value">/catalog/metadata/revisions/revision/prop/@value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/prop/@class">/catalog/metadata/revisions/revision/prop/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/prop/remarks">/catalog/metadata/revisions/revision/prop/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/link">/catalog/metadata/revisions/revision/link</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/link/@href">/catalog/metadata/revisions/revision/link/@href</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/link/@rel">/catalog/metadata/revisions/revision/link/@rel</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/link/@media-type">/catalog/metadata/revisions/revision/link/@media-type</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/metadata/revisions/revision/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/link/text">/catalog/metadata/revisions/revision/link/text</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/revisions/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/revisions/revision/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/revisions/revision/remarks">/catalog/metadata/revisions/revision/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/document-ids"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/document-id" class="toc3 head">document-id</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/document-id">/catalog/metadata/document-id</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/document-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/document-id/@scheme" class="toc4 head">@scheme</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/document-id/@scheme">/catalog/metadata/document-id/@scheme</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/prop">/catalog/metadata/prop</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/prop/@name">/catalog/metadata/prop/@name</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/prop/@uuid">/catalog/metadata/prop/@uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/prop/@ns">/catalog/metadata/prop/@ns</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/prop/@value">/catalog/metadata/prop/@value</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/prop/@class">/catalog/metadata/prop/@class</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/prop/remarks">/catalog/metadata/prop/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/link">/catalog/metadata/link</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/link/@href">/catalog/metadata/link/@href</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/link/@rel">/catalog/metadata/link/@rel</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/link/@media-type">/catalog/metadata/link/@media-type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/link/text">/catalog/metadata/link/text</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/role" class="toc3 head">role</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/role">/catalog/metadata/role</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/role/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/role/@id">/catalog/metadata/role/@id</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/role/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/role/title">/catalog/metadata/role/title</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/short-name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/role/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/role/short-name">/catalog/metadata/role/short-name</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/role/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/role/description">/catalog/metadata/role/description</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/role/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/role/prop">/catalog/metadata/role/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/prop/@name">/catalog/metadata/role/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/prop/@uuid">/catalog/metadata/role/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/prop/@ns">/catalog/metadata/role/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/prop/@value">/catalog/metadata/role/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/prop/@class">/catalog/metadata/role/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/prop/remarks">/catalog/metadata/role/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/role/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/role/link">/catalog/metadata/role/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/link/@href">/catalog/metadata/role/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/link/@rel">/catalog/metadata/role/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/link/@media-type">/catalog/metadata/role/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/role/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/role/link/text">/catalog/metadata/role/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/role/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/role/remarks">/catalog/metadata/role/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/location" class="toc3 head">location</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/location">/catalog/metadata/location</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/@uuid">/catalog/metadata/location/@uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/title">/catalog/metadata/location/title</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/address"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/address" class="toc4 head">address</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/address">/catalog/metadata/location/address</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/address/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/address/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/address/@type">/catalog/metadata/location/address/@type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/address/addr-lines"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/address/addr-line" class="toc5 head">addr-line</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/address/addr-line">/catalog/metadata/location/address/addr-line</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/address/city"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/address/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/address/city">/catalog/metadata/location/address/city</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/address/state"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/address/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/address/state">/catalog/metadata/location/address/state</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/address/postal-code"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/address/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/address/postal-code">/catalog/metadata/location/address/postal-code</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/address/country"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/address/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/address/country">/catalog/metadata/location/address/country</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/email-addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/email-address" class="toc4 head">email-address</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/email-address">/catalog/metadata/location/email-address</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/telephone-numbers"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/telephone-number" class="toc4 head">telephone-number</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/telephone-number">/catalog/metadata/location/telephone-number</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/telephone-numbers/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/telephone-number/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/telephone-number/@type">/catalog/metadata/location/telephone-number/@type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/urls"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/url" class="toc4 head">url</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/url">/catalog/metadata/location/url</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/prop">/catalog/metadata/location/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/prop/@name">/catalog/metadata/location/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/prop/@uuid">/catalog/metadata/location/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/prop/@ns">/catalog/metadata/location/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/prop/@value">/catalog/metadata/location/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/prop/@class">/catalog/metadata/location/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/prop/remarks">/catalog/metadata/location/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/link">/catalog/metadata/location/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/link/@href">/catalog/metadata/location/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/link/@rel">/catalog/metadata/location/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/link/@media-type">/catalog/metadata/location/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/location/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/location/link/text">/catalog/metadata/location/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/locations/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/location/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/location/remarks">/catalog/metadata/location/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/party" class="toc3 head">party</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/party">/catalog/metadata/party</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/@uuid">/catalog/metadata/party/@uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/@type" class="toc4 head">@type</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/@type">/catalog/metadata/party/@type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/name">/catalog/metadata/party/name</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/short-name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/short-name">/catalog/metadata/party/short-name</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/external-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/external-id" class="toc4 head">external-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/external-id">/catalog/metadata/party/external-id</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/external-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/external-id/@scheme" class="toc5 head">@scheme</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/external-id/@scheme">/catalog/metadata/party/external-id/@scheme</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/prop">/catalog/metadata/party/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/prop/@name">/catalog/metadata/party/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/prop/@uuid">/catalog/metadata/party/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/prop/@ns">/catalog/metadata/party/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/prop/@value">/catalog/metadata/party/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/prop/@class">/catalog/metadata/party/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/prop/remarks">/catalog/metadata/party/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/link">/catalog/metadata/party/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/link/@href">/catalog/metadata/party/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/link/@rel">/catalog/metadata/party/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/link/@media-type">/catalog/metadata/party/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/link/text">/catalog/metadata/party/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/email-addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/email-address" class="toc4 head">email-address</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/email-address">/catalog/metadata/party/email-address</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/telephone-numbers"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/telephone-number" class="toc4 head">telephone-number</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/telephone-number">/catalog/metadata/party/telephone-number</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/telephone-numbers/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/telephone-number/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/telephone-number/@type">/catalog/metadata/party/telephone-number/@type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/address" class="toc4 head">address</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/address">/catalog/metadata/party/address</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/addresses/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/address/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/address/@type">/catalog/metadata/party/address/@type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/addresses/addr-lines"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/address/addr-line" class="toc5 head">addr-line</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/address/addr-line">/catalog/metadata/party/address/addr-line</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/addresses/city"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/address/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/address/city">/catalog/metadata/party/address/city</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/addresses/state"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/address/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/address/state">/catalog/metadata/party/address/state</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/addresses/postal-code"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/address/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/address/postal-code">/catalog/metadata/party/address/postal-code</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/addresses/country"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/party/address/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/party/address/country">/catalog/metadata/party/address/country</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/location-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/location-uuid" class="toc4 head">location-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/location-uuid">/catalog/metadata/party/location-uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/member-of-organizations"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/member-of-organization" class="toc4 head">member-of-organization</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/member-of-organization">/catalog/metadata/party/member-of-organization</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/parties/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/party/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/party/remarks">/catalog/metadata/party/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/responsible-party" class="toc3 head">responsible-party</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party">/catalog/metadata/responsible-party</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/responsible-party/@role-id" class="toc4 head">@role-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/@role-id">/catalog/metadata/responsible-party/@role-id</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/responsible-party/party-uuid" class="toc4 head">party-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/party-uuid">/catalog/metadata/responsible-party/party-uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/responsible-party/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/prop">/catalog/metadata/responsible-party/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/prop/@name">/catalog/metadata/responsible-party/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/prop/@uuid">/catalog/metadata/responsible-party/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/prop/@ns">/catalog/metadata/responsible-party/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/prop/@value">/catalog/metadata/responsible-party/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/prop/@class">/catalog/metadata/responsible-party/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/prop/remarks">/catalog/metadata/responsible-party/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/responsible-party/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/link">/catalog/metadata/responsible-party/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/link/@href">/catalog/metadata/responsible-party/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/link/@rel">/catalog/metadata/responsible-party/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/link/@media-type">/catalog/metadata/responsible-party/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/metadata/responsible-party/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/link/text">/catalog/metadata/responsible-party/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/metadata/responsible-parties/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/metadata/responsible-party/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/metadata/responsible-party/remarks">/catalog/metadata/responsible-party/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/metadata/remarks"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/metadata/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/metadata/remarks">/catalog/metadata/remarks</a> in the element map.</p>
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
            <div class="crosslink"><a href="../json-reference/#/catalog/params"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/catalog/param" class="toc2 head">param</h2>
         </div>
         <p>See <a href="../xml-outline/#/catalog/param">/catalog/param</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Parameter</p>
               <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
               <p>An element </p>
            </div>
            <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
            
            --&gt;      
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
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
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/id"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/@id" class="toc3 head">@id</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/@id">/catalog/param/@id</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Parameter Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
               </div>
               <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                  is document scoped and is intended to be consistent for the same parameter across
                  minor revisions of the document.</p>
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/class"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/@class" class="toc3 head">@class</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/@class">/catalog/param/@class</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Parameter Class</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
               </div>
               <p class="description">A textual label that provides a characterization of the parameter.</p>
               
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
               <div class="crosslink"><a href="../json-reference/#/catalog/params/depends-on"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/@depends-on" class="toc3 head">@depends-on</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/@depends-on">/catalog/param/@depends-on</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Depends on</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
               </div>
               <p class="description">Another parameter invoking this one</p>
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/prop">/catalog/param/prop</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/prop/@name">/catalog/param/prop/@name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/prop/@uuid">/catalog/param/prop/@uuid</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/prop/@ns">/catalog/param/prop/@ns</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">A namespace qualifying the property's name. This allows different organizations to
                     associate distinct semantics with the same name.</p>
                  
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/prop/@value">/catalog/param/prop/@value</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/prop/@class">/catalog/param/prop/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
                  
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/prop/remarks">/catalog/param/prop/remarks</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/link">/catalog/param/link</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Link</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/link/@href">/catalog/param/link/@href</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
                  
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/link/@rel">/catalog/param/link/@rel</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/link/@media-type">/catalog/param/link/@media-type</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/link/text">/catalog/param/link/text</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/label"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/label" class="toc3 head">label</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/label">/catalog/param/label</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Parameter Label</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
               </div>
               <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                  a <code>value</code> if no value is assigned.</p>
               <div class="value" id="">
                  <p>Value: A markup-line </p>
               </div>
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>The label value should be suitable for inline display in a rendered catalog.</p>
                  </div>
                  <div class="remarks">
                     <p>The label value should be suitable for inline display in a rendered catalog.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/usage"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/usage" class="toc3 head">usage</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/usage">/catalog/param/usage</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Parameter Usage Description</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
               </div>
               <p class="description">Describes the purpose and use of a parameter</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/constraints"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/constraint" class="toc3 head">constraint</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/constraint">/catalog/param/constraint</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Constraint</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A formal or informal expression of a constraint or test</p>
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/constraints/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/constraint/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/constraint/description">/catalog/param/constraint/description</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Constraint Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">A textual summary of the constraint to be applied.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/constraints/tests"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/constraint/test" class="toc4 head">test</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/constraint/test">/catalog/param/constraint/test</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Constraint Test</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/params/constraints/tests/expression"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/param/constraint/test/expression" class="toc5 head">expression</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/param/constraint/test/expression">/catalog/param/constraint/test/expression</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Constraint test</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A formal (executable) expression of a constraint</p>
                     <div class="value" id="">
                        <p>Value: A string </p>
                     </div>
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/params/constraints/tests/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/param/constraint/test/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/param/constraint/test/remarks">/catalog/param/constraint/test/remarks</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/guidelines"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/guideline" class="toc3 head">guideline</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/guideline">/catalog/param/guideline</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Guideline</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/values"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/value" class="toc3 head">value</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/value">/catalog/param/value</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Parameter Value</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element of type <a href="link.to.string">string</a></p>
               </div>
               <p class="description">A parameter value or set of values.</p>
               <div class="value" id="">
                  <p>Value: A string </p>
               </div>
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks in-use">
                     <p class="nb">(In use)</p>
                     <p>A set of values provided in a catalog can be redefined at any higher layer of OSCAL
                        (e.g., Profile).</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/select"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/select" class="toc3 head">select</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/select">/catalog/param/select</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Selection</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Presenting a choice among alternatives</p>
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks in-use">
                     <p class="nb">(In use)</p>
                     <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                  </div>
                  <div class="remarks">
                     <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/select/how-many"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/select/@how-many" class="toc4 head">@how-many</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/select/@how-many">/catalog/param/select/@how-many</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Parameter Cardinality</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">Describes the number of selections that must occur.</p>
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/params/select/choice"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/param/select/choice" class="toc4 head">choice</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/param/select/choice">/catalog/param/select/choice</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Choice</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A value selection among several such options</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/params/remarks"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/param/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/param/remarks">/catalog/param/remarks</a> in the element map.</p>
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
               
               --&gt;      </div>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/catalog/controls"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/catalog/control" class="toc2 head">control</h2>
         </div>
         <p>See <a href="../xml-outline/#/catalog/control">/catalog/control</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Control</p>
               <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
               <p>An element </p>
            </div>
            <p class="description">A structured information object representing a security or privacy control. Each security
               or privacy control within the Catalog is defined by a distinct control instance.</p>
            
            --&gt;      
            
            --&gt;      
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>Controls may be grouped using <code>group</code>, and controls may be partitioned using <code>part</code> or further enhanced (extended) using <code>control</code>.</p>
                  <p>A control must have a part with the name "statement", which represents the textual
                     narrative of the control. This "statement" part must occur only once, but may have
                     nested parts to allow for multiple paragraphs or sections of text.</p>
               </div>
            </details>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/id"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/@id" class="toc3 head">@id</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/@id">/catalog/control/@id</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Control Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
               </div>
               <p class="description">A unique identifier for a specific control instance that can be used to reference
                  the control in other OSCAL documents. This identifier's uniqueness is document scoped
                  and is intended to be consistent for the same control across minor revisions of the
                  document.</p>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/class"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/@class" class="toc3 head">@class</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/@class">/catalog/control/@class</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Control Class</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
               </div>
               <p class="description">A textual label that provides a sub-type or characterization of the control.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                        a specific <code>class</code> value.</p>
                     <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                        content.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/title"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/title">/catalog/control/title</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Control Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
               </div>
               <p class="description">A name given to the control, which may be used by a tool for display and navigation.</p>
               <div class="value" id="">
                  <p>Value: A markup-line </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/params"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/param" class="toc3 head">param</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/param">/catalog/control/param</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Parameter</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
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
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/@id">/catalog/control/param/@id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Parameter Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                     is document scoped and is intended to be consistent for the same parameter across
                     minor revisions of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/@class">/catalog/control/param/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Parameter Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a characterization of the parameter.</p>
                  
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/depends-on"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/@depends-on" class="toc4 head">@depends-on</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/@depends-on">/catalog/control/param/@depends-on</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Depends on</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">Another parameter invoking this one</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/prop">/catalog/control/param/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/prop/@name">/catalog/control/param/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/prop/@uuid">/catalog/control/param/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/prop/@ns">/catalog/control/param/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/prop/@value">/catalog/control/param/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/prop/@class">/catalog/control/param/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/prop/remarks">/catalog/control/param/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/link">/catalog/control/param/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/link/@href">/catalog/control/param/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/link/@rel">/catalog/control/param/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/link/@media-type">/catalog/control/param/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/link/text">/catalog/control/param/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/label"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/label" class="toc4 head">label</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/label">/catalog/control/param/label</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Parameter Label</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                     a <code>value</code> if no value is assigned.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The label value should be suitable for inline display in a rendered catalog.</p>
                     </div>
                     <div class="remarks">
                        <p>The label value should be suitable for inline display in a rendered catalog.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/usage"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/usage" class="toc4 head">usage</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/usage">/catalog/control/param/usage</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Parameter Usage Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Describes the purpose and use of a parameter</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/constraints"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/constraint" class="toc4 head">constraint</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/constraint">/catalog/control/param/constraint</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Constraint</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A formal or informal expression of a constraint or test</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/constraints/description"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/constraint/description" class="toc5 head">description</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/constraint/description">/catalog/control/param/constraint/description</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Constraint Description</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">A textual summary of the constraint to be applied.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/constraints/tests"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/constraint/test" class="toc5 head">test</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/constraint/test">/catalog/control/param/constraint/test</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Constraint Test</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/constraints/tests/expression"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/control/param/constraint/test/expression" class="toc6 head">expression</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/control/param/constraint/test/expression">/catalog/control/param/constraint/test/expression</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Constraint test</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An element of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">A formal (executable) expression of a constraint</p>
                        <div class="value" id="">
                           <p>Value: A string </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/constraints/tests/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/control/param/constraint/test/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/control/param/constraint/test/remarks">/catalog/control/param/constraint/test/remarks</a> in the element map.</p>
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
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/guidelines"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/guideline" class="toc4 head">guideline</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/guideline">/catalog/control/param/guideline</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Guideline</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/values"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/value" class="toc4 head">value</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/value">/catalog/control/param/value</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Parameter Value</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">A parameter value or set of values.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A set of values provided in a catalog can be redefined at any higher layer of OSCAL
                           (e.g., Profile).</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/select"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/select" class="toc4 head">select</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/select">/catalog/control/param/select</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Selection</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Presenting a choice among alternatives</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                     </div>
                     <div class="remarks">
                        <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/select/how-many"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/select/@how-many" class="toc5 head">@how-many</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/select/@how-many">/catalog/control/param/select/@how-many</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Parameter Cardinality</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Describes the number of selections that must occur.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/select/choice"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/param/select/choice" class="toc5 head">choice</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/param/select/choice">/catalog/control/param/select/choice</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Choice</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A value selection among several such options</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/params/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/param/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/param/remarks">/catalog/control/param/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/prop">/catalog/control/prop</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/prop/@name">/catalog/control/prop/@name</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/prop/@uuid">/catalog/control/prop/@uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/prop/@ns">/catalog/control/prop/@ns</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/prop/@value">/catalog/control/prop/@value</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/prop/@class">/catalog/control/prop/@class</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/prop/remarks">/catalog/control/prop/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/link">/catalog/control/link</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/link/@href">/catalog/control/link/@href</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/link/@rel">/catalog/control/link/@rel</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/link/@media-type">/catalog/control/link/@media-type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/link/text">/catalog/control/link/text</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/part" class="toc3 head">part</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/part">/catalog/control/part</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Part</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A partition of a control's definition or a child of another part.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                        (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                        hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                     <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                        within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                        a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                     <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                        <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                        Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                        Each organization is responsible for governance of their own extensions, and is strongly
                        encouraged to publish their extensions as standards to their user community. If no
                        <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                     <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                        DNS or other globally defined organization name should be used. For example, if FedRAMP
                        and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                     <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                        extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                        extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/@id">/catalog/control/part/@id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                     document scoped and is intended to be consistent for the same part across minor revisions
                     of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/@name">/catalog/control/part/@name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/@ns">/catalog/control/part/@ns</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                     distinct semantics with the same name.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                           names and associated text used in a part. This allows the semantics associated with
                           a given name to be defined on an organization-by-organization basis.</p>
                        <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                        <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/@class">/catalog/control/part/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                        <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                           content.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/title">/catalog/control/part/title</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Part Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/prop">/catalog/control/part/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/prop/@name">/catalog/control/part/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/prop/@uuid">/catalog/control/part/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/prop/@ns">/catalog/control/part/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/prop/@value">/catalog/control/part/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/prop/@class">/catalog/control/part/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/prop/remarks">/catalog/control/part/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/parts"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/part" class="toc4 head">part</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/part">/catalog/control/part/part</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Part</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A partition of a control's definition or a child of another part.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                           (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                           hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                        <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                           within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                           a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                        <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                           <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                           Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                           Each organization is responsible for governance of their own extensions, and is strongly
                           encouraged to publish their extensions as standards to their user community. If no
                           <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                        <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                           DNS or other globally defined organization name should be used. For example, if FedRAMP
                           and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                        <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                           extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                           extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/control/part/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/control/part/link">/catalog/control/part/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/link/@href">/catalog/control/part/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/link/@rel">/catalog/control/part/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/link/@media-type">/catalog/control/part/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/controls/parts/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/control/part/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/control/part/link/text">/catalog/control/part/link/text</a> in the element map.</p>
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
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/controls/controls"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/control/control" class="toc3 head">control</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/control/control">/catalog/control/control</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Control</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A structured information object representing a security or privacy control. Each security
                  or privacy control within the Catalog is defined by a distinct control instance.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Controls may be grouped using <code>group</code>, and controls may be partitioned using <code>part</code> or further enhanced (extended) using <code>control</code>.</p>
                     <p>A control must have a part with the name "statement", which represents the textual
                        narrative of the control. This "statement" part must occur only once, but may have
                        nested parts to allow for multiple paragraphs or sections of text.</p>
                  </div>
               </details>
            </div>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/catalog/groups"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/catalog/group" class="toc2 head">group</h2>
         </div>
         <p>See <a href="../xml-outline/#/catalog/group">/catalog/group</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Control Group</p>
               <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
               <p>An element </p>
            </div>
            <p class="description">A group of controls, or of groups of controls.</p>
            
            --&gt;      
            
            --&gt;      
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>Catalogs can use a <code>group</code> to collect related controls into a single grouping. That can be useful to group controls
                     into a family or other logical grouping.</p>
                  <p>A <code>group</code> may have its own properties, statements, parameters, and references, which are inherited
                     by all members of that group.</p>
               </div>
            </details>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/id"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/@id" class="toc3 head">@id</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/@id">/catalog/group/@id</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Group Identifier</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
               </div>
               <p class="description">A unique identifier for a specific group instance that can be used to reference the
                  group within this and in other OSCAL documents. This identifier's uniqueness is document
                  scoped and is intended to be consistent for the same group across minor revisions
                  of the document.</p>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/class"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/@class" class="toc3 head">@class</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/@class">/catalog/group/@class</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Group Class</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
               </div>
               <p class="description">A textual label that provides a sub-type or characterization of the group.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                        a specific <code>class</code> value.</p>
                     <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                        content.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/title"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/title">/catalog/group/title</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Group Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
               </div>
               <p class="description">A name given to the group, which may be used by a tool for display and navigation.</p>
               <div class="value" id="">
                  <p>Value: A markup-line </p>
               </div>
               
               --&gt;      
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/params"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/param" class="toc3 head">param</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/param">/catalog/group/param</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Parameter</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
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
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/@id">/catalog/group/param/@id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Parameter Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                     is document scoped and is intended to be consistent for the same parameter across
                     minor revisions of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/@class">/catalog/group/param/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Parameter Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a characterization of the parameter.</p>
                  
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/depends-on"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/@depends-on" class="toc4 head">@depends-on</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/@depends-on">/catalog/group/param/@depends-on</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Depends on</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">Another parameter invoking this one</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/prop">/catalog/group/param/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/prop/@name">/catalog/group/param/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/prop/@uuid">/catalog/group/param/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/prop/@ns">/catalog/group/param/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/prop/@value">/catalog/group/param/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/prop/@class">/catalog/group/param/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/prop/remarks">/catalog/group/param/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/link">/catalog/group/param/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/link/@href">/catalog/group/param/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/link/@rel">/catalog/group/param/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/link/@media-type">/catalog/group/param/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/link/text">/catalog/group/param/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/label"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/label" class="toc4 head">label</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/label">/catalog/group/param/label</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Parameter Label</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                     a <code>value</code> if no value is assigned.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>The label value should be suitable for inline display in a rendered catalog.</p>
                     </div>
                     <div class="remarks">
                        <p>The label value should be suitable for inline display in a rendered catalog.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/usage"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/usage" class="toc4 head">usage</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/usage">/catalog/group/param/usage</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Parameter Usage Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                  </div>
                  <p class="description">Describes the purpose and use of a parameter</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/constraints"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/constraint" class="toc4 head">constraint</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/constraint">/catalog/group/param/constraint</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Constraint</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A formal or informal expression of a constraint or test</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/constraints/description"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/constraint/description" class="toc5 head">description</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/constraint/description">/catalog/group/param/constraint/description</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Constraint Description</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">A textual summary of the constraint to be applied.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/constraints/tests"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/constraint/test" class="toc5 head">test</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/constraint/test">/catalog/group/param/constraint/test</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Constraint Test</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/constraints/tests/expression"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/param/constraint/test/expression" class="toc6 head">expression</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/param/constraint/test/expression">/catalog/group/param/constraint/test/expression</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Constraint test</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An element of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">A formal (executable) expression of a constraint</p>
                        <div class="value" id="">
                           <p>Value: A string </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/constraints/tests/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/param/constraint/test/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/param/constraint/test/remarks">/catalog/group/param/constraint/test/remarks</a> in the element map.</p>
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
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/guidelines"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/guideline" class="toc4 head">guideline</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/guideline">/catalog/group/param/guideline</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Guideline</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/values"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/value" class="toc4 head">value</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/value">/catalog/group/param/value</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Parameter Value</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">A parameter value or set of values.</p>
                  <div class="value" id="">
                     <p>Value: A string </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A set of values provided in a catalog can be redefined at any higher layer of OSCAL
                           (e.g., Profile).</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/select"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/select" class="toc4 head">select</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/select">/catalog/group/param/select</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Selection</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Presenting a choice among alternatives</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                     </div>
                     <div class="remarks">
                        <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/select/how-many"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/select/@how-many" class="toc5 head">@how-many</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/select/@how-many">/catalog/group/param/select/@how-many</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Parameter Cardinality</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Describes the number of selections that must occur.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/select/choice"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/param/select/choice" class="toc5 head">choice</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/param/select/choice">/catalog/group/param/select/choice</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Choice</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A value selection among several such options</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/params/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/param/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/param/remarks">/catalog/group/param/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/prop">/catalog/group/prop</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/prop/@name">/catalog/group/prop/@name</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/prop/@uuid">/catalog/group/prop/@uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/prop/@ns">/catalog/group/prop/@ns</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/prop/@value">/catalog/group/prop/@value</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/prop/@class">/catalog/group/prop/@class</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/prop/remarks">/catalog/group/prop/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/link">/catalog/group/link</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/link/@href">/catalog/group/link/@href</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/link/@rel">/catalog/group/link/@rel</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/link/@media-type">/catalog/group/link/@media-type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/link/text">/catalog/group/link/text</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/part" class="toc3 head">part</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/part">/catalog/group/part</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Part</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A partition of a control's definition or a child of another part.</p>
               <div class="value" id="">
                  <p>Value: A markup-multiline </p>
               </div>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                        (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                        hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                     <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                        within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                        a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                     <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                        <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                        Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                        Each organization is responsible for governance of their own extensions, and is strongly
                        encouraged to publish their extensions as standards to their user community. If no
                        <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                     <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                        DNS or other globally defined organization name should be used. For example, if FedRAMP
                        and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                     <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                        extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                        extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/@id">/catalog/group/part/@id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                     document scoped and is intended to be consistent for the same part across minor revisions
                     of the document.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/@name">/catalog/group/part/@name</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/@ns">/catalog/group/part/@ns</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                     distinct semantics with the same name.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                           names and associated text used in a part. This allows the semantics associated with
                           a given name to be defined on an organization-by-organization basis.</p>
                        <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                           to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                        <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/@class">/catalog/group/part/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Part Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                        <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                           content.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/title">/catalog/group/part/title</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Part Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/prop">/catalog/group/part/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/prop/@name">/catalog/group/part/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/prop/@uuid">/catalog/group/part/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/prop/@ns">/catalog/group/part/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/prop/@value">/catalog/group/part/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/prop/@class">/catalog/group/part/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/prop/remarks">/catalog/group/part/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/parts"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/part" class="toc4 head">part</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/part">/catalog/group/part/part</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Part</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A partition of a control's definition or a child of another part.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                           (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                           hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                        <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                           within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                           a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                        <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                           <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                           Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                           Each organization is responsible for governance of their own extensions, and is strongly
                           encouraged to publish their extensions as standards to their user community. If no
                           <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                        <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                           DNS or other globally defined organization name should be used. For example, if FedRAMP
                           and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                        <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                           extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                           extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/part/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/part/link">/catalog/group/part/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/link/@href">/catalog/group/part/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/link/@rel">/catalog/group/part/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/link/@media-type">/catalog/group/part/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/parts/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/part/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/part/link/text">/catalog/group/part/link/text</a> in the element map.</p>
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
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/groups"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/group" class="toc3 head">group</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/group">/catalog/group/group</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Control Group</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A group of controls, or of groups of controls.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Catalogs can use a <code>group</code> to collect related controls into a single grouping. That can be useful to group controls
                        into a family or other logical grouping.</p>
                     <p>A <code>group</code> may have its own properties, statements, parameters, and references, which are inherited
                        by all members of that group.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/group/control" class="toc3 head">control</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/group/control">/catalog/group/control</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Control</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A structured information object representing a security or privacy control. Each security
                  or privacy control within the Catalog is defined by a distinct control instance.</p>
               
               --&gt;      
               
               --&gt;      
               
               --&gt;      
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Controls may be grouped using <code>group</code>, and controls may be partitioned using <code>part</code> or further enhanced (extended) using <code>control</code>.</p>
                     <p>A control must have a part with the name "statement", which represents the textual
                        narrative of the control. This "statement" part must occur only once, but may have
                        nested parts to allow for multiple paragraphs or sections of text.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/@id">/catalog/group/control/@id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Control Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A unique identifier for a specific control instance that can be used to reference
                     the control in other OSCAL documents. This identifier's uniqueness is document scoped
                     and is intended to be consistent for the same control across minor revisions of the
                     document.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/@class">/catalog/group/control/@class</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Control Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the control.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                           a specific <code>class</code> value.</p>
                        <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                           content.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/title">/catalog/group/control/title</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Control Title</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                  </div>
                  <p class="description">A name given to the control, which may be used by a tool for display and navigation.</p>
                  <div class="value" id="">
                     <p>Value: A markup-line </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/param" class="toc4 head">param</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/param">/catalog/group/control/param</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Parameter</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
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
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/@id" class="toc5 head">@id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/@id">/catalog/group/control/param/@id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Parameter Identifier</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                        is document scoped and is intended to be consistent for the same parameter across
                        minor revisions of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/@class">/catalog/group/control/param/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Parameter Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a characterization of the parameter.</p>
                     
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/depends-on"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/@depends-on" class="toc5 head">@depends-on</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/@depends-on">/catalog/group/control/param/@depends-on</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Depends on</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Another parameter invoking this one</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/prop">/catalog/group/control/param/prop</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/prop/@name">/catalog/group/control/param/prop/@name</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/prop/@uuid">/catalog/group/control/param/prop/@uuid</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/prop/@ns">/catalog/group/control/param/prop/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/prop/@value">/catalog/group/control/param/prop/@value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/prop/@class">/catalog/group/control/param/prop/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/prop/remarks">/catalog/group/control/param/prop/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/link">/catalog/group/control/param/link</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/link/@href">/catalog/group/control/param/link/@href</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/link/@rel">/catalog/group/control/param/link/@rel</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/link/@media-type">/catalog/group/control/param/link/@media-type</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/link/text">/catalog/group/control/param/link/text</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/label"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/label" class="toc5 head">label</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/label">/catalog/group/control/param/label</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Parameter Label</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                        a <code>value</code> if no value is assigned.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>The label value should be suitable for inline display in a rendered catalog.</p>
                        </div>
                        <div class="remarks">
                           <p>The label value should be suitable for inline display in a rendered catalog.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/usage"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/usage" class="toc5 head">usage</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/usage">/catalog/group/control/param/usage</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Parameter Usage Description</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                     </div>
                     <p class="description">Describes the purpose and use of a parameter</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/constraints"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/constraint" class="toc5 head">constraint</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/constraint">/catalog/group/control/param/constraint</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Constraint</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A formal or informal expression of a constraint or test</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/constraints/description"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/constraint/description" class="toc6 head">description</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/constraint/description">/catalog/group/control/param/constraint/description</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Constraint Description</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element of type <a href="link.to.markup-multiline">markup-multiline</a></p>
                        </div>
                        <p class="description">A textual summary of the constraint to be applied.</p>
                        <div class="value" id="">
                           <p>Value: A markup-multiline </p>
                        </div>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/constraints/tests"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/constraint/test" class="toc6 head">test</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/constraint/test">/catalog/group/control/param/constraint/test</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Constraint Test</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/constraints/tests/expression"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/catalog/group/control/param/constraint/test/expression" class="toc7 head">expression</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/catalog/group/control/param/constraint/test/expression">/catalog/group/control/param/constraint/test/expression</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Constraint test</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An element of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">A formal (executable) expression of a constraint</p>
                           <div class="value" id="">
                              <p>Value: A string </p>
                           </div>
                           
                           --&gt;      
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/constraints/tests/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/catalog/group/control/param/constraint/test/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/catalog/group/control/param/constraint/test/remarks">/catalog/group/control/param/constraint/test/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/guidelines"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/guideline" class="toc5 head">guideline</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/guideline">/catalog/group/control/param/guideline</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Guideline</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
                     <div class="value" id="">
                        <p>Value: A markup-multiline </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/values"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/value">/catalog/group/control/param/value</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Parameter Value</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A parameter value or set of values.</p>
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
                           <p>A set of values provided in a catalog can be redefined at any higher layer of OSCAL
                              (e.g., Profile).</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/select"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/select" class="toc5 head">select</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/select">/catalog/group/control/param/select</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Selection</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Presenting a choice among alternatives</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks in-use">
                           <p class="nb">(In use)</p>
                           <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                        </div>
                        <div class="remarks">
                           <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/select/how-many"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/select/@how-many" class="toc6 head">@how-many</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/select/@how-many">/catalog/group/control/param/select/@how-many</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Parameter Cardinality</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Describes the number of selections that must occur.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/select/choice"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/param/select/choice" class="toc6 head">choice</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/param/select/choice">/catalog/group/control/param/select/choice</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Choice</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                        </div>
                        <p class="description">A value selection among several such options</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/params/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/param/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/param/remarks">/catalog/group/control/param/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/prop">/catalog/group/control/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/prop/@name">/catalog/group/control/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/prop/@uuid">/catalog/group/control/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/prop/@ns">/catalog/group/control/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/prop/@value">/catalog/group/control/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/prop/@class">/catalog/group/control/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/prop/remarks">/catalog/group/control/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/link">/catalog/group/control/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/link/@href">/catalog/group/control/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/link/@rel">/catalog/group/control/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/link/@media-type">/catalog/group/control/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/link/text">/catalog/group/control/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/part" class="toc4 head">part</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/part">/catalog/group/control/part</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Part</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A partition of a control's definition or a child of another part.</p>
                  <div class="value" id="">
                     <p>Value: A markup-multiline </p>
                  </div>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                           (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                           hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                        <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                           within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                           a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                        <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                           <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                           Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                           Each organization is responsible for governance of their own extensions, and is strongly
                           encouraged to publish their extensions as standards to their user community. If no
                           <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                        <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                           DNS or other globally defined organization name should be used. For example, if FedRAMP
                           and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                        <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                           extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                           extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/@id" class="toc5 head">@id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/@id">/catalog/group/control/part/@id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Part Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                        document scoped and is intended to be consistent for the same part across minor revisions
                        of the document.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/@name">/catalog/group/control/part/@name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Part Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/@ns">/catalog/group/control/part/@ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Part Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                        distinct semantics with the same name.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>Provides a means to segment the value space for the <code>name</code>, so that different organizations and individuals can assert control over the allowed
                              names and associated text used in a part. This allows the semantics associated with
                              a given name to be defined on an organization-by-organization basis.</p>
                           <p>An organization MUST use a URI that they have control over. e.g., a domain registered
                              to the organization in a URI, a registered uniform resource names (URN) namespace.</p>
                           <p>When a <code>ns</code> is not provided, its value should be assumed to be <code>http://csrc.nist.gov/ns/oscal</code> and the name should be a name defined by the associated OSCAL model.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/@class">/catalog/group/control/part/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Part Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>class</code> can be used in validation rules to express extra constraints over named items of
                              a specific <code>class</code> value.</p>
                           <p>A <code>class</code> can also be used in an OSCAL profile as a means to target an alteration to control
                              content.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/title"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/title" class="toc5 head">title</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/title">/catalog/group/control/part/title</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Part Title</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/prop">/catalog/group/control/part/prop</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/prop/@name">/catalog/group/control/part/prop/@name</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/prop/@uuid">/catalog/group/control/part/prop/@uuid</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/prop/@ns">/catalog/group/control/part/prop/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/prop/@value">/catalog/group/control/part/prop/@value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/prop/@class">/catalog/group/control/part/prop/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/prop/remarks">/catalog/group/control/part/prop/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/parts"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/part" class="toc5 head">part</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/part">/catalog/group/control/part/part</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Part</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A partition of a control's definition or a child of another part.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>A <code>part</code> provides for logical partitioning of prose, and can be thought of as a grouping structure
                              (e.g., section). A <code>part</code> can have child parts allowing for arbitrary nesting of prose content (e.g., statement
                              hierarchy). A <code>part</code> can contain <code>prop</code> objects that allow for enriching prose text with structured name/value information.</p>
                           <p>A <code>part</code> can be assigned an optional <code>id</code>, which allows for internal and external references to the textual concept contained
                              within a <code>part</code>. A <code>id</code> provides a means for an OSCAL profile, or a higher layer OSCAL model to reference
                              a specific part within a <code>catalog</code>. For example, an <code>id</code> can be used to reference or to make modifications to a control statement in a profile.</p>
                           <p>Use of <code>part</code> and <code>prop</code> provides for a wide degree of extensibility within the OSCAL catalog model. The optional
                              <code>ns</code> provides a means to qualify a part's <code>name</code>, allowing for organization-specific vocabularies to be defined with clear semantics.
                              Any organization that extends OSCAL in this way should consistently assign a <code>ns</code> value that represents the organization, making a given namespace qualified <code>name</code> unique to that organization. This allows the combination of <code>ns</code> and <code>name</code> to always be unique and unambiguous, even when mixed with extensions from other organizations.
                              Each organization is responsible for governance of their own extensions, and is strongly
                              encouraged to publish their extensions as standards to their user community. If no
                              <code>ns</code> is provided, the name is expected to be in the "OSCAL" namespace.</p>
                           <p>To ensure a <code>ns</code> is unique to an organization and naming conflicts are avoided, a URI containing a
                              DNS or other globally defined organization name should be used. For example, if FedRAMP
                              and DoD both extend OSCAL, FedRAMP will use the <code>ns</code> "https://fedramp.gov", while DoD will use the <code>ns</code> "https://defense.gov" for any organization specific <code>name</code>. </p>
                           <p>Tools that process OSCAL content are not required to interpret unrecognized OSCAL
                              extensions; however, OSCAL compliant tools should not modify or remove unrecognized
                              extensions, unless there is a compelling reason to do so, such as data sensitivity.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/group/control/part/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/group/control/part/link">/catalog/group/control/part/link</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/link/@href">/catalog/group/control/part/link/@href</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/link/@rel">/catalog/group/control/part/link/@rel</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/link/@media-type">/catalog/group/control/part/link/@media-type</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/parts/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/group/control/part/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/group/control/part/link/text">/catalog/group/control/part/link/text</a> in the element map.</p>
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
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/catalog/groups/controls/controls"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/group/control/control" class="toc4 head">control</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/group/control/control">/catalog/group/control/control</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Control</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A structured information object representing a security or privacy control. Each security
                     or privacy control within the Catalog is defined by a distinct control instance.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Controls may be grouped using <code>group</code>, and controls may be partitioned using <code>part</code> or further enhanced (extended) using <code>control</code>.</p>
                        <p>A control must have a part with the name "statement", which represents the textual
                           narrative of the control. This "statement" part must occur only once, but may have
                           nested parts to allow for multiple paragraphs or sections of text.</p>
                     </div>
                  </details>
               </div>
            </section>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/catalog/back-matter"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/catalog/back-matter" class="toc2 head">back-matter</h2>
         </div>
         <p>See <a href="../xml-outline/#/catalog/back-matter">/catalog/back-matter</a> in the element map.</p>
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
               <div class="remarks in-use">
                  <p class="nb">(In use)</p>
                  <p>Back matter including references and resources.</p>
               </div>
               <div class="remarks">
                  <p>Provides a collection of identified <code>resource</code> objects that can be referenced by a <code>link</code> with a <code>rel</code> value of "reference" and an <code>href</code> value that is a fragment "#" followed by a reference to a reference identifier. Other
                     specialized link "rel" values also use this pattern when indicated in that context
                     of use.</p>
               </div>
            </details>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/catalog/back-matter/resource" class="toc3 head">resource</h3>
            </div>
            <p>See <a href="../xml-outline/#/catalog/back-matter/resource">/catalog/back-matter/resource</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/@uuid">/catalog/back-matter/resource/@uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/title">/catalog/back-matter/resource/title</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/description">/catalog/back-matter/resource/description</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/prop">/catalog/back-matter/resource/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/prop/@name">/catalog/back-matter/resource/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/prop/@uuid">/catalog/back-matter/resource/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/prop/@ns">/catalog/back-matter/resource/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/prop/@value">/catalog/back-matter/resource/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/prop/@class">/catalog/back-matter/resource/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/prop/remarks">/catalog/back-matter/resource/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/document-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/document-id" class="toc4 head">document-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/document-id">/catalog/back-matter/resource/document-id</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/document-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/document-id/@scheme" class="toc5 head">@scheme</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/document-id/@scheme">/catalog/back-matter/resource/document-id/@scheme</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/citation" class="toc4 head">citation</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation">/catalog/back-matter/resource/citation</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/citation/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/text">/catalog/back-matter/resource/citation/text</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/citation/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/prop">/catalog/back-matter/resource/citation/prop</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/back-matter/resource/citation/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/prop/@name">/catalog/back-matter/resource/citation/prop/@name</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/back-matter/resource/citation/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/prop/@uuid">/catalog/back-matter/resource/citation/prop/@uuid</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/back-matter/resource/citation/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/prop/@ns">/catalog/back-matter/resource/citation/prop/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/back-matter/resource/citation/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/prop/@value">/catalog/back-matter/resource/citation/prop/@value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/back-matter/resource/citation/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/prop/@class">/catalog/back-matter/resource/citation/prop/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/back-matter/resource/citation/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/prop/remarks">/catalog/back-matter/resource/citation/prop/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/citation/biblio"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/citation/biblio" class="toc5 head">biblio</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/citation/biblio">/catalog/back-matter/resource/citation/biblio</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/rlinks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/rlink" class="toc4 head">rlink</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/rlink">/catalog/back-matter/resource/rlink</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/rlinks/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/rlink/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/rlink/@href">/catalog/back-matter/resource/rlink/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/rlinks/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/rlink/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/rlink/@media-type">/catalog/back-matter/resource/rlink/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/rlinks/hashes"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/rlink/hash" class="toc5 head">hash</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/rlink/hash">/catalog/back-matter/resource/rlink/hash</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/rlinks/hashes/algorithm"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/catalog/back-matter/resource/rlink/hash/@algorithm" class="toc6 head">@algorithm</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/catalog/back-matter/resource/rlink/hash/@algorithm">/catalog/back-matter/resource/rlink/hash/@algorithm</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/base64"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/base64" class="toc4 head">base64</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/base64">/catalog/back-matter/resource/base64</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/base64/filename"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/base64/@filename" class="toc5 head">@filename</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/base64/@filename">/catalog/back-matter/resource/base64/@filename</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/base64/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/catalog/back-matter/resource/base64/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/catalog/back-matter/resource/base64/@media-type">/catalog/back-matter/resource/base64/@media-type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/catalog/back-matter/resources/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/catalog/back-matter/resource/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/catalog/back-matter/resource/remarks">/catalog/back-matter/resource/remarks</a> in the element map.</p>
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