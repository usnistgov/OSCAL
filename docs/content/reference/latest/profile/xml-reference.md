---
title: "OSCAL Profile Model XML Format Reference"
heading: "OSCAL Profile Model XML Format Reference"
description: A reference for the OSCAL Profile model XML format.
weight: 60
sidenav:
  title: XML Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
aliases:
  - /docs/schemas/oscal-profile-xml/
  - /documentation/schema/profile/xml-schema/
  - /documentation/schema/profile-layer/profile/xml-schema/
---

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-reference">
   <h2><span class="usa-tag">Schema version:</span> 1.0.0-rc2</h2>
   <section class="xml-element">
      <div class="header">
         <div class="crosslink"><a href="../json-reference/#/profile"><button class="schema-link">Switch to JSON</button></a></div>
         <h1 id="/profile" class="toc1 head">profile</h1>
      </div>
      <p>See <a href="../xml-outline/#/profile">/profile</a> in the element map.</p>
      <div class="obj-desc">
         <div class="obj-matrix">
            <p class="obj-name">element Profile</p>
            <p class="occurrence"><span class="cardinality">[1]</span></p>
            <p>An element </p>
         </div>
         <p class="description">Each OSCAL profile is defined by a Profile element</p>
         <details open="open" class="remarks-group">
            <summary>Remarks</summary>
            <div class="remarks">
               <p>An OSCAL document that describes a tailoring of controls from one or more catalogs,
                  with possible modification of multiple controls. It provides mechanisms by which controls
                  may be selected (<code>import</code>), merged or (re)structured (<code>merge</code>), and amended (<code>modify</code>). OSCAL profiles may select subsets of controls, set parameter values for them in
                  application, and even adjust the representation of controls as given in and by a catalog.
                  They may also serve as sources for further modification in and by other profiles,
                  that import them.</p>
            </div>
            <div class="remarks">
               <p>An OSCAL document that describes a tailoring of controls from one or more catalogs,
                  with possible modification of multiple controls. It provides mechanisms by which controls
                  may be selected (<code>import</code>), merged or (re)structured (<code>merge</code>), and amended (<code>modify</code>). OSCAL profiles may select subsets of controls, set parameter values for them in
                  application, and even adjust the representation of controls as given in and by a catalog.
                  They may also serve as sources for further modification in and by other profiles,
                  that import them.</p>
            </div>
         </details>
      </div>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/profile/uuid"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/profile/@uuid" class="toc2 head">@uuid</h2>
         </div>
         <p>See <a href="../xml-outline/#/profile/@uuid">/profile/@uuid</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">attribute Catalog Universally Unique Identifier</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
            </div>
            <p class="description">A globally unique identifier for this profile instance. This UUID should be changed
               when this document is revised.</p>
         </div>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/profile/metadata"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/profile/metadata" class="toc2 head">metadata</h2>
         </div>
         <p>See <a href="../xml-outline/#/profile/metadata">/profile/metadata</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Publication metadata</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An element </p>
            </div>
            <p class="description">Provides information about the publication and availability of the containing document.</p>
            
            --&gt;      </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/title"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/title">/profile/metadata/title</a> in the element map.</p>
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
               
               --&gt;      </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/published"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/published" class="toc3 head">published</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/published">/profile/metadata/published</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/last-modified"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/last-modified" class="toc3 head">last-modified</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/last-modified">/profile/metadata/last-modified</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/version"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/version" class="toc3 head">version</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/version">/profile/metadata/version</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/oscal-version"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/oscal-version" class="toc3 head">oscal-version</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/oscal-version">/profile/metadata/oscal-version</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/revisions" class="toc3 head">revisions</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/revisions">/profile/metadata/revisions</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element </p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element </p>
               </div>
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/revisions/revision" class="toc4 head">revision</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision">/profile/metadata/revisions/revision</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/title"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/title" class="toc5 head">title</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/title">/profile/metadata/revisions/revision/title</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/published"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/published" class="toc5 head">published</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/published">/profile/metadata/revisions/revision/published</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/last-modified"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/last-modified" class="toc5 head">last-modified</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/last-modified">/profile/metadata/revisions/revision/last-modified</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/version"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/version" class="toc5 head">version</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/version">/profile/metadata/revisions/revision/version</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/oscal-version"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/oscal-version" class="toc5 head">oscal-version</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/oscal-version">/profile/metadata/revisions/revision/oscal-version</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/prop">/profile/metadata/revisions/revision/prop</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/prop/@name">/profile/metadata/revisions/revision/prop/@name</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/prop/@uuid">/profile/metadata/revisions/revision/prop/@uuid</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/prop/@ns">/profile/metadata/revisions/revision/prop/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/prop/@value">/profile/metadata/revisions/revision/prop/@value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/prop/@class">/profile/metadata/revisions/revision/prop/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/prop/remarks">/profile/metadata/revisions/revision/prop/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/link">/profile/metadata/revisions/revision/link</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/link/@href">/profile/metadata/revisions/revision/link/@href</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/link/@rel">/profile/metadata/revisions/revision/link/@rel</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/link/@media-type">/profile/metadata/revisions/revision/link/@media-type</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/metadata/revisions/revision/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/link/text">/profile/metadata/revisions/revision/link/text</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/revisions/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/revisions/revision/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/revisions/revision/remarks">/profile/metadata/revisions/revision/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/document-ids"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/document-id" class="toc3 head">document-id</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/document-id">/profile/metadata/document-id</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/document-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/document-id/@scheme" class="toc4 head">@scheme</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/document-id/@scheme">/profile/metadata/document-id/@scheme</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Document Identification Scheme</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.uri">uri</a></p>
                  </div>
                  <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                     the value of the element will be interpreted as a string of characters. </p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/props"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/prop" class="toc3 head">prop</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/prop">/profile/metadata/prop</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/prop/@name" class="toc4 head">@name</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/prop/@name">/profile/metadata/prop/@name</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/prop/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/prop/@uuid">/profile/metadata/prop/@uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/prop/@ns" class="toc4 head">@ns</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/prop/@ns">/profile/metadata/prop/@ns</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/prop/@value" class="toc4 head">@value</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/prop/@value">/profile/metadata/prop/@value</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/prop/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/prop/@class">/profile/metadata/prop/@class</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/prop/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/prop/remarks">/profile/metadata/prop/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/links"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/link" class="toc3 head">link</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/link">/profile/metadata/link</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/link/@href" class="toc4 head">@href</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/link/@href">/profile/metadata/link/@href</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/link/@rel" class="toc4 head">@rel</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/link/@rel">/profile/metadata/link/@rel</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/link/@media-type" class="toc4 head">@media-type</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/link/@media-type">/profile/metadata/link/@media-type</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/link/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/link/text">/profile/metadata/link/text</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/role" class="toc3 head">role</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/role">/profile/metadata/role</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Role</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
               
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/role/@id" class="toc4 head">@id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/role/@id">/profile/metadata/role/@id</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/role/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/role/title">/profile/metadata/role/title</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/short-name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/role/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/role/short-name">/profile/metadata/role/short-name</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/role/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/role/description">/profile/metadata/role/description</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/role/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/role/prop">/profile/metadata/role/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/prop/@name">/profile/metadata/role/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/prop/@uuid">/profile/metadata/role/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/prop/@ns">/profile/metadata/role/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/prop/@value">/profile/metadata/role/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/prop/@class">/profile/metadata/role/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/prop/remarks">/profile/metadata/role/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/role/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/role/link">/profile/metadata/role/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/link/@href">/profile/metadata/role/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/link/@rel">/profile/metadata/role/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/link/@media-type">/profile/metadata/role/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/role/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/role/link/text">/profile/metadata/role/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/roles/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/role/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/role/remarks">/profile/metadata/role/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/location" class="toc3 head">location</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/location">/profile/metadata/location</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Location</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A location, with associated metadata that can be referenced.</p>
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/@uuid">/profile/metadata/location/@uuid</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/title">/profile/metadata/location/title</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/address"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/address" class="toc4 head">address</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/address">/profile/metadata/location/address</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Address</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A postal address for the location.</p>
                  
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/address/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/address/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/address/@type">/profile/metadata/location/address/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/address/addr-lines"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/address/addr-line" class="toc5 head">addr-line</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/address/addr-line">/profile/metadata/location/address/addr-line</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/address/city"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/address/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/address/city">/profile/metadata/location/address/city</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/address/state"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/address/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/address/state">/profile/metadata/location/address/state</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/address/postal-code"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/address/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/address/postal-code">/profile/metadata/location/address/postal-code</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/address/country"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/address/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/address/country">/profile/metadata/location/address/country</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/email-addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/email-address" class="toc4 head">email-address</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/email-address">/profile/metadata/location/email-address</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/telephone-numbers"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/telephone-number" class="toc4 head">telephone-number</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/telephone-number">/profile/metadata/location/telephone-number</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/telephone-numbers/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/telephone-number/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/telephone-number/@type">/profile/metadata/location/telephone-number/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/urls"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/url" class="toc4 head">url</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/url">/profile/metadata/location/url</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/prop">/profile/metadata/location/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/prop/@name">/profile/metadata/location/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/prop/@uuid">/profile/metadata/location/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/prop/@ns">/profile/metadata/location/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/prop/@value">/profile/metadata/location/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/prop/@class">/profile/metadata/location/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/prop/remarks">/profile/metadata/location/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/link">/profile/metadata/location/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/link/@href">/profile/metadata/location/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/link/@rel">/profile/metadata/location/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/link/@media-type">/profile/metadata/location/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/location/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/location/link/text">/profile/metadata/location/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/locations/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/location/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/location/remarks">/profile/metadata/location/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/party" class="toc3 head">party</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/party">/profile/metadata/party</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Party (organization or person)</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A responsible entity which is either a person or an organization.</p>
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/@uuid">/profile/metadata/party/@uuid</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/type"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/@type" class="toc4 head">@type</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/@type">/profile/metadata/party/@type</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Party Type</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">A category describing the kind of party the object describes.</p>
                  
                  --&gt;      
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/name">/profile/metadata/party/name</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/short-name"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/short-name">/profile/metadata/party/short-name</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/external-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/external-id" class="toc4 head">external-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/external-id">/profile/metadata/party/external-id</a> in the element map.</p>
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
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/external-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/external-id/@scheme" class="toc5 head">@scheme</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/external-id/@scheme">/profile/metadata/party/external-id/@scheme</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute External Identifier Schema</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri">uri</a></p>
                     </div>
                     <p class="description">Indicates the type of external identifier.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/prop">/profile/metadata/party/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/prop/@name">/profile/metadata/party/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/prop/@uuid">/profile/metadata/party/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/prop/@ns">/profile/metadata/party/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/prop/@value">/profile/metadata/party/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/prop/@class">/profile/metadata/party/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/prop/remarks">/profile/metadata/party/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/link">/profile/metadata/party/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/link/@href">/profile/metadata/party/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/link/@rel">/profile/metadata/party/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/link/@media-type">/profile/metadata/party/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/link/text">/profile/metadata/party/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/email-addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/email-address" class="toc4 head">email-address</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/email-address">/profile/metadata/party/email-address</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/telephone-numbers"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/telephone-number" class="toc4 head">telephone-number</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/telephone-number">/profile/metadata/party/telephone-number</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/telephone-numbers/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/telephone-number/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/telephone-number/@type">/profile/metadata/party/telephone-number/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/addresses"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/address" class="toc4 head">address</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/address">/profile/metadata/party/address</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Address</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A postal address for the location.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/addresses/type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/address/@type" class="toc5 head">@type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/address/@type">/profile/metadata/party/address/@type</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                     
                     --&gt;      
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/addresses/addr-lines"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/address/addr-line" class="toc5 head">addr-line</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/address/addr-line">/profile/metadata/party/address/addr-line</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/addresses/city"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/address/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/address/city">/profile/metadata/party/address/city</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/addresses/state"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/address/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/address/state">/profile/metadata/party/address/state</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/addresses/postal-code"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/address/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/address/postal-code">/profile/metadata/party/address/postal-code</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/addresses/country"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/party/address/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/party/address/country">/profile/metadata/party/address/country</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/location-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/location-uuid" class="toc4 head">location-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/location-uuid">/profile/metadata/party/location-uuid</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/member-of-organizations"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/member-of-organization" class="toc4 head">member-of-organization</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/member-of-organization">/profile/metadata/party/member-of-organization</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/parties/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/party/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/party/remarks">/profile/metadata/party/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/responsible-party" class="toc3 head">responsible-party</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/responsible-party">/profile/metadata/responsible-party</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Responsible Party</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A reference to a set of organizations or persons that have responsibility for performing
                  a referenced role in the context of the containing object.</p>
               
               --&gt;      
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/role-id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/responsible-party/@role-id" class="toc4 head">@role-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/@role-id">/profile/metadata/responsible-party/@role-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Responsible Role</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">The role that the party is responsible for.</p>
                  
                  --&gt;      
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/party-uuids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/responsible-party/party-uuid" class="toc4 head">party-uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/party-uuid">/profile/metadata/responsible-party/party-uuid</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/responsible-party/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/prop">/profile/metadata/responsible-party/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/prop/@name">/profile/metadata/responsible-party/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/prop/@uuid">/profile/metadata/responsible-party/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/prop/@ns">/profile/metadata/responsible-party/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/prop/@value">/profile/metadata/responsible-party/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/prop/@class">/profile/metadata/responsible-party/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/prop/remarks">/profile/metadata/responsible-party/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/responsible-party/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/link">/profile/metadata/responsible-party/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/link/@href">/profile/metadata/responsible-party/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/link/@rel">/profile/metadata/responsible-party/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/link/@media-type">/profile/metadata/responsible-party/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/metadata/responsible-party/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/link/text">/profile/metadata/responsible-party/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/metadata/responsible-parties/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/metadata/responsible-party/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/metadata/responsible-party/remarks">/profile/metadata/responsible-party/remarks</a> in the element map.</p>
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
               <div class="crosslink"><a href="../json-reference/#/profile/metadata/remarks"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/metadata/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/metadata/remarks">/profile/metadata/remarks</a> in the element map.</p>
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
            <div class="crosslink"><a href="../json-reference/#/profile/imports"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/profile/import" class="toc2 head">import</h2>
         </div>
         <p>See <a href="../xml-outline/#/profile/import">/profile/import</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Import resource</p>
               <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
               <p>An element </p>
            </div>
            <p class="description">The <code>import</code> designates a catalog, profile, or other resource to be included (referenced and potentially
               modified) by this profile. The import also identifies which controls to select using
               the <code>include-all</code>, <code>include-controls</code>, and <code>exclude-controls</code> directives.</p>
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>A profile must be based on an existing OSCAL catalog or another OSCAL profile. An
                     <code>import</code> indicates such a source whose controls are to be included (referenced and modified)
                     in a profile. This source will either be a catalog whose controls are given (<q>by value</q>), or a profile with its own control imports.</p>
                  <p>The contents of the <code>import</code> element indicate which controls from the source will be included. Controls from the
                     source catalog or profile may be either selected, using the <code>include-all</code> or <code>include-controls</code> directives, or de-selected (using an <code>exclude-controls</code> directive).</p>
               </div>
            </details>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/imports/href"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/import/@href" class="toc3 head">@href</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/import/@href">/profile/import/@href</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">attribute Catalog or Profile Reference</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
               </div>
               <p class="description">A resolvable URL reference to the base catalog or profile that this profile is tailoring.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>The value of the <code>href</code> can be an internet resource, or a local reference using a fragment e.g. #fragment
                        that points to a <code>back-matter</code> <code>resource</code> in the same document.</p>
                     <p>If a local reference using a fragment is used, this will be indicated by a fragment
                        "#" followed by an identifier which references an identified <code>resource</code> in the document's <code>back-matter</code> or another object that is within the scope of the containing OSCAL document.</p>
                     <p>If an internet resource is used, the <code>href</code> value will be an absolute or relative URL pointing to the location of the referenced
                        resource. A relative URL will be resolved relative to the location of the document
                        containing the link.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/imports/include-all"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/import/include-all" class="toc3 head">include-all</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/import/include-all">/profile/import/include-all</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Insert All</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>An element of type <a href="link.to.empty">empty</a></p>
               </div>
               <p class="description">Insert all controls from the imported catalog or profile resources identified in the
                  <code>import</code> directive.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks in-use">
                     <p class="nb">(In use)</p>
                     <p>Identifies that all controls are to be included from the imported catalog or profile.</p>
                  </div>
                  <div class="remarks">
                     <p>This element provides an alternative to calling controls individually from a catalog.</p>
                  </div>
               </details>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/imports/include-controls"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/import/include-controls" class="toc3 head">include-controls</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/import/include-controls">/profile/import/include-controls</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Call</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Call a control by its ID</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks in-use">
                     <p class="nb">(In use)</p>
                     <p>Identifies a subset of controls to import from the referenced catalog or profile by
                        control identifier or match pattern.</p>
                  </div>
                  <div class="remarks">
                     <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                        this is how control enhancements are represented (as controls within controls), this
                        provides a way to include controls with all their dependent controls (enhancements)
                        without having to call them individually.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/imports/include-controls/with-child-controls"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/import/include-controls/@with-child-controls" class="toc4 head">@with-child-controls</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/import/include-controls/@with-child-controls">/profile/import/include-controls/@with-child-controls</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Include contained controls with control</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/imports/include-controls/with-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/import/include-controls/with-id" class="toc4 head">with-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/import/include-controls/with-id">/profile/import/include-controls/with-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Match Controls by Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <div class="value" id="">
                     <p>Value: A NCName </p>
                  </div>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/imports/include-controls/matching"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/import/include-controls/matching" class="toc4 head">matching</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/import/include-controls/matching">/profile/import/include-controls/matching</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Match Controls by Pattern</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.empty">empty</a></p>
                  </div>
                  <p class="description">Select controls by (regular expression) match on ID</p>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/imports/include-controls/matching/pattern"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/import/include-controls/matching/@pattern" class="toc5 head">@pattern</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/import/include-controls/matching/@pattern">/profile/import/include-controls/matching/@pattern</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Pattern</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/imports/exclude-controls"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/import/exclude-controls" class="toc3 head">exclude-controls</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/import/exclude-controls">/profile/import/exclude-controls</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Call</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">Call a control by its ID</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks in-use">
                     <p class="nb">(In use)</p>
                     <p>Identifies which controls to exclude, or eliminate, from the set of included controls
                        by control identifier or match pattern.</p>
                  </div>
                  <div class="remarks">
                     <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                        this is how control enhancements are represented (as controls within controls), this
                        provides a way to include controls with all their dependent controls (enhancements)
                        without having to call them individually.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/imports/exclude-controls/with-child-controls"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/import/exclude-controls/@with-child-controls" class="toc4 head">@with-child-controls</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/import/exclude-controls/@with-child-controls">/profile/import/exclude-controls/@with-child-controls</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Include contained controls with control</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/imports/exclude-controls/with-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/import/exclude-controls/with-id" class="toc4 head">with-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/import/exclude-controls/with-id">/profile/import/exclude-controls/with-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Match Controls by Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <div class="value" id="">
                     <p>Value: A NCName </p>
                  </div>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/imports/exclude-controls/matching"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/import/exclude-controls/matching" class="toc4 head">matching</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/import/exclude-controls/matching">/profile/import/exclude-controls/matching</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Match Controls by Pattern</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.empty">empty</a></p>
                  </div>
                  <p class="description">Select controls by (regular expression) match on ID</p>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/imports/exclude-controls/matching/pattern"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/import/exclude-controls/matching/@pattern" class="toc5 head">@pattern</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/import/exclude-controls/matching/@pattern">/profile/import/exclude-controls/matching/@pattern</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Pattern</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.string">string</a></p>
                     </div>
                     <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                  </div>
               </section>
            </section>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/profile/merge"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/profile/merge" class="toc2 head">merge</h2>
         </div>
         <p>See <a href="../xml-outline/#/profile/merge">/profile/merge</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Merge controls</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An element </p>
            </div>
            <p class="description">A Merge element merges controls in resolution.</p>
            <details open="open" class="remarks-group">
               <summary>Remarks</summary>
               <div class="remarks">
                  <p>The contents of the <code>merge</code> element may be used to <q>reorder</q> or <q>restructure</q> controls by indicating an order and/or structure in resolution.</p>
                  <p>Implicitly, a <code>merge</code> element is also a filter: controls that are included in a profile, but not included
                     (implicitly or explicitly) in the scope of a <code>merge</code> element, will not be merged into (will be dropped) in the resulting resolution.</p>
               </div>
            </details>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/merge/combine"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/merge/combine" class="toc3 head">combine</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/merge/combine">/profile/merge/combine</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Combination rule</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.empty">empty</a></p>
               </div>
               <p class="description">A Combine element defines whether and how to combine multiple (competing) versions
                  of the same control</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Whenever combining controls from multiple (import) pathways, an issue arises of what
                        to do with clashing invocations (multiple competing versions of a control). </p>
                     <p>This setting permits a profile designer to apply a rule for the resolution of such
                        cases. In a well-designed profile, such collisions would ordinarily be avoided, but
                        this setting can be useful for defining what to do when it occurs.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/merge/combine/method"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/merge/combine/@method" class="toc4 head">@method</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/merge/combine/@method">/profile/merge/combine/@method</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Combination method</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.string">string</a></p>
                  </div>
                  <p class="description">How clashing controls should be handled</p>
                  
                  --&gt;      </div>
            </section>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/merge/as-is"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/merge/as-is" class="toc3 head">as-is</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/merge/as-is">/profile/merge/as-is</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element As is</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element of type <a href="link.to.boolean">boolean</a></p>
               </div>
               <p class="description">An As-is element indicates that the controls should be structured in resolution as
                  they are structured in their source catalogs. It does not contain any elements or
                  attributes.</p>
               <div class="value" id="">
                  <p>Value: A boolean </p>
               </div>
            </div>
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/merge/custom"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/merge/custom" class="toc3 head">custom</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/merge/custom">/profile/merge/custom</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Custom grouping</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A Custom element frames a structure for embedding represented controls in resolution.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>The <code>custom</code> element represents a custom arrangement or organization of controls in the resolution
                        of a catalog.</p>
                     <p>While the <code>as-is</code> element provides for a restitution of a control set's organization (in one or more
                        source catalogs), this element permits the definition of an entirely different structure.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/merge/custom/group" class="toc4 head">group</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/merge/custom/group">/profile/merge/custom/group</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Control group</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A group of (selected) controls or of groups of controls</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>This construct mirrors the same construct that exists in an OSCAL catalog.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/@id" class="toc5 head">@id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/@id">/profile/merge/custom/group/@id</a> in the element map.</p>
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
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/@class">/profile/merge/custom/group/@class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Group Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the group.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/title"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/title" class="toc5 head">title</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/title">/profile/merge/custom/group/title</a> in the element map.</p>
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
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/param" class="toc5 head">param</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/param">/profile/merge/custom/group/param</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Parameter</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/@id" class="toc6 head">@id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/@id">/profile/merge/custom/group/param/@id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Parameter Identifier</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                           is document scoped and is intended to be consistent for the same parameter across
                           minor revisions of the document.</p>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/@class">/profile/merge/custom/group/param/@class</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Parameter Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that provides a characterization of the parameter.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/depends-on"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/@depends-on" class="toc6 head">@depends-on</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/@depends-on">/profile/merge/custom/group/param/@depends-on</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Depends on</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">Another parameter invoking this one</p>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/prop">/profile/merge/custom/group/param/prop</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Property</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                           qualified name/value pair. The value of a property is a simple scalar value, which
                           may be expressed as a list of values.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/prop/@name">/profile/merge/custom/group/param/prop/@name</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Name</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                              quality of the property's containing object.</p>
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/prop/@uuid">/profile/merge/custom/group/param/prop/@uuid</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Universally Unique Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                           </div>
                           <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                              document. A UUID should be consistently used for a given location across revisions
                              of the document.</p>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/prop/@ns">/profile/merge/custom/group/param/prop/@ns</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Namespace</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.uri">uri</a></p>
                           </div>
                           <p class="description">A namespace qualifying the property's name. This allows different organizations to
                              associate distinct semantics with the same name.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/prop/@value">/profile/merge/custom/group/param/prop/@value</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Value</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/prop/@class">/profile/merge/custom/group/param/prop/@class</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Property Class</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                              multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/prop/remarks">/profile/merge/custom/group/param/prop/remarks</a> in the element map.</p>
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
                        </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/link">/profile/merge/custom/group/param/link</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Link</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A reference to a local or remote resource</p>
                        
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/link/@href">/profile/merge/custom/group/param/link/@href</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Hypertext Reference</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                           </div>
                           <p class="description">A resolvable URL reference to a resource.</p>
                           
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/link/@rel">/profile/merge/custom/group/param/link/@rel</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Relation</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                              of the link's purpose.</p>
                           
                           --&gt;      
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/link/@media-type">/profile/merge/custom/group/param/link/@media-type</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Media Type</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                              <a>Media Types Registry</a>. </p>
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/link/text">/profile/merge/custom/group/param/link/text</a> in the element map.</p>
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
                           
                           --&gt;      </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/label"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/label" class="toc6 head">label</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/label">/profile/merge/custom/group/param/label</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/usage"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/usage" class="toc6 head">usage</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/usage">/profile/merge/custom/group/param/usage</a> in the element map.</p>
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
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/constraints"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/constraint" class="toc6 head">constraint</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/constraint">/profile/merge/custom/group/param/constraint</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Constraint</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A formal or informal expression of a constraint or test</p>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/constraints/description"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/constraint/description" class="toc7 head">description</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/constraint/description">/profile/merge/custom/group/param/constraint/description</a> in the element map.</p>
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
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/constraints/tests"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/constraint/test" class="toc7 head">test</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/constraint/test">/profile/merge/custom/group/param/constraint/test</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Constraint Test</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element </p>
                           </div>
                           <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                        </div>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/constraints/tests/expression"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/profile/merge/custom/group/param/constraint/test/expression" class="toc8 head">expression</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/constraint/test/expression">/profile/merge/custom/group/param/constraint/test/expression</a> in the element map.</p>
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
                           </div>
                        </section>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/constraints/tests/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/profile/merge/custom/group/param/constraint/test/remarks" class="toc8 head">remarks</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/constraint/test/remarks">/profile/merge/custom/group/param/constraint/test/remarks</a> in the element map.</p>
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
                           </div>
                        </section>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/guidelines"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/guideline" class="toc6 head">guideline</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/guideline">/profile/merge/custom/group/param/guideline</a> in the element map.</p>
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
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/values"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/value">/profile/merge/custom/group/param/value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/select"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/select" class="toc6 head">select</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/select">/profile/merge/custom/group/param/select</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Selection</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">Presenting a choice among alternatives</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/select/how-many"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/select/@how-many" class="toc7 head">@how-many</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/select/@how-many">/profile/merge/custom/group/param/select/@how-many</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Parameter Cardinality</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">Describes the number of selections that must occur.</p>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/select/choice"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/param/select/choice" class="toc7 head">choice</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/select/choice">/profile/merge/custom/group/param/select/choice</a> in the element map.</p>
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
                        </div>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/params/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/param/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/param/remarks">/profile/merge/custom/group/param/remarks</a> in the element map.</p>
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
                     </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/prop">/profile/merge/custom/group/prop</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Property</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">An attribute, characteristic, or quality of the containing object expressed as a namespace
                        qualified name/value pair. The value of a property is a simple scalar value, which
                        may be expressed as a list of values.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/prop/@name">/profile/merge/custom/group/prop/@name</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/prop/@uuid">/profile/merge/custom/group/prop/@uuid</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uuid">uuid</a></p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/prop/@ns">/profile/merge/custom/group/prop/@ns</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uri">uri</a></p>
                        </div>
                        <p class="description">A namespace qualifying the property's name. This allows different organizations to
                           associate distinct semantics with the same name.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/prop/@value">/profile/merge/custom/group/prop/@value</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/prop/@class">/profile/merge/custom/group/prop/@class</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the property's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple properties of the same object with the same <code>name</code> and <code>ns</code>. </p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/prop/remarks">/profile/merge/custom/group/prop/remarks</a> in the element map.</p>
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
                     </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/link">/profile/merge/custom/group/link</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Link</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A reference to a local or remote resource</p>
                     
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/link/@href">/profile/merge/custom/group/link/@href</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
                        
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/link/@rel">/profile/merge/custom/group/link/@rel</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/link/@media-type">/profile/merge/custom/group/link/@media-type</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.string">string</a></p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/link/text">/profile/merge/custom/group/link/text</a> in the element map.</p>
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
                        
                        --&gt;      </div>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/part" class="toc5 head">part</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/part">/profile/merge/custom/group/part</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/@id" class="toc6 head">@id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/@id">/profile/merge/custom/group/part/@id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Part Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                           document scoped and is intended to be consistent for the same part across minor revisions
                           of the document.</p>
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/@name">/profile/merge/custom/group/part/@name</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Part Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/@ns">/profile/merge/custom/group/part/@ns</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Part Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.uri">uri</a></p>
                        </div>
                        <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                           distinct semantics with the same name.</p>
                        
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/@class">/profile/merge/custom/group/part/@class</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Part Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                           multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
                        
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/title"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/title" class="toc6 head">title</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/title">/profile/merge/custom/group/part/title</a> in the element map.</p>
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
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/prop">/profile/merge/custom/group/part/prop</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/prop/@name">/profile/merge/custom/group/part/prop/@name</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/prop/@uuid">/profile/merge/custom/group/part/prop/@uuid</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/prop/@ns">/profile/merge/custom/group/part/prop/@ns</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/prop/@value">/profile/merge/custom/group/part/prop/@value</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/prop/@class">/profile/merge/custom/group/part/prop/@class</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/prop/remarks">/profile/merge/custom/group/part/prop/remarks</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/parts"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/part" class="toc6 head">part</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/part">/profile/merge/custom/group/part/part</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Part</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">A partition of a control's definition or a child of another part.</p>
                        
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
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/part/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/link">/profile/merge/custom/group/part/link</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/link/@href">/profile/merge/custom/group/part/link/@href</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/link/@rel">/profile/merge/custom/group/part/link/@rel</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/link/@media-type">/profile/merge/custom/group/part/link/@media-type</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/parts/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/part/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/part/link/text">/profile/merge/custom/group/part/link/text</a> in the element map.</p>
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
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/groups"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/group" class="toc5 head">group</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/group">/profile/merge/custom/group/group</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Control group</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A group of (selected) controls or of groups of controls</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>This construct mirrors the same construct that exists in an OSCAL catalog.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/group/insert-controls" class="toc5 head">insert-controls</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls">/profile/merge/custom/group/insert-controls</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Select controls</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Specifies which controls to use in the containing context.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
                           <p>If this directive is not provided, then no controls are to be inserted; i.e., all
                              controls are included explicitly.</p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/order"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/insert-controls/@order" class="toc6 head">@order</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/@order">/profile/merge/custom/group/insert-controls/@order</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Order</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A designation of how a selection of controls in a profile is to be ordered.</p>
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-all"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/insert-controls/include-all" class="toc6 head">include-all</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/include-all">/profile/merge/custom/group/insert-controls/include-all</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Insert All</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An element of type <a href="link.to.empty">empty</a></p>
                        </div>
                        <p class="description">Insert all controls from the imported catalog or profile resources identified in the
                           <code>import</code> directive.</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>This element provides an alternative to calling controls individually from a catalog.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/insert-controls/include-controls" class="toc6 head">include-controls</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/include-controls">/profile/merge/custom/group/insert-controls/include-controls</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Call</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">Call a control by its ID</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                                 this is how control enhancements are represented (as controls within controls), this
                                 provides a way to include controls with all their dependent controls (enhancements)
                                 without having to call them individually.</p>
                           </div>
                        </details>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/with-child-controls"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/insert-controls/include-controls/@with-child-controls" class="toc7 head">@with-child-controls</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/include-controls/@with-child-controls">/profile/merge/custom/group/insert-controls/include-controls/@with-child-controls</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Include contained controls with control</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/with-ids"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/insert-controls/include-controls/with-id" class="toc7 head">with-id</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/include-controls/with-id">/profile/merge/custom/group/insert-controls/include-controls/with-id</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Match Controls by Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <div class="value" id="">
                              <p>Value: A NCName </p>
                           </div>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/matching"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/insert-controls/include-controls/matching" class="toc7 head">matching</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/include-controls/matching">/profile/merge/custom/group/insert-controls/include-controls/matching</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Match Controls by Pattern</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element of type <a href="link.to.empty">empty</a></p>
                           </div>
                           <p class="description">Select controls by (regular expression) match on ID</p>
                        </div>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/matching/pattern"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/profile/merge/custom/group/insert-controls/include-controls/matching/@pattern" class="toc8 head">@pattern</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/include-controls/matching/@pattern">/profile/merge/custom/group/insert-controls/include-controls/matching/@pattern</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Pattern</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.string">string</a></p>
                              </div>
                              <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                           </div>
                        </section>
                     </section>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/group/insert-controls/exclude-controls" class="toc6 head">exclude-controls</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/exclude-controls">/profile/merge/custom/group/insert-controls/exclude-controls</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Call</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element </p>
                        </div>
                        <p class="description">Call a control by its ID</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks in-use">
                              <p class="nb">(In use)</p>
                              <p>Identifies which controls to exclude, or eliminate, from the set of matching includes.</p>
                           </div>
                           <div class="remarks">
                              <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                                 this is how control enhancements are represented (as controls within controls), this
                                 provides a way to include controls with all their dependent controls (enhancements)
                                 without having to call them individually.</p>
                           </div>
                        </details>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/with-child-controls"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/insert-controls/exclude-controls/@with-child-controls" class="toc7 head">@with-child-controls</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/exclude-controls/@with-child-controls">/profile/merge/custom/group/insert-controls/exclude-controls/@with-child-controls</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Include contained controls with control</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                           
                           --&gt;      </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/insert-controls/exclude-controls/with-id" class="toc7 head">with-id</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/exclude-controls/with-id">/profile/merge/custom/group/insert-controls/exclude-controls/with-id</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Match Controls by Identifier</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element of type <a href="link.to.NCName">NCName</a></p>
                           </div>
                           <div class="value" id="">
                              <p>Value: A NCName </p>
                           </div>
                        </div>
                     </section>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/matching"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/group/insert-controls/exclude-controls/matching" class="toc7 head">matching</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/exclude-controls/matching">/profile/merge/custom/group/insert-controls/exclude-controls/matching</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">element Match Controls by Pattern</p>
                              <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                              <p>An element of type <a href="link.to.empty">empty</a></p>
                           </div>
                           <p class="description">Select controls by (regular expression) match on ID</p>
                        </div>
                        <section class="xml-element">
                           <div class="header">
                              <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/matching/pattern"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/profile/merge/custom/group/insert-controls/exclude-controls/matching/@pattern" class="toc8 head">@pattern</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/profile/merge/custom/group/insert-controls/exclude-controls/matching/@pattern">/profile/merge/custom/group/insert-controls/exclude-controls/matching/@pattern</a> in the element map.</p>
                           <div class="obj-desc">
                              <div class="obj-matrix">
                                 <p class="obj-name">attribute Pattern</p>
                                 <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                                 <p>An attribute of type <a href="link.to.string">string</a></p>
                              </div>
                              <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                           </div>
                        </section>
                     </section>
                  </section>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/merge/custom/insert-controls" class="toc4 head">insert-controls</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls">/profile/merge/custom/insert-controls</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Select controls</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Specifies which controls to use in the containing context.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To be schema-valid, this element must contain either (but not both) a single <code>include-all</code> directive, or a sequence of <code>include-controls</code> directives.</p>
                        <p>If this directive is not provided, then no controls are to be inserted; i.e., all
                           controls are included explicitly.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/order"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/insert-controls/@order" class="toc5 head">@order</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/@order">/profile/merge/custom/insert-controls/@order</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Order</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">A designation of how a selection of controls in a profile is to be ordered.</p>
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/include-all"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/insert-controls/include-all" class="toc5 head">include-all</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/include-all">/profile/merge/custom/insert-controls/include-all</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Insert All</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An element of type <a href="link.to.empty">empty</a></p>
                     </div>
                     <p class="description">Insert all controls from the imported catalog or profile resources identified in the
                        <code>import</code> directive.</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>This element provides an alternative to calling controls individually from a catalog.</p>
                        </div>
                     </details>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/include-controls"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/insert-controls/include-controls" class="toc5 head">include-controls</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/include-controls">/profile/merge/custom/insert-controls/include-controls</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Call</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Call a control by its ID</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                              this is how control enhancements are represented (as controls within controls), this
                              provides a way to include controls with all their dependent controls (enhancements)
                              without having to call them individually.</p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/with-child-controls"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/insert-controls/include-controls/@with-child-controls" class="toc6 head">@with-child-controls</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/include-controls/@with-child-controls">/profile/merge/custom/insert-controls/include-controls/@with-child-controls</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Include contained controls with control</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/with-ids"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/insert-controls/include-controls/with-id" class="toc6 head">with-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/include-controls/with-id">/profile/merge/custom/insert-controls/include-controls/with-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Match Controls by Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <div class="value" id="">
                           <p>Value: A NCName </p>
                        </div>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/matching"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/insert-controls/include-controls/matching" class="toc6 head">matching</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/include-controls/matching">/profile/merge/custom/insert-controls/include-controls/matching</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Match Controls by Pattern</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element of type <a href="link.to.empty">empty</a></p>
                        </div>
                        <p class="description">Select controls by (regular expression) match on ID</p>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/matching/pattern"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/insert-controls/include-controls/matching/@pattern" class="toc7 head">@pattern</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/include-controls/matching/@pattern">/profile/merge/custom/insert-controls/include-controls/matching/@pattern</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Pattern</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                        </div>
                     </section>
                  </section>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/merge/custom/insert-controls/exclude-controls" class="toc5 head">exclude-controls</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/exclude-controls">/profile/merge/custom/insert-controls/exclude-controls</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Call</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">Call a control by its ID</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks in-use">
                           <p class="nb">(In use)</p>
                           <p>Identifies which controls to exclude, or eliminate, from the set of matching includes.</p>
                        </div>
                        <div class="remarks">
                           <p>If <code>with-child-controls</code> is <q>yes</q> on the call to a control, no sibling <code>call</code>elements need to be used to call any controls appearing within it. Since generally,
                              this is how control enhancements are represented (as controls within controls), this
                              provides a way to include controls with all their dependent controls (enhancements)
                              without having to call them individually.</p>
                        </div>
                     </details>
                  </div>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/with-child-controls"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/insert-controls/exclude-controls/@with-child-controls" class="toc6 head">@with-child-controls</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/exclude-controls/@with-child-controls">/profile/merge/custom/insert-controls/exclude-controls/@with-child-controls</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Include contained controls with control</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">When a control is included, whether its child (dependent) controls are also included.</p>
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/with-ids"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/insert-controls/exclude-controls/with-id" class="toc6 head">with-id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/exclude-controls/with-id">/profile/merge/custom/insert-controls/exclude-controls/with-id</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Match Controls by Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <div class="value" id="">
                           <p>Value: A NCName </p>
                        </div>
                     </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/matching"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/merge/custom/insert-controls/exclude-controls/matching" class="toc6 head">matching</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/exclude-controls/matching">/profile/merge/custom/insert-controls/exclude-controls/matching</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">element Match Controls by Pattern</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>An element of type <a href="link.to.empty">empty</a></p>
                        </div>
                        <p class="description">Select controls by (regular expression) match on ID</p>
                     </div>
                     <section class="xml-element">
                        <div class="header">
                           <div class="crosslink"><a href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/matching/pattern"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/merge/custom/insert-controls/exclude-controls/matching/@pattern" class="toc7 head">@pattern</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/merge/custom/insert-controls/exclude-controls/matching/@pattern">/profile/merge/custom/insert-controls/exclude-controls/matching/@pattern</a> in the element map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">attribute Pattern</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>An attribute of type <a href="link.to.string">string</a></p>
                           </div>
                           <p class="description">A <a>glob expression</a> matching the IDs of one or more controls to be selected.</p>
                        </div>
                     </section>
                  </section>
               </section>
            </section>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/profile/modify"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/profile/modify" class="toc2 head">modify</h2>
         </div>
         <p>See <a href="../xml-outline/#/profile/modify">/profile/modify</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Modify controls</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An element </p>
            </div>
            <p class="description">Set parameters or amend controls in resolution</p>
         </div>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/modify/set-parameter" class="toc3 head">set-parameter</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/modify/set-parameter">/profile/modify/set-parameter</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Parameter Setting</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">A parameter setting, to be propagated to points of insertion</p>
               
               --&gt;      </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/param-id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/@param-id" class="toc4 head">@param-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/@param-id">/profile/modify/set-parameter/@param-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Parameter ID</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">Indicates the value of the 'id' flag on a target parameter; i.e. which parameter to
                     set</p>
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/class"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/@class" class="toc4 head">@class</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/@class">/profile/modify/set-parameter/@class</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/depends-on"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/@depends-on" class="toc4 head">@depends-on</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/@depends-on">/profile/modify/set-parameter/@depends-on</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/prop">/profile/modify/set-parameter/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/prop/@name">/profile/modify/set-parameter/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/prop/@uuid">/profile/modify/set-parameter/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/prop/@ns">/profile/modify/set-parameter/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/prop/@value">/profile/modify/set-parameter/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/prop/@class">/profile/modify/set-parameter/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/prop/remarks">/profile/modify/set-parameter/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/links"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/link" class="toc4 head">link</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/link">/profile/modify/set-parameter/link</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/link/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/link/@href">/profile/modify/set-parameter/link/@href</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/link/@rel" class="toc5 head">@rel</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/link/@rel">/profile/modify/set-parameter/link/@rel</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/link/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/link/@media-type">/profile/modify/set-parameter/link/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/link/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/link/text">/profile/modify/set-parameter/link/text</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/label"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/label" class="toc4 head">label</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/label">/profile/modify/set-parameter/label</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/usage"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/usage" class="toc4 head">usage</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/usage">/profile/modify/set-parameter/usage</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/constraints"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/constraint" class="toc4 head">constraint</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/constraint">/profile/modify/set-parameter/constraint</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/constraints/description"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/constraint/description" class="toc5 head">description</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/constraint/description">/profile/modify/set-parameter/constraint/description</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/constraints/tests"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/constraint/test" class="toc5 head">test</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/constraint/test">/profile/modify/set-parameter/constraint/test</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/constraints/tests/expression"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/set-parameter/constraint/test/expression" class="toc6 head">expression</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/set-parameter/constraint/test/expression">/profile/modify/set-parameter/constraint/test/expression</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/constraints/tests/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/set-parameter/constraint/test/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/set-parameter/constraint/test/remarks">/profile/modify/set-parameter/constraint/test/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/guidelines"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/guideline" class="toc4 head">guideline</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/guideline">/profile/modify/set-parameter/guideline</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/values"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/value" class="toc4 head">value</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/value">/profile/modify/set-parameter/value</a> in the element map.</p>
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
                        <p>Used to (re)define a parameter value.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/select"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/set-parameter/select" class="toc4 head">select</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/set-parameter/select">/profile/modify/set-parameter/select</a> in the element map.</p>
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
                     <div class="remarks">
                        <p>A set of parameter value choices, that may be picked from to set the parameter value.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/select/how-many"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/select/@how-many" class="toc5 head">@how-many</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/select/@how-many">/profile/modify/set-parameter/select/@how-many</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/set-parameters/select/choice"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/set-parameter/select/choice" class="toc5 head">choice</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/set-parameter/select/choice">/profile/modify/set-parameter/select/choice</a> in the element map.</p>
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
         </section>
         <section class="xml-element">
            <div class="header">
               <div class="crosslink"><a href="../json-reference/#/profile/modify/alters"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/modify/alter" class="toc3 head">alter</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/modify/alter">/profile/modify/alter</a> in the element map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">element Alteration</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An element </p>
               </div>
               <p class="description">An Alter element specifies changes to be made to an included control when a profile
                  is resolved.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Use <code>@control-id</code> to indicate the scope of alteration.</p>
                     <p>It is an error for two <code>alter</code> elements to apply to the same control. In practice, multiple alterations can be applied
                        (together), but it creates confusion.</p>
                     <p>At present, no provision is made for altering many controls at once (for example,
                        to systematically remove properties or add global properties); extending this element
                        to match multiple control IDs could provide for this.</p>
                  </div>
               </details>
            </div>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/control-id"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/alter/@control-id" class="toc4 head">@control-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/alter/@control-id">/profile/modify/alter/@control-id</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">attribute Control Identifier Reference</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                  </div>
                  <p class="description">A reference to a control with a corresponding <code>id</code> value.</p>
               </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/removes"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/alter/remove" class="toc4 head">remove</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/alter/remove">/profile/modify/alter/remove</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Removal</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element of type <a href="link.to.empty">empty</a></p>
                  </div>
                  <p class="description">Specifies objects to be removed from a control based on specific aspects of the object
                     that must all match.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>Use <code>name-ref</code>, <code>class-ref</code>, <code>id-ref</code> or <code>generic-identifier</code> to indicate class tokens or ID reference, or the formal name, of the component to
                           be removed or erased from a control, when a catalog is resolved. The control affected
                           is indicated by the pointer on the removal's parent (containing) <code>alter</code> element.</p>
                        <p>To change an element, use <code>remove</code> to remove the element, then <code>add</code> to add it back again with changes.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/removes/by-name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/remove/@by-name" class="toc5 head">@by-name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/remove/@by-name">/profile/modify/alter/remove/@by-name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Reference by (assigned) name</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Identify items to remove by matching their assigned name</p>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/removes/by-class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/remove/@by-class" class="toc5 head">@by-class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/remove/@by-class">/profile/modify/alter/remove/@by-class</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Reference by class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Identify items to remove by matching their <code>class</code>.</p>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/removes/by-id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/remove/@by-id" class="toc5 head">@by-id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/remove/@by-id">/profile/modify/alter/remove/@by-id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Reference by ID</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Identify items to remove indicated by their <code>id</code>.</p>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/removes/by-item-name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/remove/@by-item-name" class="toc5 head">@by-item-name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/remove/@by-item-name">/profile/modify/alter/remove/@by-item-name</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Item Name Reference</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Identify items to remove by the name of the item's information element name, e.g.
                        <code>title</code> or <code>prop</code></p>
                  </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/removes/by-ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/remove/@by-ns" class="toc5 head">@by-ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/remove/@by-ns">/profile/modify/alter/remove/@by-ns</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Item Namespace Reference</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Identify items to remove by the item's <code>ns</code>, which is the namespace associated with a <code>part</code>, or <code>prop</code>.</p>
                  </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/modify/alter/add" class="toc4 head">add</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/modify/alter/add">/profile/modify/alter/add</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Addition</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">Specifies contents to be added into controls, in resolution</p>
                  
                  --&gt;      
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>When no <code>id-ref</code> is given, the addition is inserted into the control targeted by the alteration at
                           the start or end as indicated by <code>position</code>. Only <code>position</code> values of "starting" or "ending" are permitted when there is no <code>id-ref</code>.</p>
                        <p><code>id-ref</code>, when given, should indicate, by its ID, an element inside the control to serve as
                           the anchor point for the addition. In this case, <code>position</code> value may be any of the permitted values.</p>
                     </div>
                  </details>
               </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/position"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/add/@position" class="toc5 head">@position</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/add/@position">/profile/modify/alter/add/@position</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Position</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Where to add the new content with respect to the targeted element (beside it or inside
                        it)</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/by-id"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/add/@by-id" class="toc5 head">@by-id</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/add/@by-id">/profile/modify/alter/add/@by-id</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Reference by ID</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                     </div>
                     <p class="description">Target location of the addition.</p>
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/title"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/add/title" class="toc5 head">title</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/add/title">/profile/modify/alter/add/title</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Title Change</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element of type <a href="link.to.markup-line">markup-line</a></p>
                     </div>
                     <p class="description">A name given to the control, which may be used by a tool for display and navigation.</p>
                     <div class="value" id="">
                        <p>Value: A markup-line </p>
                     </div>
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/add/param" class="toc5 head">param</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/add/param">/profile/modify/alter/add/param</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/@id" class="toc6 head">@id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/@id">/profile/modify/alter/add/param/@id</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/@class">/profile/modify/alter/add/param/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/depends-on"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/@depends-on" class="toc6 head">@depends-on</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/@depends-on">/profile/modify/alter/add/param/@depends-on</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/prop">/profile/modify/alter/add/param/prop</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/prop/@name">/profile/modify/alter/add/param/prop/@name</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/prop/@uuid">/profile/modify/alter/add/param/prop/@uuid</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/prop/@ns">/profile/modify/alter/add/param/prop/@ns</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/prop/@value">/profile/modify/alter/add/param/prop/@value</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/prop/@class">/profile/modify/alter/add/param/prop/@class</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/prop/remarks">/profile/modify/alter/add/param/prop/remarks</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/link">/profile/modify/alter/add/param/link</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/link/@href">/profile/modify/alter/add/param/link/@href</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/link/@rel">/profile/modify/alter/add/param/link/@rel</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/link/@media-type">/profile/modify/alter/add/param/link/@media-type</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/link/text">/profile/modify/alter/add/param/link/text</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/label"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/label" class="toc6 head">label</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/label">/profile/modify/alter/add/param/label</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/usage"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/usage" class="toc6 head">usage</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/usage">/profile/modify/alter/add/param/usage</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/constraints"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/constraint" class="toc6 head">constraint</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/constraint">/profile/modify/alter/add/param/constraint</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/constraints/description"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/constraint/description" class="toc7 head">description</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/constraint/description">/profile/modify/alter/add/param/constraint/description</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/constraints/tests"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/constraint/test" class="toc7 head">test</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/constraint/test">/profile/modify/alter/add/param/constraint/test</a> in the element map.</p>
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
                              <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/constraints/tests/expression"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/profile/modify/alter/add/param/constraint/test/expression" class="toc8 head">expression</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/constraint/test/expression">/profile/modify/alter/add/param/constraint/test/expression</a> in the element map.</p>
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
                              <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/constraints/tests/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                              <h8 id="/profile/modify/alter/add/param/constraint/test/remarks" class="toc8 head">remarks</h8>
                           </div>
                           <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/constraint/test/remarks">/profile/modify/alter/add/param/constraint/test/remarks</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/guidelines"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/guideline" class="toc6 head">guideline</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/guideline">/profile/modify/alter/add/param/guideline</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/values"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/value">/profile/modify/alter/add/param/value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/select"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/select" class="toc6 head">select</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/select">/profile/modify/alter/add/param/select</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/select/how-many"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/select/@how-many" class="toc7 head">@how-many</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/select/@how-many">/profile/modify/alter/add/param/select/@how-many</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/select/choice"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/param/select/choice" class="toc7 head">choice</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/select/choice">/profile/modify/alter/add/param/select/choice</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/params/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/param/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/param/remarks">/profile/modify/alter/add/param/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/add/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/add/prop">/profile/modify/alter/add/prop</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/prop/@name">/profile/modify/alter/add/prop/@name</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/prop/@uuid">/profile/modify/alter/add/prop/@uuid</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/prop/@ns">/profile/modify/alter/add/prop/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/prop/@value">/profile/modify/alter/add/prop/@value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/prop/@class">/profile/modify/alter/add/prop/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/prop/remarks">/profile/modify/alter/add/prop/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/links"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/add/link" class="toc5 head">link</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/add/link">/profile/modify/alter/add/link</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/link/@href" class="toc6 head">@href</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/link/@href">/profile/modify/alter/add/link/@href</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/link/@rel" class="toc6 head">@rel</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/link/@rel">/profile/modify/alter/add/link/@rel</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/link/@media-type" class="toc6 head">@media-type</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/link/@media-type">/profile/modify/alter/add/link/@media-type</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/link/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/link/text">/profile/modify/alter/add/link/text</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/modify/alter/add/part" class="toc5 head">part</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/modify/alter/add/part">/profile/modify/alter/add/part</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/id"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/@id" class="toc6 head">@id</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/@id">/profile/modify/alter/add/part/@id</a> in the element map.</p>
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
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/@name">/profile/modify/alter/add/part/@name</a> in the element map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">attribute Part Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>An attribute of type <a href="link.to.NCName">NCName</a></p>
                        </div>
                        <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                        
                        --&gt;      
                        
                        --&gt;      
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/@ns">/profile/modify/alter/add/part/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/@class">/profile/modify/alter/add/part/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/title"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/title" class="toc6 head">title</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/title">/profile/modify/alter/add/part/title</a> in the element map.</p>
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
                        
                        --&gt;      </div>
                  </section>
                  <section class="xml-element">
                     <div class="header">
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/props"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/prop" class="toc6 head">prop</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/prop">/profile/modify/alter/add/part/prop</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/prop/@name" class="toc7 head">@name</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/prop/@name">/profile/modify/alter/add/part/prop/@name</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/prop/@uuid" class="toc7 head">@uuid</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/prop/@uuid">/profile/modify/alter/add/part/prop/@uuid</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/prop/@ns" class="toc7 head">@ns</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/prop/@ns">/profile/modify/alter/add/part/prop/@ns</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/prop/@value" class="toc7 head">@value</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/prop/@value">/profile/modify/alter/add/part/prop/@value</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/prop/@class" class="toc7 head">@class</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/prop/@class">/profile/modify/alter/add/part/prop/@class</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/prop/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/prop/remarks">/profile/modify/alter/add/part/prop/remarks</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/parts"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/part" class="toc6 head">part</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/part">/profile/modify/alter/add/part/part</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/links"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/modify/alter/add/part/link" class="toc6 head">link</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/link">/profile/modify/alter/add/part/link</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/links/href"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/link/@href" class="toc7 head">@href</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/link/@href">/profile/modify/alter/add/part/link/@href</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/links/rel"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/link/@rel" class="toc7 head">@rel</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/link/@rel">/profile/modify/alter/add/part/link/@rel</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/links/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/link/@media-type" class="toc7 head">@media-type</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/link/@media-type">/profile/modify/alter/add/part/link/@media-type</a> in the element map.</p>
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
                           <div class="crosslink"><a href="../json-reference/#/profile/modify/alters/adds/parts/links/text"><button class="schema-link">Switch to JSON</button></a></div>
                           <h7 id="/profile/modify/alter/add/part/link/text" class="toc7 head">text</h7>
                        </div>
                        <p>See <a href="../xml-outline/#/profile/modify/alter/add/part/link/text">/profile/modify/alter/add/part/link/text</a> in the element map.</p>
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
               </section>
            </section>
         </section>
      </section>
      <section class="xml-element">
         <div class="header">
            <div class="crosslink"><a href="../json-reference/#/profile/back-matter"><button class="schema-link">Switch to JSON</button></a></div>
            <h2 id="/profile/back-matter" class="toc2 head">back-matter</h2>
         </div>
         <p>See <a href="../xml-outline/#/profile/back-matter">/profile/back-matter</a> in the element map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">element Back matter</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An element </p>
            </div>
            <p class="description">A collection of resources, which may be included directly or by reference.</p>
            
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
               <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources"><button class="schema-link">Switch to JSON</button></a></div>
               <h3 id="/profile/back-matter/resource" class="toc3 head">resource</h3>
            </div>
            <p>See <a href="../xml-outline/#/profile/back-matter/resource">/profile/back-matter/resource</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/@uuid" class="toc4 head">@uuid</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/@uuid">/profile/back-matter/resource/@uuid</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/title"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/title">/profile/back-matter/resource/title</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/description"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/description">/profile/back-matter/resource/description</a> in the element map.</p>
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
                  
                  --&gt;      </div>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/props"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/prop" class="toc4 head">prop</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/prop">/profile/back-matter/resource/prop</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/prop/@name" class="toc5 head">@name</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/prop/@name">/profile/back-matter/resource/prop/@name</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/prop/@uuid" class="toc5 head">@uuid</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/prop/@uuid">/profile/back-matter/resource/prop/@uuid</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/prop/@ns" class="toc5 head">@ns</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/prop/@ns">/profile/back-matter/resource/prop/@ns</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/prop/@value" class="toc5 head">@value</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/prop/@value">/profile/back-matter/resource/prop/@value</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/prop/@class" class="toc5 head">@class</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/prop/@class">/profile/back-matter/resource/prop/@class</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/prop/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/prop/remarks">/profile/back-matter/resource/prop/remarks</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/document-ids"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/document-id" class="toc4 head">document-id</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/document-id">/profile/back-matter/resource/document-id</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/document-ids/scheme"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/document-id/@scheme" class="toc5 head">@scheme</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/document-id/@scheme">/profile/back-matter/resource/document-id/@scheme</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/citation" class="toc4 head">citation</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation">/profile/back-matter/resource/citation</a> in the element map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">element Citation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An element </p>
                  </div>
                  <p class="description">A citation consisting of end note text and optional structured bibliographic data.</p>
                  
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/text"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/citation/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/text">/profile/back-matter/resource/citation/text</a> in the element map.</p>
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
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/props"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/citation/prop" class="toc5 head">prop</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/prop">/profile/back-matter/resource/citation/prop</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/props/name"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/back-matter/resource/citation/prop/@name" class="toc6 head">@name</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/prop/@name">/profile/back-matter/resource/citation/prop/@name</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/props/uuid"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/back-matter/resource/citation/prop/@uuid" class="toc6 head">@uuid</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/prop/@uuid">/profile/back-matter/resource/citation/prop/@uuid</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/props/ns"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/back-matter/resource/citation/prop/@ns" class="toc6 head">@ns</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/prop/@ns">/profile/back-matter/resource/citation/prop/@ns</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/props/value"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/back-matter/resource/citation/prop/@value" class="toc6 head">@value</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/prop/@value">/profile/back-matter/resource/citation/prop/@value</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/props/class"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/back-matter/resource/citation/prop/@class" class="toc6 head">@class</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/prop/@class">/profile/back-matter/resource/citation/prop/@class</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/props/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/back-matter/resource/citation/prop/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/prop/remarks">/profile/back-matter/resource/citation/prop/remarks</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/citation/biblio"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/citation/biblio" class="toc5 head">biblio</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/citation/biblio">/profile/back-matter/resource/citation/biblio</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">element Bibliographic Definition</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An element </p>
                     </div>
                     <p class="description">A container for structured bibliographic information. The model of this information
                        is undefined by OSCAL.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/rlinks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/rlink" class="toc4 head">rlink</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/rlink">/profile/back-matter/resource/rlink</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/rlinks/href"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/rlink/@href" class="toc5 head">@href</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/rlink/@href">/profile/back-matter/resource/rlink/@href</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">A resolvable URI reference to a resource.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/rlinks/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/rlink/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/rlink/@media-type">/profile/back-matter/resource/rlink/@media-type</a> in the element map.</p>
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
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/rlinks/hashes"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/rlink/hash" class="toc5 head">hash</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/rlink/hash">/profile/back-matter/resource/rlink/hash</a> in the element map.</p>
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
                        <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/rlinks/hashes/algorithm"><button class="schema-link">Switch to JSON</button></a></div>
                        <h6 id="/profile/back-matter/resource/rlink/hash/@algorithm" class="toc6 head">@algorithm</h6>
                     </div>
                     <p>See <a href="../xml-outline/#/profile/back-matter/resource/rlink/hash/@algorithm">/profile/back-matter/resource/rlink/hash/@algorithm</a> in the element map.</p>
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
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/base64"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/base64" class="toc4 head">base64</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/base64">/profile/back-matter/resource/base64</a> in the element map.</p>
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
                  
                  --&gt;      </div>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/base64/filename"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/base64/@filename" class="toc5 head">@filename</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/base64/@filename">/profile/back-matter/resource/base64/@filename</a> in the element map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">attribute File Name</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An attribute of type <a href="link.to.uri-reference">uri-reference</a></p>
                     </div>
                     <p class="description">Name of the file before it was encoded as Base64 to be embedded in a <code>resource</code>. This is the name that will be assigned to the file when the file is decoded.</p>
                     
                     --&gt;      
                     
                     --&gt;      </div>
               </section>
               <section class="xml-element">
                  <div class="header">
                     <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/base64/media-type"><button class="schema-link">Switch to JSON</button></a></div>
                     <h5 id="/profile/back-matter/resource/base64/@media-type" class="toc5 head">@media-type</h5>
                  </div>
                  <p>See <a href="../xml-outline/#/profile/back-matter/resource/base64/@media-type">/profile/back-matter/resource/base64/@media-type</a> in the element map.</p>
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
            </section>
            <section class="xml-element">
               <div class="header">
                  <div class="crosslink"><a href="../json-reference/#/profile/back-matter/resources/remarks"><button class="schema-link">Switch to JSON</button></a></div>
                  <h4 id="/profile/back-matter/resource/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../xml-outline/#/profile/back-matter/resource/remarks">/profile/back-matter/resource/remarks</a> in the element map.</p>
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
   </section>
</div>