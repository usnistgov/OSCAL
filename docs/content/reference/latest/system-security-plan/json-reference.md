---
title: "System Security Plan Model JSON Format Reference"
heading: "OSCAL System Security Plan (SSP) Model JSON Format Reference"
description: A reference for the OSCAL System Security Plan JSON format.
weight: 20
sidenav:
  title: JSON Reference
toc:
  enabled: true
  headingselectors: "h1.toc1, h2.toc2, h3.toc3, h4.toc4, h5.toc5, h6.toc6"
aliases:
  - /docs/schemas/oscal-ssp-json/
  - /documentation/schema/ssp/json-schema/
  - /documentation/schema/implementation-layer/ssp/json-schema/
---

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml" class="json-reference">
   <p><span class="usa-tag">Schema version:</span> 1.0.0-rc2</p>
   <section class="json-obj">
      <div class="header">
         <div class="crosslink"><a href="../xml-reference/#/catalog"><button class="schema-link">Switch to XML</button></a></div>
         <h1 id="/catalog" class="toc1 head">catalog</h1>
      </div>
      <p>See <a href="../json-outline/#/catalog">/catalog</a> in the object map.</p>
      <div class="obj-desc">
         <div class="obj-matrix">
            <p class="obj-name">object Catalog</p>
            <p class="occurrence"><span class="cardinality">[1]</span></p>
            <p>An object  with key <code>catalog</code>.</p>
            <p class="path">/catalog</p>
         </div>
         <p class="description">A collection of controls.</p>
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
      <section class="json-obj">
         <div class="header">
            <div class="crosslink"><a href="../xml-reference/#/catalog/@uuid"><button class="schema-link">Switch to XML</button></a></div>
            <h2 id="/catalog/uuid" class="toc2 head">uuid</h2>
         </div>
         <p>See <a href="../json-outline/#/catalog/uuid">/catalog/uuid</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">string Catalog Universally Unique Identifier</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
               <p class="path">/catalog/uuid</p>
            </div>
            <p class="description">A globally unique identifier for this catalog instance. This UUID should be changed
               when this document is revised.</p>
         </div>
      </section>
      <section class="json-obj">
         <div class="header">
            <div class="crosslink"><a href="../xml-reference/#/catalog/metadata"><button class="schema-link">Switch to XML</button></a></div>
            <h2 id="/catalog/metadata" class="toc2 head">metadata</h2>
         </div>
         <p>See <a href="../json-outline/#/catalog/metadata">/catalog/metadata</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Publication metadata</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <p>An object  with key <code>metadata</code>.</p>
               <p class="path">/catalog/metadata</p>
            </div>
            <p class="description">Provides information about the publication and availability of the containing document.</p>
         </div>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/title"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/title">/catalog/metadata/title</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Document Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                  <p class="path">/catalog/metadata/title</p>
               </div>
               <p class="description">A name given to the document, which may be used by a tool for display and navigation.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/published"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/published" class="toc3 head">published</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/published">/catalog/metadata/published</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Publication Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>published</code>.</p>
                  <p class="path">/catalog/metadata/published</p>
               </div>
               <p class="description">The date and time the document was published. The date-time value must be formatted
                  according to <a>RFC 3339</a> with full time and time zone included.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/last-modified"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/last-modified" class="toc3 head">last-modified</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/last-modified">/catalog/metadata/last-modified</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Last Modified Timestamp</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>last-modified</code>.</p>
                  <p class="path">/catalog/metadata/last-modified</p>
               </div>
               <p class="description">The date and time the document was last modified. The date-time value must be formatted
                  according to <a>RFC 3339</a> with full time and time zone included.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/version"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/version" class="toc3 head">version</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/version">/catalog/metadata/version</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Document Version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>version</code>.</p>
                  <p class="path">/catalog/metadata/version</p>
               </div>
               <p class="description">A string used to distinguish the current version of the document from other previous
                  (and future) versions.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/oscal-version"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/oscal-version" class="toc3 head">oscal-version</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/oscal-version">/catalog/metadata/oscal-version</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string OSCAL version</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> with key <code>oscal-version</code>.</p>
                  <p class="path">/catalog/metadata/oscal-version</p>
               </div>
               <p class="description">The OSCAL model version the document was authored against.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/revisions" class="toc3 head">revisions</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/revisions">/catalog/metadata/revisions</a> in the object map.</p>
            <p>An array of Revision History Entry objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Revision History Entry</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>revisions</code>.</p>
                  <p class="path">/catalog/metadata/revisions</p>
               </div>
               <p class="description">An entry in a sequential list of revisions to the containing document in reverse chronological
                  order (i.e., most recent previous revision first).</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>While <code>published</code>, <code>last-modified</code>, <code>oscal-version</code>, and <code>version</code> are not required, values for these entries should be provided if the information
                        is known. For a revision entry to be considered valid, at least one of the following
                        items must be provided: <code>published</code>, <code>last-modified</code>, <code>version</code>, or a <code>link</code> with a <code>rel</code> of <q>source</q>.</p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/title"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/title">/catalog/metadata/revisions/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/catalog/metadata/revisions/title</p>
                  </div>
                  <p class="description">A name given to the document revision, which may be used by a tool for display and
                     navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/published"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/published" class="toc4 head">published</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/published">/catalog/metadata/revisions/published</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Publication Timestamp</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>published</code>.</p>
                     <p class="path">/catalog/metadata/revisions/published</p>
                  </div>
                  <p class="description">The date and time the document was published. The date-time value must be formatted
                     according to <a>RFC 3339</a> with full time and time zone included.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/last-modified"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/last-modified" class="toc4 head">last-modified</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/last-modified">/catalog/metadata/revisions/last-modified</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Last Modified Timestamp</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.dateTime-with-timezone">dateTime-with-timezone</a> with key <code>last-modified</code>.</p>
                     <p class="path">/catalog/metadata/revisions/last-modified</p>
                  </div>
                  <p class="description">The date and time the document was last modified. The date-time value must be formatted
                     according to <a>RFC 3339</a> with full time and time zone included.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/version"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/version" class="toc4 head">version</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/version">/catalog/metadata/revisions/version</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Version</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>version</code>.</p>
                     <p class="path">/catalog/metadata/revisions/version</p>
                  </div>
                  <p class="description">A string used to distinguish the current version of the document from other previous
                     (and future) versions.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/oscal-version"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/oscal-version" class="toc4 head">oscal-version</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/oscal-version">/catalog/metadata/revisions/oscal-version</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string OSCAL version</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>oscal-version</code>.</p>
                     <p class="path">/catalog/metadata/revisions/oscal-version</p>
                  </div>
                  <p class="description">The OSCAL model version the document was authored against.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/props">/catalog/metadata/revisions/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/metadata/revisions/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/props/name">/catalog/metadata/revisions/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/metadata/revisions/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/props/uuid">/catalog/metadata/revisions/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/metadata/revisions/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/props/ns">/catalog/metadata/revisions/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/metadata/revisions/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/props/value">/catalog/metadata/revisions/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/metadata/revisions/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/props/class">/catalog/metadata/revisions/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/metadata/revisions/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/props/remarks">/catalog/metadata/revisions/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/metadata/revisions/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/links">/catalog/metadata/revisions/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/metadata/revisions/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/links/href">/catalog/metadata/revisions/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/metadata/revisions/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/links/rel">/catalog/metadata/revisions/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/metadata/revisions/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/links/media-type">/catalog/metadata/revisions/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/metadata/revisions/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/revisions/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/revisions/links/text">/catalog/metadata/revisions/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/metadata/revisions/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/revisions/revision/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/revisions/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/revisions/remarks">/catalog/metadata/revisions/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/metadata/revisions/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/document-id"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/document-ids" class="toc3 head">document-ids</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/document-ids">/catalog/metadata/document-ids</a> in the object map.</p>
            <p>An array of Document Identifier objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Document Identifier</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                  <p class="path">/catalog/metadata/document-ids</p>
               </div>
               <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                  that are to be treated as different versions of the same document. If this element
                  does not appear, or if the value of this element is empty, the value of "document-id"
                  is equal to the value of the "uuid" flag of the top-level root element.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/document-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/document-ids/scheme" class="toc4 head">scheme</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/document-ids/scheme">/catalog/metadata/document-ids/scheme</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Document Identification Scheme</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                     <p class="path">/catalog/metadata/document-ids/scheme</p>
                  </div>
                  <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                     the value of the element will be interpreted as a string of characters. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/document-id/identifier"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/document-ids/identifier" class="toc4 head">identifier</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/document-ids/identifier">/catalog/metadata/document-ids/identifier</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string </p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>identifier</code>.</p>
                     <p class="path">/catalog/metadata/document-ids/identifier</p>
                  </div>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/prop"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/props" class="toc3 head">props</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/props">/catalog/metadata/props</a> in the object map.</p>
            <p>An array of Property objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Property</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>props</code>.</p>
                  <p class="path">/catalog/metadata/props</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/props/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/props/name">/catalog/metadata/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/catalog/metadata/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/props/uuid" class="toc4 head">uuid</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/props/uuid">/catalog/metadata/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/catalog/metadata/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/props/ns" class="toc4 head">ns</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/props/ns">/catalog/metadata/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/catalog/metadata/props/ns</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/props/value" class="toc4 head">value</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/props/value">/catalog/metadata/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/catalog/metadata/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/props/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/props/class">/catalog/metadata/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/metadata/props/class</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/props/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/props/remarks">/catalog/metadata/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/metadata/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/link"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/links" class="toc3 head">links</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/links">/catalog/metadata/links</a> in the object map.</p>
            <p>An array of Link objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Link</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>links</code>.</p>
                  <p class="path">/catalog/metadata/links</p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/links/href" class="toc4 head">href</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/links/href">/catalog/metadata/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/catalog/metadata/links/href</p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/links/rel" class="toc4 head">rel</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/links/rel">/catalog/metadata/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/catalog/metadata/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/links/media-type" class="toc4 head">media-type</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/links/media-type">/catalog/metadata/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/catalog/metadata/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/links/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/links/text">/catalog/metadata/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/catalog/metadata/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/roles" class="toc3 head">roles</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/roles">/catalog/metadata/roles</a> in the object map.</p>
            <p>An array of Role objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Role</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>roles</code>.</p>
                  <p class="path">/catalog/metadata/roles</p>
               </div>
               <p class="description">Defines a function assumed or expected to be assumed by a party in a specific situation.</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>Permissible values to be determined closer to the application (e.g. by a receiving
                        authority).</p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/@id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/roles/id" class="toc4 head">id</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/roles/id">/catalog/metadata/roles/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/catalog/metadata/roles/id</p>
                  </div>
                  <p class="description">A unique identifier for a specific role instance. This identifier's uniqueness is
                     document scoped and is intended to be consistent for the same role across minor revisions
                     of the document.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/title"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/roles/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/roles/title">/catalog/metadata/roles/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Title</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/catalog/metadata/roles/title</p>
                  </div>
                  <p class="description">A name given to the role, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/short-name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/roles/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/roles/short-name">/catalog/metadata/roles/short-name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>short-name</code>.</p>
                     <p class="path">/catalog/metadata/roles/short-name</p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the role.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/description"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/roles/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/roles/description">/catalog/metadata/roles/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Role Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/catalog/metadata/roles/description</p>
                  </div>
                  <p class="description">A summary of the role's purpose and associated responsibilities.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/roles/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/roles/props">/catalog/metadata/roles/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/metadata/roles/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/props/name">/catalog/metadata/roles/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/metadata/roles/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/props/uuid">/catalog/metadata/roles/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/metadata/roles/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/props/ns">/catalog/metadata/roles/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/metadata/roles/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/props/value">/catalog/metadata/roles/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/metadata/roles/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/props/class">/catalog/metadata/roles/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/metadata/roles/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/props/remarks">/catalog/metadata/roles/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/metadata/roles/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/roles/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/roles/links">/catalog/metadata/roles/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/metadata/roles/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/links/href">/catalog/metadata/roles/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/metadata/roles/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/links/rel">/catalog/metadata/roles/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/metadata/roles/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/links/media-type">/catalog/metadata/roles/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/metadata/roles/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/roles/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/roles/links/text">/catalog/metadata/roles/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/metadata/roles/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/role/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/roles/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/roles/remarks">/catalog/metadata/roles/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/metadata/roles/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/locations" class="toc3 head">locations</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/locations">/catalog/metadata/locations</a> in the object map.</p>
            <p>An array of Location objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Location</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>locations</code>.</p>
                  <p class="path">/catalog/metadata/locations</p>
               </div>
               <p class="description">A location, with associated metadata that can be referenced.</p>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/uuid" class="toc4 head">uuid</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/uuid">/catalog/metadata/locations/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/catalog/metadata/locations/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given location across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/title"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/title">/catalog/metadata/locations/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/catalog/metadata/locations/title</p>
                  </div>
                  <p class="description">A name given to the location, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/address"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/address" class="toc4 head">address</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/address">/catalog/metadata/locations/address</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Address</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>An object  with key <code>address</code>.</p>
                     <p class="path">/catalog/metadata/locations/address</p>
                  </div>
                  <p class="description">A postal address for the location.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>Typically, the physical address of the location will be used here. If this information
                           is sensitive, then a mailing address can be used instead.</p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/address/@type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/address/type" class="toc5 head">type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/address/type">/catalog/metadata/locations/address/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>type</code>.</p>
                        <p class="path">/catalog/metadata/locations/address/type</p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/address/addr-line"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/address/addr-lines" class="toc5 head">addr-lines</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/address/addr-lines">/catalog/metadata/locations/address/addr-lines</a> in the object map.</p>
                  <p>An array of Address line strings</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address line</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                        <p class="path">/catalog/metadata/locations/address/addr-lines</p>
                     </div>
                     <p class="description">A single line of an address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/address/city"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/address/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/address/city">/catalog/metadata/locations/address/city</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>city</code>.</p>
                        <p class="path">/catalog/metadata/locations/address/city</p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/address/state"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/address/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/address/state">/catalog/metadata/locations/address/state</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>state</code>.</p>
                        <p class="path">/catalog/metadata/locations/address/state</p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/address/postal-code"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/address/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/address/postal-code">/catalog/metadata/locations/address/postal-code</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>postal-code</code>.</p>
                        <p class="path">/catalog/metadata/locations/address/postal-code</p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/address/country"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/address/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/address/country">/catalog/metadata/locations/address/country</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>country</code>.</p>
                        <p class="path">/catalog/metadata/locations/address/country</p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/email-address"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/email-addresses" class="toc4 head">email-addresses</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/email-addresses">/catalog/metadata/locations/email-addresses</a> in the object map.</p>
               <p>An array of Email Address strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Email Address</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.email">email</a> member of array <code>email-addresses</code>.</p>
                     <p class="path">/catalog/metadata/locations/email-addresses</p>
                  </div>
                  <p class="description">An email address as defined by <a>RFC 5322 Section 3.4.1</a>. </p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>This is a contact email associated with the location.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/telephone-number"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/telephone-numbers" class="toc4 head">telephone-numbers</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/telephone-numbers">/catalog/metadata/locations/telephone-numbers</a> in the object map.</p>
               <p>An array of Telephone Number objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Telephone Number</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An object of type <a href="link.to.string">string</a> member of array <code>telephone-numbers</code>.</p>
                     <p class="path">/catalog/metadata/locations/telephone-numbers</p>
                  </div>
                  <p class="description">Contact number by telephone.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A phone number used to contact the location.</p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/telephone-number/@type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/telephone-numbers/type" class="toc5 head">type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/telephone-numbers/type">/catalog/metadata/locations/telephone-numbers/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                        <p class="path">/catalog/metadata/locations/telephone-numbers/type</p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/telephone-number/number"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/telephone-numbers/number" class="toc5 head">number</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/telephone-numbers/number">/catalog/metadata/locations/telephone-numbers/number</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>number</code>.</p>
                        <p class="path">/catalog/metadata/locations/telephone-numbers/number</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/url"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/urls" class="toc4 head">urls</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/urls">/catalog/metadata/locations/urls</a> in the object map.</p>
               <p>An array of Location URL strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location URL</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> member of array <code>urls</code>.</p>
                     <p class="path">/catalog/metadata/locations/urls</p>
                  </div>
                  <p class="description">The uniform resource locator (URL) for a web site or Internet presence associated
                     with the location.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/props">/catalog/metadata/locations/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/metadata/locations/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/props/name">/catalog/metadata/locations/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/metadata/locations/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/props/uuid">/catalog/metadata/locations/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/metadata/locations/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/props/ns">/catalog/metadata/locations/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/metadata/locations/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/props/value">/catalog/metadata/locations/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/metadata/locations/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/props/class">/catalog/metadata/locations/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/metadata/locations/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/props/remarks">/catalog/metadata/locations/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/metadata/locations/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/links">/catalog/metadata/locations/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/metadata/locations/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/links/href">/catalog/metadata/locations/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/metadata/locations/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/links/rel">/catalog/metadata/locations/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/metadata/locations/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/links/media-type">/catalog/metadata/locations/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/metadata/locations/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/locations/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/locations/links/text">/catalog/metadata/locations/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/metadata/locations/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/location/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/locations/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/locations/remarks">/catalog/metadata/locations/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/metadata/locations/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/parties" class="toc3 head">parties</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/parties">/catalog/metadata/parties</a> in the object map.</p>
            <p>An array of Party (organization or person) objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Party (organization or person)</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>parties</code>.</p>
                  <p class="path">/catalog/metadata/parties</p>
               </div>
               <p class="description">A responsible entity which is either a person or an organization.</p>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/uuid" class="toc4 head">uuid</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/uuid">/catalog/metadata/parties/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/catalog/metadata/parties/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this defined location elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given party across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/@type"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/type" class="toc4 head">type</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/type">/catalog/metadata/parties/type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Type</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                     <p class="path">/catalog/metadata/parties/type</p>
                  </div>
                  <p class="description">A category describing the kind of party the object describes.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/name">/catalog/metadata/parties/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>name</code>.</p>
                     <p class="path">/catalog/metadata/parties/name</p>
                  </div>
                  <p class="description">The full name of the party. This is typically the legal name associated with the party.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/short-name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/short-name" class="toc4 head">short-name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/short-name">/catalog/metadata/parties/short-name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Short Name</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>short-name</code>.</p>
                     <p class="path">/catalog/metadata/parties/short-name</p>
                  </div>
                  <p class="description">A short common name, abbreviation, or acronym for the party.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/external-id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/external-ids" class="toc4 head">external-ids</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/external-ids">/catalog/metadata/parties/external-ids</a> in the object map.</p>
               <p>An array of Party External Identifier objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Party External Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An object of type <a href="link.to.string">string</a> member of array <code>external-ids</code>.</p>
                     <p class="path">/catalog/metadata/parties/external-ids</p>
                  </div>
                  <p class="description">An identifier for a person or organization using a designated scheme. e.g. an Open
                     Researcher and Contributor ID (ORCID)</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/external-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/external-ids/scheme" class="toc5 head">scheme</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/external-ids/scheme">/catalog/metadata/parties/external-ids/scheme</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string External Identifier Schema</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                        <p class="path">/catalog/metadata/parties/external-ids/scheme</p>
                     </div>
                     <p class="description">Indicates the type of external identifier.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/external-id/id"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/external-ids/id" class="toc5 head">id</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/external-ids/id">/catalog/metadata/parties/external-ids/id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>id</code>.</p>
                        <p class="path">/catalog/metadata/parties/external-ids/id</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/props">/catalog/metadata/parties/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/metadata/parties/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/props/name">/catalog/metadata/parties/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/metadata/parties/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/props/uuid">/catalog/metadata/parties/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/metadata/parties/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/props/ns">/catalog/metadata/parties/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/metadata/parties/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/props/value">/catalog/metadata/parties/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/metadata/parties/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/props/class">/catalog/metadata/parties/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/metadata/parties/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/props/remarks">/catalog/metadata/parties/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/metadata/parties/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/links">/catalog/metadata/parties/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/metadata/parties/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/links/href">/catalog/metadata/parties/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/metadata/parties/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/links/rel">/catalog/metadata/parties/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/metadata/parties/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/links/media-type">/catalog/metadata/parties/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/metadata/parties/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/links/text">/catalog/metadata/parties/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/metadata/parties/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/email-address"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/email-addresses" class="toc4 head">email-addresses</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/email-addresses">/catalog/metadata/parties/email-addresses</a> in the object map.</p>
               <p>An array of Email Address strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Email Address</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.email">email</a> member of array <code>email-addresses</code>.</p>
                     <p class="path">/catalog/metadata/parties/email-addresses</p>
                  </div>
                  <p class="description">An email address as defined by <a>RFC 5322 Section 3.4.1</a>. </p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>This is a contact email associated with the party.</p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/telephone-number"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/telephone-numbers" class="toc4 head">telephone-numbers</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/telephone-numbers">/catalog/metadata/parties/telephone-numbers</a> in the object map.</p>
               <p>An array of Telephone Number objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Telephone Number</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An object of type <a href="link.to.string">string</a> member of array <code>telephone-numbers</code>.</p>
                     <p class="path">/catalog/metadata/parties/telephone-numbers</p>
                  </div>
                  <p class="description">Contact number by telephone.</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>A phone number used to contact the party.</p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/telephone-number/@type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/telephone-numbers/type" class="toc5 head">type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/telephone-numbers/type">/catalog/metadata/parties/telephone-numbers/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string type flag</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>type</code>.</p>
                        <p class="path">/catalog/metadata/parties/telephone-numbers/type</p>
                     </div>
                     <p class="description">Indicates the type of phone number.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/telephone-number/number"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/telephone-numbers/number" class="toc5 head">number</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/telephone-numbers/number">/catalog/metadata/parties/telephone-numbers/number</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>number</code>.</p>
                        <p class="path">/catalog/metadata/parties/telephone-numbers/number</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/address"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/addresses" class="toc4 head">addresses</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/addresses">/catalog/metadata/parties/addresses</a> in the object map.</p>
               <p>An array of Address objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Address</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>addresses</code>.</p>
                     <p class="path">/catalog/metadata/parties/addresses</p>
                  </div>
                  <p class="description">A postal address for the location.</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/address/@type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/addresses/type" class="toc5 head">type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/addresses/type">/catalog/metadata/parties/addresses/type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>type</code>.</p>
                        <p class="path">/catalog/metadata/parties/addresses/type</p>
                     </div>
                     <p class="description">Indicates the type of address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/address/addr-line"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/addresses/addr-lines" class="toc5 head">addr-lines</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/addresses/addr-lines">/catalog/metadata/parties/addresses/addr-lines</a> in the object map.</p>
                  <p>An array of Address line strings</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Address line</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> member of array <code>addr-lines</code>.</p>
                        <p class="path">/catalog/metadata/parties/addresses/addr-lines</p>
                     </div>
                     <p class="description">A single line of an address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/address/city"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/addresses/city" class="toc5 head">city</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/addresses/city">/catalog/metadata/parties/addresses/city</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string City</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>city</code>.</p>
                        <p class="path">/catalog/metadata/parties/addresses/city</p>
                     </div>
                     <p class="description">City, town or geographical region for the mailing address.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/address/state"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/addresses/state" class="toc5 head">state</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/addresses/state">/catalog/metadata/parties/addresses/state</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string State</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>state</code>.</p>
                        <p class="path">/catalog/metadata/parties/addresses/state</p>
                     </div>
                     <p class="description">State, province or analogous geographical region for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/address/postal-code"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/addresses/postal-code" class="toc5 head">postal-code</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/addresses/postal-code">/catalog/metadata/parties/addresses/postal-code</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Postal Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>postal-code</code>.</p>
                        <p class="path">/catalog/metadata/parties/addresses/postal-code</p>
                     </div>
                     <p class="description">Postal or ZIP code for mailing address</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/address/country"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/parties/addresses/country" class="toc5 head">country</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/parties/addresses/country">/catalog/metadata/parties/addresses/country</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Country Code</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>country</code>.</p>
                        <p class="path">/catalog/metadata/parties/addresses/country</p>
                     </div>
                     <p class="description">The ISO 3166-1 alpha-2 country code for the mailing address.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/location-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/location-uuids" class="toc4 head">location-uuids</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/location-uuids">/catalog/metadata/parties/location-uuids</a> in the object map.</p>
               <p>An array of Location Reference strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Location Reference</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>location-uuids</code>.</p>
                     <p class="path">/catalog/metadata/parties/location-uuids</p>
                  </div>
                  <p class="description">References a <code>location</code> defined in <code>metadata</code>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/member-of-organization"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/member-of-organizations" class="toc4 head">member-of-organizations</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/member-of-organizations">/catalog/metadata/parties/member-of-organizations</a> in the object map.</p>
               <p>An array of Organizational Affiliation strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Organizational Affiliation</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>member-of-organizations</code>.</p>
                     <p class="path">/catalog/metadata/parties/member-of-organizations</p>
                  </div>
                  <p class="description">Identifies that the party object is a member of the organization associated with the
                     provided UUID.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/party/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/parties/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/parties/remarks">/catalog/metadata/parties/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/metadata/parties/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/responsible-parties" class="toc3 head">responsible-parties</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties">/catalog/metadata/responsible-parties</a> in the object map.</p>
            <p>An array of Responsible Party objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Responsible Party</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>responsible-parties</code>.</p>
                  <p class="path">/catalog/metadata/responsible-parties</p>
               </div>
               <p class="description">A reference to a set of organizations or persons that have responsibility for performing
                  a referenced role in the context of the containing object.</p>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/@role-id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/responsible-parties/role-id" class="toc4 head">role-id</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/role-id">/catalog/metadata/responsible-parties/role-id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Responsible Role</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>role-id</code>.</p>
                     <p class="path">/catalog/metadata/responsible-parties/role-id</p>
                  </div>
                  <p class="description">The role that the party is responsible for.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/party-uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/responsible-parties/party-uuids" class="toc4 head">party-uuids</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/party-uuids">/catalog/metadata/responsible-parties/party-uuids</a> in the object map.</p>
               <p>An array of Party Reference strings</p>
               <p class="occurrence"><span class="cardinality">[1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Party Reference</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> member of array <code>party-uuids</code>.</p>
                     <p class="path">/catalog/metadata/responsible-parties/party-uuids</p>
                  </div>
                  <p class="description">References a <code>party</code> defined in <code>metadata</code>. </p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks in-use">
                        <p class="nb">(In use)</p>
                        <p>Specifies one or more parties that are responsible for performing the associated <code>role</code>. </p>
                     </div>
                  </details>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/responsible-parties/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/props">/catalog/metadata/responsible-parties/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/metadata/responsible-parties/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/props/name">/catalog/metadata/responsible-parties/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/props/uuid">/catalog/metadata/responsible-parties/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/props/ns">/catalog/metadata/responsible-parties/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/props/value">/catalog/metadata/responsible-parties/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/props/class">/catalog/metadata/responsible-parties/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/props/remarks">/catalog/metadata/responsible-parties/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/responsible-parties/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/links">/catalog/metadata/responsible-parties/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/metadata/responsible-parties/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/links/href">/catalog/metadata/responsible-parties/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/links/rel">/catalog/metadata/responsible-parties/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/links/media-type">/catalog/metadata/responsible-parties/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/metadata/responsible-parties/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/links/text">/catalog/metadata/responsible-parties/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/metadata/responsible-parties/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/responsible-party/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/metadata/responsible-parties/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/metadata/responsible-parties/remarks">/catalog/metadata/responsible-parties/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/metadata/responsible-parties/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/metadata/remarks"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/metadata/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/metadata/remarks">/catalog/metadata/remarks</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                  <p class="path">/catalog/metadata/remarks</p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
            </div>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div class="crosslink"><a href="../xml-reference/#/catalog/param"><button class="schema-link">Switch to XML</button></a></div>
            <h2 id="/catalog/params" class="toc2 head">params</h2>
         </div>
         <p>See <a href="../json-outline/#/catalog/params">/catalog/params</a> in the object map.</p>
         <p>An array of Parameter objects</p>
         <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Parameter</p>
               <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
               <p>An object  member of array <code>params</code>.</p>
               <p class="path">/catalog/params</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/@id"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/id" class="toc3 head">id</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/id">/catalog/params/id</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Parameter Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                  <p class="path">/catalog/params/id</p>
               </div>
               <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                  is document scoped and is intended to be consistent for the same parameter across
                  minor revisions of the document.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/@class"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/class" class="toc3 head">class</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/class">/catalog/params/class</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Parameter Class</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                  <p class="path">/catalog/params/class</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/@depends-on"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/depends-on" class="toc3 head">depends-on</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/depends-on">/catalog/params/depends-on</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Depends on</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>depends-on</code>.</p>
                  <p class="path">/catalog/params/depends-on</p>
               </div>
               <p class="description">Another parameter invoking this one</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/prop"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/props" class="toc3 head">props</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/props">/catalog/params/props</a> in the object map.</p>
            <p>An array of Property objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Property</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>props</code>.</p>
                  <p class="path">/catalog/params/props</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/props/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/props/name">/catalog/params/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/catalog/params/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/props/uuid" class="toc4 head">uuid</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/props/uuid">/catalog/params/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/catalog/params/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/props/ns" class="toc4 head">ns</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/props/ns">/catalog/params/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/catalog/params/props/ns</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/props/value" class="toc4 head">value</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/props/value">/catalog/params/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/catalog/params/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/props/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/props/class">/catalog/params/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/params/props/class</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/props/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/props/remarks">/catalog/params/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/params/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/link"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/links" class="toc3 head">links</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/links">/catalog/params/links</a> in the object map.</p>
            <p>An array of Link objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Link</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>links</code>.</p>
                  <p class="path">/catalog/params/links</p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/links/href" class="toc4 head">href</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/links/href">/catalog/params/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/catalog/params/links/href</p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/links/rel" class="toc4 head">rel</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/links/rel">/catalog/params/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/catalog/params/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/links/media-type" class="toc4 head">media-type</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/links/media-type">/catalog/params/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/catalog/params/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/links/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/links/text">/catalog/params/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/catalog/params/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/label"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/label" class="toc3 head">label</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/label">/catalog/params/label</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Parameter Label</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>label</code>.</p>
                  <p class="path">/catalog/params/label</p>
               </div>
               <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                  a <code>value</code> if no value is assigned.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/usage"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/usage" class="toc3 head">usage</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/usage">/catalog/params/usage</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Parameter Usage Description</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>usage</code>.</p>
                  <p class="path">/catalog/params/usage</p>
               </div>
               <p class="description">Describes the purpose and use of a parameter</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/constraint"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/constraints" class="toc3 head">constraints</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/constraints">/catalog/params/constraints</a> in the object map.</p>
            <p>An array of Constraint objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Constraint</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>constraints</code>.</p>
                  <p class="path">/catalog/params/constraints</p>
               </div>
               <p class="description">A formal or informal expression of a constraint or test</p>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/constraint/description"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/constraints/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/constraints/description">/catalog/params/constraints/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Constraint Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/catalog/params/constraints/description</p>
                  </div>
                  <p class="description">A textual summary of the constraint to be applied.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/constraint/test"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/constraints/tests" class="toc4 head">tests</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/constraints/tests">/catalog/params/constraints/tests</a> in the object map.</p>
               <p>An array of Constraint Test objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Constraint Test</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>tests</code>.</p>
                     <p class="path">/catalog/params/constraints/tests</p>
                  </div>
                  <p class="description">A test expression which is expected to be evaluated by a tool.</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/param/constraint/test/expression"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/params/constraints/tests/expression" class="toc5 head">expression</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/params/constraints/tests/expression">/catalog/params/constraints/tests/expression</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Constraint test</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>expression</code>.</p>
                        <p class="path">/catalog/params/constraints/tests/expression</p>
                     </div>
                     <p class="description">A formal (executable) expression of a constraint</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/param/constraint/test/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/params/constraints/tests/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/params/constraints/tests/remarks">/catalog/params/constraints/tests/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/params/constraints/tests/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/guidelines" class="toc3 head">guidelines</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/guidelines">/catalog/params/guidelines</a> in the object map.</p>
            <p>An array of Guideline objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Guideline</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>guidelines</code>.</p>
                  <p class="path">/catalog/params/guidelines</p>
               </div>
               <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/guidelines/prose" class="toc4 head">prose</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/guidelines/prose">/catalog/params/guidelines/prose</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Guideline Text</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                     <p class="path">/catalog/params/guidelines/prose</p>
                  </div>
                  <p class="description">Prose permits multiple paragraphs, lists, tables etc.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/value"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/values" class="toc3 head">values</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/values">/catalog/params/values</a> in the object map.</p>
            <p>An array of Parameter Value strings</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Parameter Value</p>
                  <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                  <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                  <p class="path">/catalog/params/values</p>
               </div>
               <p class="description">A parameter value or set of values.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/select"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/select" class="toc3 head">select</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/select">/catalog/params/select</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Selection</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>An object  with key <code>select</code>.</p>
                  <p class="path">/catalog/params/select</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/select/@how-many"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/select/how-many" class="toc4 head">how-many</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/select/how-many">/catalog/params/select/how-many</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Cardinality</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>how-many</code>.</p>
                     <p class="path">/catalog/params/select/how-many</p>
                  </div>
                  <p class="description">Describes the number of selections that must occur.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/param/select/choice"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/params/select/choice" class="toc4 head">choice</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/params/select/choice">/catalog/params/select/choice</a> in the object map.</p>
               <p>An array of Choice strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Choice</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                     <p class="path">/catalog/params/select/choice</p>
                  </div>
                  <p class="description">A value selection among several such options</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/param/remarks"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/params/remarks" class="toc3 head">remarks</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/params/remarks">/catalog/params/remarks</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Remarks</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                  <p class="path">/catalog/params/remarks</p>
               </div>
               <p class="description">Additional commentary on the containing object.</p>
            </div>
         </section>
      </section>
      <section class="json-obj">
         <div class="header">
            <div class="crosslink"><a href="../xml-reference/#/catalog/control"><button class="schema-link">Switch to XML</button></a></div>
            <h2 id="/catalog/controls" class="toc2 head">controls</h2>
         </div>
         <p>See <a href="../json-outline/#/catalog/controls">/catalog/controls</a> in the object map.</p>
         <p>An array of Control objects</p>
         <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Control</p>
               <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
               <p>An object  member of array <code>controls</code>.</p>
               <p class="path">/catalog/controls</p>
            </div>
            <p class="description">A structured information object representing a security or privacy control. Each security
               or privacy control within the Catalog is defined by a distinct control instance.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/@id"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/id" class="toc3 head">id</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/id">/catalog/controls/id</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Control Identifier</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                  <p class="path">/catalog/controls/id</p>
               </div>
               <p class="description">A unique identifier for a specific control instance that can be used to reference
                  the control in other OSCAL documents. This identifier's uniqueness is document scoped
                  and is intended to be consistent for the same control across minor revisions of the
                  document.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/@class"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/class" class="toc3 head">class</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/class">/catalog/controls/class</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Control Class</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                  <p class="path">/catalog/controls/class</p>
               </div>
               <p class="description">A textual label that provides a sub-type or characterization of the control.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/title"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/title">/catalog/controls/title</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Control Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                  <p class="path">/catalog/controls/title</p>
               </div>
               <p class="description">A name given to the control, which may be used by a tool for display and navigation.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/param"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/params" class="toc3 head">params</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/params">/catalog/controls/params</a> in the object map.</p>
            <p>An array of Parameter objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Parameter</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>params</code>.</p>
                  <p class="path">/catalog/controls/params</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/@id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/id" class="toc4 head">id</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/id">/catalog/controls/params/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/catalog/controls/params/id</p>
                  </div>
                  <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                     is document scoped and is intended to be consistent for the same parameter across
                     minor revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/class">/catalog/controls/params/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/controls/params/class</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/@depends-on"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/depends-on" class="toc4 head">depends-on</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/depends-on">/catalog/controls/params/depends-on</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Depends on</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>depends-on</code>.</p>
                     <p class="path">/catalog/controls/params/depends-on</p>
                  </div>
                  <p class="description">Another parameter invoking this one</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/props">/catalog/controls/params/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/controls/params/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/props/name">/catalog/controls/params/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/controls/params/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/props/uuid">/catalog/controls/params/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/controls/params/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/props/ns">/catalog/controls/params/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/controls/params/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/props/value">/catalog/controls/params/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/controls/params/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/props/class">/catalog/controls/params/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/controls/params/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/props/remarks">/catalog/controls/params/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/controls/params/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/links">/catalog/controls/params/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/controls/params/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/links/href">/catalog/controls/params/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/controls/params/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/links/rel">/catalog/controls/params/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/controls/params/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/links/media-type">/catalog/controls/params/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/controls/params/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/links/text">/catalog/controls/params/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/controls/params/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/label"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/label" class="toc4 head">label</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/label">/catalog/controls/params/label</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Label</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>label</code>.</p>
                     <p class="path">/catalog/controls/params/label</p>
                  </div>
                  <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                     a <code>value</code> if no value is assigned.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/usage"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/usage" class="toc4 head">usage</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/usage">/catalog/controls/params/usage</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Usage Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>usage</code>.</p>
                     <p class="path">/catalog/controls/params/usage</p>
                  </div>
                  <p class="description">Describes the purpose and use of a parameter</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/constraint"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/constraints" class="toc4 head">constraints</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/constraints">/catalog/controls/params/constraints</a> in the object map.</p>
               <p>An array of Constraint objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Constraint</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>constraints</code>.</p>
                     <p class="path">/catalog/controls/params/constraints</p>
                  </div>
                  <p class="description">A formal or informal expression of a constraint or test</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/constraint/description"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/constraints/description" class="toc5 head">description</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/constraints/description">/catalog/controls/params/constraints/description</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Constraint Description</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                        <p class="path">/catalog/controls/params/constraints/description</p>
                     </div>
                     <p class="description">A textual summary of the constraint to be applied.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/constraint/test"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/constraints/tests" class="toc5 head">tests</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/constraints/tests">/catalog/controls/params/constraints/tests</a> in the object map.</p>
                  <p>An array of Constraint Test objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Constraint Test</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>tests</code>.</p>
                        <p class="path">/catalog/controls/params/constraints/tests</p>
                     </div>
                     <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/constraint/test/expression"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/controls/params/constraints/tests/expression" class="toc6 head">expression</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/controls/params/constraints/tests/expression">/catalog/controls/params/constraints/tests/expression</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Constraint test</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>expression</code>.</p>
                           <p class="path">/catalog/controls/params/constraints/tests/expression</p>
                        </div>
                        <p class="description">A formal (executable) expression of a constraint</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/constraint/test/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/controls/params/constraints/tests/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/controls/params/constraints/tests/remarks">/catalog/controls/params/constraints/tests/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/catalog/controls/params/constraints/tests/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/guidelines" class="toc4 head">guidelines</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/guidelines">/catalog/controls/params/guidelines</a> in the object map.</p>
               <p>An array of Guideline objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Guideline</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>guidelines</code>.</p>
                     <p class="path">/catalog/controls/params/guidelines</p>
                  </div>
                  <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/guidelines/prose" class="toc5 head">prose</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/guidelines/prose">/catalog/controls/params/guidelines/prose</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Guideline Text</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                        <p class="path">/catalog/controls/params/guidelines/prose</p>
                     </div>
                     <p class="description">Prose permits multiple paragraphs, lists, tables etc.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/value"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/values" class="toc4 head">values</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/values">/catalog/controls/params/values</a> in the object map.</p>
               <p>An array of Parameter Value strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Value</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                     <p class="path">/catalog/controls/params/values</p>
                  </div>
                  <p class="description">A parameter value or set of values.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/select"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/select" class="toc4 head">select</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/select">/catalog/controls/params/select</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Selection</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object  with key <code>select</code>.</p>
                     <p class="path">/catalog/controls/params/select</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/select/@how-many"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/select/how-many" class="toc5 head">how-many</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/select/how-many">/catalog/controls/params/select/how-many</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Cardinality</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>how-many</code>.</p>
                        <p class="path">/catalog/controls/params/select/how-many</p>
                     </div>
                     <p class="description">Describes the number of selections that must occur.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/select/choice"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/params/select/choice" class="toc5 head">choice</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/params/select/choice">/catalog/controls/params/select/choice</a> in the object map.</p>
                  <p>An array of Choice strings</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Choice</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                        <p class="path">/catalog/controls/params/select/choice</p>
                     </div>
                     <p class="description">A value selection among several such options</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/param/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/params/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/params/remarks">/catalog/controls/params/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/controls/params/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/prop"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/props" class="toc3 head">props</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/props">/catalog/controls/props</a> in the object map.</p>
            <p>An array of Property objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Property</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>props</code>.</p>
                  <p class="path">/catalog/controls/props</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/props/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/props/name">/catalog/controls/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/catalog/controls/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/props/uuid" class="toc4 head">uuid</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/props/uuid">/catalog/controls/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/catalog/controls/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/props/ns" class="toc4 head">ns</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/props/ns">/catalog/controls/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/catalog/controls/props/ns</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/props/value" class="toc4 head">value</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/props/value">/catalog/controls/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/catalog/controls/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/props/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/props/class">/catalog/controls/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/controls/props/class</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/props/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/props/remarks">/catalog/controls/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/controls/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/link"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/links" class="toc3 head">links</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/links">/catalog/controls/links</a> in the object map.</p>
            <p>An array of Link objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Link</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>links</code>.</p>
                  <p class="path">/catalog/controls/links</p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/links/href" class="toc4 head">href</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/links/href">/catalog/controls/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/catalog/controls/links/href</p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/links/rel" class="toc4 head">rel</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/links/rel">/catalog/controls/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/catalog/controls/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/links/media-type" class="toc4 head">media-type</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/links/media-type">/catalog/controls/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/catalog/controls/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/links/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/links/text">/catalog/controls/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/catalog/controls/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/part"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/parts" class="toc3 head">parts</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/parts">/catalog/controls/parts</a> in the object map.</p>
            <p>An array of Part objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Part</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>parts</code>.</p>
                  <p class="path">/catalog/controls/parts</p>
               </div>
               <p class="description">A partition of a control's definition or a child of another part.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/@id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/id" class="toc4 head">id</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/id">/catalog/controls/parts/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/catalog/controls/parts/id</p>
                  </div>
                  <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                     document scoped and is intended to be consistent for the same part across minor revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/@name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/name">/catalog/controls/parts/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/catalog/controls/parts/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/ns" class="toc4 head">ns</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/ns">/catalog/controls/parts/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/catalog/controls/parts/ns</p>
                  </div>
                  <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                     distinct semantics with the same name.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/class">/catalog/controls/parts/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/controls/parts/class</p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/title"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/title">/catalog/controls/parts/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/catalog/controls/parts/title</p>
                  </div>
                  <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/props">/catalog/controls/parts/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/controls/parts/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/props/name">/catalog/controls/parts/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/controls/parts/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/props/uuid">/catalog/controls/parts/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/controls/parts/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/props/ns">/catalog/controls/parts/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/controls/parts/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/props/value">/catalog/controls/parts/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/controls/parts/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/props/class">/catalog/controls/parts/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/controls/parts/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/props/remarks">/catalog/controls/parts/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/controls/parts/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/prose" class="toc4 head">prose</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/prose">/catalog/controls/parts/prose</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                     <p class="path">/catalog/controls/parts/prose</p>
                  </div>
                  <p class="description">Permits multiple paragraphs, lists, tables etc.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/part"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/parts" class="toc4 head">parts</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/parts">/catalog/controls/parts/parts</a> in the object map.</p>
               <p>An array of Part objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Part</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>parts</code>.</p>
                     <p class="path">/catalog/controls/parts/parts</p>
                  </div>
                  <p class="description">A partition of a control's definition or a child of another part.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/controls/parts/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/controls/parts/links">/catalog/controls/parts/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/controls/parts/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/links/href">/catalog/controls/parts/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/controls/parts/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/links/rel">/catalog/controls/parts/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/controls/parts/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/links/media-type">/catalog/controls/parts/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/controls/parts/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/control/part/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/controls/parts/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/controls/parts/links/text">/catalog/controls/parts/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/controls/parts/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/control/control"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/controls/controls" class="toc3 head">controls</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/controls/controls">/catalog/controls/controls</a> in the object map.</p>
            <p>An array of Control objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Control</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>controls</code>.</p>
                  <p class="path">/catalog/controls/controls</p>
               </div>
               <p class="description">A structured information object representing a security or privacy control. Each security
                  or privacy control within the Catalog is defined by a distinct control instance.</p>
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
      <section class="json-obj">
         <div class="header">
            <div class="crosslink"><a href="../xml-reference/#/catalog/group"><button class="schema-link">Switch to XML</button></a></div>
            <h2 id="/catalog/groups" class="toc2 head">groups</h2>
         </div>
         <p>See <a href="../json-outline/#/catalog/groups">/catalog/groups</a> in the object map.</p>
         <p>An array of Control Group objects</p>
         <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Control Group</p>
               <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
               <p>An object  member of array <code>groups</code>.</p>
               <p class="path">/catalog/groups</p>
            </div>
            <p class="description">A group of controls, or of groups of controls.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/@id"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/id" class="toc3 head">id</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/id">/catalog/groups/id</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Group Identifier</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                  <p class="path">/catalog/groups/id</p>
               </div>
               <p class="description">A unique identifier for a specific group instance that can be used to reference the
                  group within this and in other OSCAL documents. This identifier's uniqueness is document
                  scoped and is intended to be consistent for the same group across minor revisions
                  of the document.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/@class"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/class" class="toc3 head">class</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/class">/catalog/groups/class</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Group Class</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                  <p class="path">/catalog/groups/class</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/title"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/title" class="toc3 head">title</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/title">/catalog/groups/title</a> in the object map.</p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">string Group Title</p>
                  <p class="occurrence"><span class="cardinality">[1]</span></p>
                  <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                  <p class="path">/catalog/groups/title</p>
               </div>
               <p class="description">A name given to the group, which may be used by a tool for display and navigation.</p>
            </div>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/param"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/params" class="toc3 head">params</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/params">/catalog/groups/params</a> in the object map.</p>
            <p>An array of Parameter objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Parameter</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>params</code>.</p>
                  <p class="path">/catalog/groups/params</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/@id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/id" class="toc4 head">id</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/id">/catalog/groups/params/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/catalog/groups/params/id</p>
                  </div>
                  <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                     is document scoped and is intended to be consistent for the same parameter across
                     minor revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/class">/catalog/groups/params/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/groups/params/class</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/@depends-on"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/depends-on" class="toc4 head">depends-on</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/depends-on">/catalog/groups/params/depends-on</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Depends on</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>depends-on</code>.</p>
                     <p class="path">/catalog/groups/params/depends-on</p>
                  </div>
                  <p class="description">Another parameter invoking this one</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/props">/catalog/groups/params/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/groups/params/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/props/name">/catalog/groups/params/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/groups/params/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/props/uuid">/catalog/groups/params/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/groups/params/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/props/ns">/catalog/groups/params/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/groups/params/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/props/value">/catalog/groups/params/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/groups/params/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/props/class">/catalog/groups/params/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/groups/params/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/props/remarks">/catalog/groups/params/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/groups/params/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/links">/catalog/groups/params/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/groups/params/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/links/href">/catalog/groups/params/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/groups/params/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/links/rel">/catalog/groups/params/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/groups/params/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/links/media-type">/catalog/groups/params/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/groups/params/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/links/text">/catalog/groups/params/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/groups/params/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/label"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/label" class="toc4 head">label</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/label">/catalog/groups/params/label</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Label</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>label</code>.</p>
                     <p class="path">/catalog/groups/params/label</p>
                  </div>
                  <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                     a <code>value</code> if no value is assigned.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/usage"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/usage" class="toc4 head">usage</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/usage">/catalog/groups/params/usage</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Usage Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>usage</code>.</p>
                     <p class="path">/catalog/groups/params/usage</p>
                  </div>
                  <p class="description">Describes the purpose and use of a parameter</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/constraint"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/constraints" class="toc4 head">constraints</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/constraints">/catalog/groups/params/constraints</a> in the object map.</p>
               <p>An array of Constraint objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Constraint</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>constraints</code>.</p>
                     <p class="path">/catalog/groups/params/constraints</p>
                  </div>
                  <p class="description">A formal or informal expression of a constraint or test</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/constraint/description"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/constraints/description" class="toc5 head">description</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/constraints/description">/catalog/groups/params/constraints/description</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Constraint Description</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                        <p class="path">/catalog/groups/params/constraints/description</p>
                     </div>
                     <p class="description">A textual summary of the constraint to be applied.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/constraint/test"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/constraints/tests" class="toc5 head">tests</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/constraints/tests">/catalog/groups/params/constraints/tests</a> in the object map.</p>
                  <p>An array of Constraint Test objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Constraint Test</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>tests</code>.</p>
                        <p class="path">/catalog/groups/params/constraints/tests</p>
                     </div>
                     <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/constraint/test/expression"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/params/constraints/tests/expression" class="toc6 head">expression</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/params/constraints/tests/expression">/catalog/groups/params/constraints/tests/expression</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Constraint test</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>expression</code>.</p>
                           <p class="path">/catalog/groups/params/constraints/tests/expression</p>
                        </div>
                        <p class="description">A formal (executable) expression of a constraint</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/constraint/test/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/params/constraints/tests/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/params/constraints/tests/remarks">/catalog/groups/params/constraints/tests/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/catalog/groups/params/constraints/tests/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/guidelines" class="toc4 head">guidelines</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/guidelines">/catalog/groups/params/guidelines</a> in the object map.</p>
               <p>An array of Guideline objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Guideline</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>guidelines</code>.</p>
                     <p class="path">/catalog/groups/params/guidelines</p>
                  </div>
                  <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/guidelines/prose" class="toc5 head">prose</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/guidelines/prose">/catalog/groups/params/guidelines/prose</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Guideline Text</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                        <p class="path">/catalog/groups/params/guidelines/prose</p>
                     </div>
                     <p class="description">Prose permits multiple paragraphs, lists, tables etc.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/value"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/values" class="toc4 head">values</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/values">/catalog/groups/params/values</a> in the object map.</p>
               <p>An array of Parameter Value strings</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Parameter Value</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                     <p class="path">/catalog/groups/params/values</p>
                  </div>
                  <p class="description">A parameter value or set of values.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/select"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/select" class="toc4 head">select</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/select">/catalog/groups/params/select</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Selection</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object  with key <code>select</code>.</p>
                     <p class="path">/catalog/groups/params/select</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/select/@how-many"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/select/how-many" class="toc5 head">how-many</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/select/how-many">/catalog/groups/params/select/how-many</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Cardinality</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>how-many</code>.</p>
                        <p class="path">/catalog/groups/params/select/how-many</p>
                     </div>
                     <p class="description">Describes the number of selections that must occur.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/select/choice"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/params/select/choice" class="toc5 head">choice</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/params/select/choice">/catalog/groups/params/select/choice</a> in the object map.</p>
                  <p>An array of Choice strings</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Choice</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                        <p class="path">/catalog/groups/params/select/choice</p>
                     </div>
                     <p class="description">A value selection among several such options</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/param/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/params/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/params/remarks">/catalog/groups/params/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/groups/params/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/prop"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/props" class="toc3 head">props</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/props">/catalog/groups/props</a> in the object map.</p>
            <p>An array of Property objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Property</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>props</code>.</p>
                  <p class="path">/catalog/groups/props</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/props/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/props/name">/catalog/groups/props/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/catalog/groups/props/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                     quality of the property's containing object.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/props/uuid" class="toc4 head">uuid</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/props/uuid">/catalog/groups/props/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/catalog/groups/props/uuid</p>
                  </div>
                  <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                     document. A UUID should be consistently used for a given location across revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/props/ns" class="toc4 head">ns</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/props/ns">/catalog/groups/props/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/catalog/groups/props/ns</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/props/value" class="toc4 head">value</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/props/value">/catalog/groups/props/value</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Value</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                     <p class="path">/catalog/groups/props/value</p>
                  </div>
                  <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/props/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/props/class">/catalog/groups/props/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Property Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/groups/props/class</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/props/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/props/remarks">/catalog/groups/props/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/groups/props/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/link"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/links" class="toc3 head">links</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/links">/catalog/groups/links</a> in the object map.</p>
            <p>An array of Link objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Link</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>links</code>.</p>
                  <p class="path">/catalog/groups/links</p>
               </div>
               <p class="description">A reference to a local or remote resource</p>
               <details open="open" class="remarks-group">
                  <summary>Remarks</summary>
                  <div class="remarks">
                     <p>To provide a cryptographic hash for a remote target resource, a local reference to
                        a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                     <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                  </div>
               </details>
            </div>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/links/href" class="toc4 head">href</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/links/href">/catalog/groups/links/href</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Hypertext Reference</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                     <p class="path">/catalog/groups/links/href</p>
                  </div>
                  <p class="description">A resolvable URL reference to a resource.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/links/rel" class="toc4 head">rel</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/links/rel">/catalog/groups/links/rel</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Relation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                     <p class="path">/catalog/groups/links/rel</p>
                  </div>
                  <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                     of the link's purpose.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/links/media-type" class="toc4 head">media-type</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/links/media-type">/catalog/groups/links/media-type</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Media Type</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                     <p class="path">/catalog/groups/links/media-type</p>
                  </div>
                  <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                     <a>Media Types Registry</a>. </p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/link/text"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/links/text" class="toc4 head">text</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/links/text">/catalog/groups/links/text</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Link Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                     <p class="path">/catalog/groups/links/text</p>
                  </div>
                  <p class="description">A textual label to associate with the link, which may be used for presentation in
                     a tool.</p>
               </div>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/part"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/parts" class="toc3 head">parts</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/parts">/catalog/groups/parts</a> in the object map.</p>
            <p>An array of Part objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Part</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>parts</code>.</p>
                  <p class="path">/catalog/groups/parts</p>
               </div>
               <p class="description">A partition of a control's definition or a child of another part.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/@id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/id" class="toc4 head">id</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/id">/catalog/groups/parts/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/catalog/groups/parts/id</p>
                  </div>
                  <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                     document scoped and is intended to be consistent for the same part across minor revisions
                     of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/@name"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/name" class="toc4 head">name</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/name">/catalog/groups/parts/name</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Name</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                     <p class="path">/catalog/groups/parts/name</p>
                  </div>
                  <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/@ns"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/ns" class="toc4 head">ns</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/ns">/catalog/groups/parts/ns</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Namespace</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                     <p class="path">/catalog/groups/parts/ns</p>
                  </div>
                  <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                     distinct semantics with the same name.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/class">/catalog/groups/parts/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/groups/parts/class</p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                     multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/title"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/title">/catalog/groups/parts/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/catalog/groups/parts/title</p>
                  </div>
                  <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/props">/catalog/groups/parts/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/groups/parts/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/props/name">/catalog/groups/parts/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/groups/parts/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/props/uuid">/catalog/groups/parts/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/groups/parts/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/props/ns">/catalog/groups/parts/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/groups/parts/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/props/value">/catalog/groups/parts/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/groups/parts/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/props/class">/catalog/groups/parts/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/groups/parts/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/props/remarks">/catalog/groups/parts/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/groups/parts/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/prose" class="toc4 head">prose</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/prose">/catalog/groups/parts/prose</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Part Text</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                     <p class="path">/catalog/groups/parts/prose</p>
                  </div>
                  <p class="description">Permits multiple paragraphs, lists, tables etc.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/part"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/parts" class="toc4 head">parts</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/parts">/catalog/groups/parts/parts</a> in the object map.</p>
               <p>An array of Part objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Part</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>parts</code>.</p>
                     <p class="path">/catalog/groups/parts/parts</p>
                  </div>
                  <p class="description">A partition of a control's definition or a child of another part.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/parts/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/parts/links">/catalog/groups/parts/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/groups/parts/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/links/href">/catalog/groups/parts/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/groups/parts/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/links/rel">/catalog/groups/parts/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/groups/parts/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/links/media-type">/catalog/groups/parts/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/groups/parts/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/part/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/parts/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/parts/links/text">/catalog/groups/parts/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/groups/parts/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
         </section>
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/group"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/groups" class="toc3 head">groups</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/groups">/catalog/groups/groups</a> in the object map.</p>
            <p>An array of Control Group objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Control Group</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>groups</code>.</p>
                  <p class="path">/catalog/groups/groups</p>
               </div>
               <p class="description">A group of controls, or of groups of controls.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/group/control"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/groups/controls" class="toc3 head">controls</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/groups/controls">/catalog/groups/controls</a> in the object map.</p>
            <p>An array of Control objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Control</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>controls</code>.</p>
                  <p class="path">/catalog/groups/controls</p>
               </div>
               <p class="description">A structured information object representing a security or privacy control. Each security
                  or privacy control within the Catalog is defined by a distinct control instance.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/@id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/id" class="toc4 head">id</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/id">/catalog/groups/controls/id</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                     <p class="path">/catalog/groups/controls/id</p>
                  </div>
                  <p class="description">A unique identifier for a specific control instance that can be used to reference
                     the control in other OSCAL documents. This identifier's uniqueness is document scoped
                     and is intended to be consistent for the same control across minor revisions of the
                     document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/@class"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/class" class="toc4 head">class</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/class">/catalog/groups/controls/class</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Class</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                     <p class="path">/catalog/groups/controls/class</p>
                  </div>
                  <p class="description">A textual label that provides a sub-type or characterization of the control.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/title"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/title">/catalog/groups/controls/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Control Title</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/catalog/groups/controls/title</p>
                  </div>
                  <p class="description">A name given to the control, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/params" class="toc4 head">params</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/params">/catalog/groups/controls/params</a> in the object map.</p>
               <p>An array of Parameter objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Parameter</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>params</code>.</p>
                     <p class="path">/catalog/groups/controls/params</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/@id"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/id" class="toc5 head">id</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/id">/catalog/groups/controls/params/id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Identifier</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                        <p class="path">/catalog/groups/controls/params/id</p>
                     </div>
                     <p class="description">A unique identifier for a specific parameter instance. This identifier's uniqueness
                        is document scoped and is intended to be consistent for the same parameter across
                        minor revisions of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/class">/catalog/groups/controls/params/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/groups/controls/params/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/@depends-on"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/depends-on" class="toc5 head">depends-on</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/depends-on">/catalog/groups/controls/params/depends-on</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Depends on</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>depends-on</code>.</p>
                        <p class="path">/catalog/groups/controls/params/depends-on</p>
                     </div>
                     <p class="description">Another parameter invoking this one</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/prop"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/props" class="toc5 head">props</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/props">/catalog/groups/controls/params/props</a> in the object map.</p>
                  <p>An array of Property objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Property</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>props</code>.</p>
                        <p class="path">/catalog/groups/controls/params/props</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/props/name" class="toc6 head">name</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/props/name">/catalog/groups/controls/params/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/catalog/groups/controls/params/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/props/uuid" class="toc6 head">uuid</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/props/uuid">/catalog/groups/controls/params/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/catalog/groups/controls/params/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/props/ns" class="toc6 head">ns</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/props/ns">/catalog/groups/controls/params/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/catalog/groups/controls/params/props/ns</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/props/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/props/value">/catalog/groups/controls/params/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/catalog/groups/controls/params/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/props/class" class="toc6 head">class</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/props/class">/catalog/groups/controls/params/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/catalog/groups/controls/params/props/class</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/props/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/props/remarks">/catalog/groups/controls/params/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/catalog/groups/controls/params/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/link"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/links" class="toc5 head">links</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/links">/catalog/groups/controls/params/links</a> in the object map.</p>
                  <p>An array of Link objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Link</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>links</code>.</p>
                        <p class="path">/catalog/groups/controls/params/links</p>
                     </div>
                     <p class="description">A reference to a local or remote resource</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To provide a cryptographic hash for a remote target resource, a local reference to
                              a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                           <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                        </div>
                     </details>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/links/href" class="toc6 head">href</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/links/href">/catalog/groups/controls/params/links/href</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                           <p class="path">/catalog/groups/controls/params/links/href</p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/links/rel" class="toc6 head">rel</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/links/rel">/catalog/groups/controls/params/links/rel</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                           <p class="path">/catalog/groups/controls/params/links/rel</p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/links/media-type" class="toc6 head">media-type</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/links/media-type">/catalog/groups/controls/params/links/media-type</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                           <p class="path">/catalog/groups/controls/params/links/media-type</p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/link/text"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/links/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/links/text">/catalog/groups/controls/params/links/text</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                           <p class="path">/catalog/groups/controls/params/links/text</p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/label"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/label" class="toc5 head">label</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/label">/catalog/groups/controls/params/label</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Label</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>label</code>.</p>
                        <p class="path">/catalog/groups/controls/params/label</p>
                     </div>
                     <p class="description">A short, placeholder name for the parameter, which can be used as a substitute for
                        a <code>value</code> if no value is assigned.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/usage"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/usage" class="toc5 head">usage</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/usage">/catalog/groups/controls/params/usage</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Usage Description</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>usage</code>.</p>
                        <p class="path">/catalog/groups/controls/params/usage</p>
                     </div>
                     <p class="description">Describes the purpose and use of a parameter</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/constraint"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/constraints" class="toc5 head">constraints</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/constraints">/catalog/groups/controls/params/constraints</a> in the object map.</p>
                  <p>An array of Constraint objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Constraint</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>constraints</code>.</p>
                        <p class="path">/catalog/groups/controls/params/constraints</p>
                     </div>
                     <p class="description">A formal or informal expression of a constraint or test</p>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/constraint/description"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/constraints/description" class="toc6 head">description</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/constraints/description">/catalog/groups/controls/params/constraints/description</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Constraint Description</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                           <p class="path">/catalog/groups/controls/params/constraints/description</p>
                        </div>
                        <p class="description">A textual summary of the constraint to be applied.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/constraint/test"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/constraints/tests" class="toc6 head">tests</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/constraints/tests">/catalog/groups/controls/params/constraints/tests</a> in the object map.</p>
                     <p>An array of Constraint Test objects</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">object Constraint Test</p>
                           <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                           <p>An object  member of array <code>tests</code>.</p>
                           <p class="path">/catalog/groups/controls/params/constraints/tests</p>
                        </div>
                        <p class="description">A test expression which is expected to be evaluated by a tool.</p>
                     </div>
                     <section class="json-obj">
                        <div class="header">
                           <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/constraint/test/expression"><button class="schema-link">Switch to XML</button></a></div>
                           <h7 id="/catalog/groups/controls/params/constraints/tests/expression" class="toc7 head">expression</h7>
                        </div>
                        <p>See <a href="../json-outline/#/catalog/groups/controls/params/constraints/tests/expression">/catalog/groups/controls/params/constraints/tests/expression</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Constraint test</p>
                              <p class="occurrence"><span class="cardinality">[1]</span></p>
                              <p>A string of type <a href="link.to.string">string</a> with key <code>expression</code>.</p>
                              <p class="path">/catalog/groups/controls/params/constraints/tests/expression</p>
                           </div>
                           <p class="description">A formal (executable) expression of a constraint</p>
                        </div>
                     </section>
                     <section class="json-obj">
                        <div class="header">
                           <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/constraint/test/remarks"><button class="schema-link">Switch to XML</button></a></div>
                           <h7 id="/catalog/groups/controls/params/constraints/tests/remarks" class="toc7 head">remarks</h7>
                        </div>
                        <p>See <a href="../json-outline/#/catalog/groups/controls/params/constraints/tests/remarks">/catalog/groups/controls/params/constraints/tests/remarks</a> in the object map.</p>
                        <div class="obj-desc">
                           <div class="obj-matrix">
                              <p class="obj-name">string Remarks</p>
                              <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                              <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                              <p class="path">/catalog/groups/controls/params/constraints/tests/remarks</p>
                           </div>
                           <p class="description">Additional commentary on the containing object.</p>
                        </div>
                     </section>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/guidelines" class="toc5 head">guidelines</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/guidelines">/catalog/groups/controls/params/guidelines</a> in the object map.</p>
                  <p>An array of Guideline objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Guideline</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>guidelines</code>.</p>
                        <p class="path">/catalog/groups/controls/params/guidelines</p>
                     </div>
                     <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/guideline"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/guidelines/prose" class="toc6 head">prose</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/guidelines/prose">/catalog/groups/controls/params/guidelines/prose</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Guideline Text</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                           <p class="path">/catalog/groups/controls/params/guidelines/prose</p>
                        </div>
                        <p class="description">Prose permits multiple paragraphs, lists, tables etc.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/values" class="toc5 head">values</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/values">/catalog/groups/controls/params/values</a> in the object map.</p>
                  <p>An array of Parameter Value strings</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Parameter Value</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> member of array <code>values</code>.</p>
                        <p class="path">/catalog/groups/controls/params/values</p>
                     </div>
                     <p class="description">A parameter value or set of values.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/select"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/select" class="toc5 head">select</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/select">/catalog/groups/controls/params/select</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Selection</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An object  with key <code>select</code>.</p>
                        <p class="path">/catalog/groups/controls/params/select</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/select/@how-many"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/select/how-many" class="toc6 head">how-many</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/select/how-many">/catalog/groups/controls/params/select/how-many</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Parameter Cardinality</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>how-many</code>.</p>
                           <p class="path">/catalog/groups/controls/params/select/how-many</p>
                        </div>
                        <p class="description">Describes the number of selections that must occur.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/select/choice"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/params/select/choice" class="toc6 head">choice</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/params/select/choice">/catalog/groups/controls/params/select/choice</a> in the object map.</p>
                     <p>An array of Choice strings</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Choice</p>
                           <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> member of array <code>choice</code>.</p>
                           <p class="path">/catalog/groups/controls/params/select/choice</p>
                        </div>
                        <p class="description">A value selection among several such options</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/param/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/params/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/params/remarks">/catalog/groups/controls/params/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/groups/controls/params/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/props">/catalog/groups/controls/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/groups/controls/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/props/name">/catalog/groups/controls/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/groups/controls/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/props/uuid">/catalog/groups/controls/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/groups/controls/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/props/ns">/catalog/groups/controls/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/groups/controls/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/props/value">/catalog/groups/controls/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/groups/controls/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/props/class">/catalog/groups/controls/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/groups/controls/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/props/remarks">/catalog/groups/controls/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/groups/controls/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/link"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/links" class="toc4 head">links</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/links">/catalog/groups/controls/links</a> in the object map.</p>
               <p>An array of Link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>links</code>.</p>
                     <p class="path">/catalog/groups/controls/links</p>
                  </div>
                  <p class="description">A reference to a local or remote resource</p>
                  <details open="open" class="remarks-group">
                     <summary>Remarks</summary>
                     <div class="remarks">
                        <p>To provide a cryptographic hash for a remote target resource, a local reference to
                           a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                        <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                     </div>
                  </details>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/links/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/links/href">/catalog/groups/controls/links/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/groups/controls/links/href</p>
                     </div>
                     <p class="description">A resolvable URL reference to a resource.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/links/rel" class="toc5 head">rel</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/links/rel">/catalog/groups/controls/links/rel</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Relation</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                        <p class="path">/catalog/groups/controls/links/rel</p>
                     </div>
                     <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                        of the link's purpose.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/links/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/links/media-type">/catalog/groups/controls/links/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/groups/controls/links/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/link/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/links/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/links/text">/catalog/groups/controls/links/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Link Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/groups/controls/links/text</p>
                     </div>
                     <p class="description">A textual label to associate with the link, which may be used for presentation in
                        a tool.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/parts" class="toc4 head">parts</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/parts">/catalog/groups/controls/parts</a> in the object map.</p>
               <p>An array of Part objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Part</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>parts</code>.</p>
                     <p class="path">/catalog/groups/controls/parts</p>
                  </div>
                  <p class="description">A partition of a control's definition or a child of another part.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/@id"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/id" class="toc5 head">id</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/id">/catalog/groups/controls/parts/id</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Part Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>id</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/id</p>
                     </div>
                     <p class="description">A unique identifier for a specific part instance. This identifier's uniqueness is
                        document scoped and is intended to be consistent for the same part across minor revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/name">/catalog/groups/controls/parts/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Part Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies the part's semantic type.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/ns">/catalog/groups/controls/parts/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Part Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/ns</p>
                     </div>
                     <p class="description">A namespace qualifying the part's name. This allows different organizations to associate
                        distinct semantics with the same name.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/class">/catalog/groups/controls/parts/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Part Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/class</p>
                     </div>
                     <p class="description">A textual label that provides a sub-type or characterization of the part's <code>name</code>. This can be used to further distinguish or discriminate between the semantics of
                        multiple parts of the same control with the same <code>name</code> and <code>ns</code>. </p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/title"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/title" class="toc5 head">title</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/title">/catalog/groups/controls/parts/title</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Part Title</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/title</p>
                     </div>
                     <p class="description">A name given to the part, which may be used by a tool for display and navigation.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/prop"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/props" class="toc5 head">props</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/props">/catalog/groups/controls/parts/props</a> in the object map.</p>
                  <p>An array of Property objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Property</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>props</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/props</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/props/name" class="toc6 head">name</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/props/name">/catalog/groups/controls/parts/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/props/uuid" class="toc6 head">uuid</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/props/uuid">/catalog/groups/controls/parts/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/props/ns" class="toc6 head">ns</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/props/ns">/catalog/groups/controls/parts/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/props/ns</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/props/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/props/value">/catalog/groups/controls/parts/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/props/class" class="toc6 head">class</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/props/class">/catalog/groups/controls/parts/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/props/class</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/props/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/props/remarks">/catalog/groups/controls/parts/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/prose" class="toc5 head">prose</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/prose">/catalog/groups/controls/parts/prose</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Part Text</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>prose</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/prose</p>
                     </div>
                     <p class="description">Permits multiple paragraphs, lists, tables etc.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/part"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/parts" class="toc5 head">parts</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/parts">/catalog/groups/controls/parts/parts</a> in the object map.</p>
                  <p>An array of Part objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Part</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>parts</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/parts</p>
                     </div>
                     <p class="description">A partition of a control's definition or a child of another part.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/link"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/groups/controls/parts/links" class="toc5 head">links</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/groups/controls/parts/links">/catalog/groups/controls/parts/links</a> in the object map.</p>
                  <p>An array of Link objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Link</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>links</code>.</p>
                        <p class="path">/catalog/groups/controls/parts/links</p>
                     </div>
                     <p class="description">A reference to a local or remote resource</p>
                     <details open="open" class="remarks-group">
                        <summary>Remarks</summary>
                        <div class="remarks">
                           <p>To provide a cryptographic hash for a remote target resource, a local reference to
                              a back matter <code>resource</code> is needed. The resource allows one or more hash values to be provided using the <code>rlink/hash</code> object.</p>
                           <p>The OSCAL <code>link</code> is a roughly based on the HTML <a>link element</a>. </p>
                        </div>
                     </details>
                  </div>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/link/@href"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/links/href" class="toc6 head">href</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/links/href">/catalog/groups/controls/parts/links/href</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hypertext Reference</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/links/href</p>
                        </div>
                        <p class="description">A resolvable URL reference to a resource.</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/link/@rel"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/links/rel" class="toc6 head">rel</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/links/rel">/catalog/groups/controls/parts/links/rel</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Relation</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>rel</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/links/rel</p>
                        </div>
                        <p class="description">Describes the type of relationship provided by the link. This can be an indicator
                           of the link's purpose.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/link/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/links/media-type" class="toc6 head">media-type</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/links/media-type">/catalog/groups/controls/parts/links/media-type</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Media Type</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/links/media-type</p>
                        </div>
                        <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                           <a>Media Types Registry</a>. </p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/part/link/text"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/groups/controls/parts/links/text" class="toc6 head">text</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/groups/controls/parts/links/text">/catalog/groups/controls/parts/links/text</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Link Text</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                           <p class="path">/catalog/groups/controls/parts/links/text</p>
                        </div>
                        <p class="description">A textual label to associate with the link, which may be used for presentation in
                           a tool.</p>
                     </div>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/group/control/control"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/groups/controls/controls" class="toc4 head">controls</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/groups/controls/controls">/catalog/groups/controls/controls</a> in the object map.</p>
               <p>An array of Control objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Control</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>controls</code>.</p>
                     <p class="path">/catalog/groups/controls/controls</p>
                  </div>
                  <p class="description">A structured information object representing a security or privacy control. Each security
                     or privacy control within the Catalog is defined by a distinct control instance.</p>
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
      <section class="json-obj">
         <div class="header">
            <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter"><button class="schema-link">Switch to XML</button></a></div>
            <h2 id="/catalog/back-matter" class="toc2 head">back-matter</h2>
         </div>
         <p>See <a href="../json-outline/#/catalog/back-matter">/catalog/back-matter</a> in the object map.</p>
         <div class="obj-desc">
            <div class="obj-matrix">
               <p class="obj-name">object Back matter</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <p>An object  with key <code>back-matter</code>.</p>
               <p class="path">/catalog/back-matter</p>
            </div>
            <p class="description">A collection of resources, which may be included directly or by reference.</p>
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
         <section class="json-obj">
            <div class="header">
               <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource"><button class="schema-link">Switch to XML</button></a></div>
               <h3 id="/catalog/back-matter/resources" class="toc3 head">resources</h3>
            </div>
            <p>See <a href="../json-outline/#/catalog/back-matter/resources">/catalog/back-matter/resources</a> in the object map.</p>
            <p>An array of Resource objects</p>
            <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
            <div class="obj-desc">
               <div class="obj-matrix">
                  <p class="obj-name">object Resource</p>
                  <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                  <p>An object  member of array <code>resources</code>.</p>
                  <p class="path">/catalog/back-matter/resources</p>
               </div>
               <p class="description">A resource associated with content in the containing document. A resource may be directly
                  included in the document base64 encoded or may point to one or more equivalent internet
                  resources.</p>
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
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/uuid" class="toc4 head">uuid</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/uuid">/catalog/back-matter/resources/uuid</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Universally Unique Identifier</p>
                     <p class="occurrence"><span class="cardinality">[1]</span></p>
                     <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                     <p class="path">/catalog/back-matter/resources/uuid</p>
                  </div>
                  <p class="description">A globally unique identifier that can be used to reference this defined resource elsewhere
                     in an OSCAL document. A UUID should be consistently used for a given resource across
                     revisions of the document.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/title"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/title" class="toc4 head">title</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/title">/catalog/back-matter/resources/title</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Title</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>title</code>.</p>
                     <p class="path">/catalog/back-matter/resources/title</p>
                  </div>
                  <p class="description">A name given to the resource, which may be used by a tool for display and navigation.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/description"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/description" class="toc4 head">description</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/description">/catalog/back-matter/resources/description</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Resource Description</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>description</code>.</p>
                     <p class="path">/catalog/back-matter/resources/description</p>
                  </div>
                  <p class="description">A short summary of the resource used to indicate the purpose of the resource.</p>
               </div>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/prop"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/props" class="toc4 head">props</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/props">/catalog/back-matter/resources/props</a> in the object map.</p>
               <p>An array of Property objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Property</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>props</code>.</p>
                     <p class="path">/catalog/back-matter/resources/props</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/props/name" class="toc5 head">name</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/props/name">/catalog/back-matter/resources/props/name</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Name</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                        <p class="path">/catalog/back-matter/resources/props/name</p>
                     </div>
                     <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                        quality of the property's containing object.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/props/uuid" class="toc5 head">uuid</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/props/uuid">/catalog/back-matter/resources/props/uuid</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Universally Unique Identifier</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                        <p class="path">/catalog/back-matter/resources/props/uuid</p>
                     </div>
                     <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                        document. A UUID should be consistently used for a given location across revisions
                        of the document.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/props/ns" class="toc5 head">ns</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/props/ns">/catalog/back-matter/resources/props/ns</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Namespace</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                        <p class="path">/catalog/back-matter/resources/props/ns</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/props/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/props/value">/catalog/back-matter/resources/props/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Value</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/back-matter/resources/props/value</p>
                     </div>
                     <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/props/class" class="toc5 head">class</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/props/class">/catalog/back-matter/resources/props/class</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Property Class</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                        <p class="path">/catalog/back-matter/resources/props/class</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/props/remarks" class="toc5 head">remarks</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/props/remarks">/catalog/back-matter/resources/props/remarks</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Remarks</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                        <p class="path">/catalog/back-matter/resources/props/remarks</p>
                     </div>
                     <p class="description">Additional commentary on the containing object.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/document-id"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/document-ids" class="toc4 head">document-ids</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/document-ids">/catalog/back-matter/resources/document-ids</a> in the object map.</p>
               <p>An array of Document Identifier objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Document Identifier</p>
                     <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                     <p>An object of type <a href="link.to.string">string</a> member of array <code>document-ids</code>.</p>
                     <p class="path">/catalog/back-matter/resources/document-ids</p>
                  </div>
                  <p class="description">A document identifier qualified by an identifier <code>scheme</code>. A document identifier provides a globally unique identifier for a group of documents
                     that are to be treated as different versions of the same document. If this element
                     does not appear, or if the value of this element is empty, the value of "document-id"
                     is equal to the value of the "uuid" flag of the top-level root element.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/document-id/@scheme"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/document-ids/scheme" class="toc5 head">scheme</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/document-ids/scheme">/catalog/back-matter/resources/document-ids/scheme</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Document Identification Scheme</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri">uri</a> with key <code>scheme</code>.</p>
                        <p class="path">/catalog/back-matter/resources/document-ids/scheme</p>
                     </div>
                     <p class="description">Qualifies the kind of document identifier using a URI. If the scheme is not provided
                        the value of the element will be interpreted as a string of characters. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/document-id/identifier"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/document-ids/identifier" class="toc5 head">identifier</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/document-ids/identifier">/catalog/back-matter/resources/document-ids/identifier</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>identifier</code>.</p>
                        <p class="path">/catalog/back-matter/resources/document-ids/identifier</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/citation" class="toc4 head">citation</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation">/catalog/back-matter/resources/citation</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Citation</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object  with key <code>citation</code>.</p>
                     <p class="path">/catalog/back-matter/resources/citation</p>
                  </div>
                  <p class="description">A citation consisting of end note text and optional structured bibliographic data.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/text"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/citation/text" class="toc5 head">text</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/text">/catalog/back-matter/resources/citation/text</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Citation Text</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.markup-line">markup-line</a> with key <code>text</code>.</p>
                        <p class="path">/catalog/back-matter/resources/citation/text</p>
                     </div>
                     <p class="description">A line of citation text.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/prop"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/citation/props" class="toc5 head">props</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/props">/catalog/back-matter/resources/citation/props</a> in the object map.</p>
                  <p>An array of Property objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Property</p>
                        <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                        <p>An object  member of array <code>props</code>.</p>
                        <p class="path">/catalog/back-matter/resources/citation/props</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@name"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/citation/props/name" class="toc6 head">name</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/props/name">/catalog/back-matter/resources/citation/props/name</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Name</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>name</code>.</p>
                           <p class="path">/catalog/back-matter/resources/citation/props/name</p>
                        </div>
                        <p class="description">A textual label that uniquely identifies a specific attribute, characteristic, or
                           quality of the property's containing object.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@uuid"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/citation/props/uuid" class="toc6 head">uuid</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/props/uuid">/catalog/back-matter/resources/citation/props/uuid</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Universally Unique Identifier</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uuid">uuid</a> with key <code>uuid</code>.</p>
                           <p class="path">/catalog/back-matter/resources/citation/props/uuid</p>
                        </div>
                        <p class="description">A unique identifier that can be used to reference this property elsewhere in an OSCAL
                           document. A UUID should be consistently used for a given location across revisions
                           of the document.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@ns"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/citation/props/ns" class="toc6 head">ns</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/props/ns">/catalog/back-matter/resources/citation/props/ns</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Namespace</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.uri">uri</a> with key <code>ns</code>.</p>
                           <p class="path">/catalog/back-matter/resources/citation/props/ns</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@value"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/citation/props/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/props/value">/catalog/back-matter/resources/citation/props/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Value</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/catalog/back-matter/resources/citation/props/value</p>
                        </div>
                        <p class="description">Indicates the value of the attribute, characteristic, or quality.</p>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@class"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/citation/props/class" class="toc6 head">class</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/props/class">/catalog/back-matter/resources/citation/props/class</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Property Class</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.NCName">NCName</a> with key <code>class</code>.</p>
                           <p class="path">/catalog/back-matter/resources/citation/props/class</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/prop/remarks"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/citation/props/remarks" class="toc6 head">remarks</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/props/remarks">/catalog/back-matter/resources/citation/props/remarks</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Remarks</p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                           <p class="path">/catalog/back-matter/resources/citation/props/remarks</p>
                        </div>
                        <p class="description">Additional commentary on the containing object.</p>
                     </div>
                  </section>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/citation/biblio"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/citation/biblio" class="toc5 head">biblio</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/citation/biblio">/catalog/back-matter/resources/citation/biblio</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Bibliographic Definition</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>An object  with key <code>biblio</code>.</p>
                        <p class="path">/catalog/back-matter/resources/citation/biblio</p>
                     </div>
                     <p class="description">A container for structured bibliographic information. The model of this information
                        is undefined by OSCAL.</p>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/rlink"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/rlinks" class="toc4 head">rlinks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/rlinks">/catalog/back-matter/resources/rlinks</a> in the object map.</p>
               <p>An array of Resource link objects</p>
               <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Resource link</p>
                     <p class="occurrence"><span class="cardinality">[1 to ∞]</span></p>
                     <p>An object  member of array <code>rlinks</code>.</p>
                     <p class="path">/catalog/back-matter/resources/rlinks</p>
                  </div>
                  <p class="description">A pointer to an external resource with an optional hash for verification and change
                     detection.</p>
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
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/rlink/@href"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/rlinks/href" class="toc5 head">href</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/rlinks/href">/catalog/back-matter/resources/rlinks/href</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Hypertext Reference</p>
                        <p class="occurrence"><span class="cardinality">[1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>href</code>.</p>
                        <p class="path">/catalog/back-matter/resources/rlinks/href</p>
                     </div>
                     <p class="description">A resolvable URI reference to a resource.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/rlink/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/rlinks/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/rlinks/media-type">/catalog/back-matter/resources/rlinks/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/back-matter/resources/rlinks/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/rlink/hash"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/rlinks/hashes" class="toc5 head">hashes</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/rlinks/hashes">/catalog/back-matter/resources/rlinks/hashes</a> in the object map.</p>
                  <p>An array of Hash objects</p>
                  <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">object Hash</p>
                        <p class="occurrence"><span class="cardinality">[0 to ∞]</span></p>
                        <p>An object of type <a href="link.to.string">string</a> member of array <code>hashes</code>.</p>
                        <p class="path">/catalog/back-matter/resources/rlinks/hashes</p>
                     </div>
                     <p class="description">A representation of a cryptographic digest generated over a resource using a specified
                        hash algorithm.</p>
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
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/rlink/hash/@algorithm"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/rlinks/hashes/algorithm" class="toc6 head">algorithm</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/rlinks/hashes/algorithm">/catalog/back-matter/resources/rlinks/hashes/algorithm</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string Hash algorithm</p>
                           <p class="occurrence"><span class="cardinality">[1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>algorithm</code>.</p>
                           <p class="path">/catalog/back-matter/resources/rlinks/hashes/algorithm</p>
                        </div>
                        <p class="description">Method by which a hash is derived</p>
                        <details open="open" class="remarks-group">
                           <summary>Remarks</summary>
                           <div class="remarks">
                              <p>Any other value used MUST be a value defined in the W3C <a>XML Security Algorithm Cross-Reference</a> Digest Methods (W3C, April 2013) or <a>RFC 6931 Section 2.1.5</a> New SHA Functions.</p>
                           </div>
                        </details>
                     </div>
                  </section>
                  <section class="json-obj">
                     <div class="header">
                        <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/rlink/hash/value"><button class="schema-link">Switch to XML</button></a></div>
                        <h6 id="/catalog/back-matter/resources/rlinks/hashes/value" class="toc6 head">value</h6>
                     </div>
                     <p>See <a href="../json-outline/#/catalog/back-matter/resources/rlinks/hashes/value">/catalog/back-matter/resources/rlinks/hashes/value</a> in the object map.</p>
                     <div class="obj-desc">
                        <div class="obj-matrix">
                           <p class="obj-name">string </p>
                           <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                           <p>A string of type <a href="link.to.string">string</a> with key <code>value</code>.</p>
                           <p class="path">/catalog/back-matter/resources/rlinks/hashes/value</p>
                        </div>
                     </div>
                  </section>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/base64"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/base64" class="toc4 head">base64</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/base64">/catalog/back-matter/resources/base64</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">object Base64</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>An object of type <a href="link.to.base64Binary">base64Binary</a> with key <code>base64</code>.</p>
                     <p class="path">/catalog/back-matter/resources/base64</p>
                  </div>
                  <p class="description">The Base64 alphabet in RFC 2045 - aligned with XSD.</p>
               </div>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/base64/@filename"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/base64/filename" class="toc5 head">filename</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/base64/filename">/catalog/back-matter/resources/base64/filename</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string File Name</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.uri-reference">uri-reference</a> with key <code>filename</code>.</p>
                        <p class="path">/catalog/back-matter/resources/base64/filename</p>
                     </div>
                     <p class="description">Name of the file before it was encoded as Base64 to be embedded in a <code>resource</code>. This is the name that will be assigned to the file when the file is decoded.</p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/base64/@media-type"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/base64/media-type" class="toc5 head">media-type</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/base64/media-type">/catalog/back-matter/resources/base64/media-type</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string Media Type</p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.string">string</a> with key <code>media-type</code>.</p>
                        <p class="path">/catalog/back-matter/resources/base64/media-type</p>
                     </div>
                     <p class="description">Specifies a media type as defined by the Internet Assigned Numbers Authority (IANA)
                        <a>Media Types Registry</a>. </p>
                  </div>
               </section>
               <section class="json-obj">
                  <div class="header">
                     <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/base64/value"><button class="schema-link">Switch to XML</button></a></div>
                     <h5 id="/catalog/back-matter/resources/base64/value" class="toc5 head">value</h5>
                  </div>
                  <p>See <a href="../json-outline/#/catalog/back-matter/resources/base64/value">/catalog/back-matter/resources/base64/value</a> in the object map.</p>
                  <div class="obj-desc">
                     <div class="obj-matrix">
                        <p class="obj-name">string </p>
                        <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                        <p>A string of type <a href="link.to.base64Binary">base64Binary</a> with key <code>value</code>.</p>
                        <p class="path">/catalog/back-matter/resources/base64/value</p>
                     </div>
                  </div>
               </section>
            </section>
            <section class="json-obj">
               <div class="header">
                  <div class="crosslink"><a href="../xml-reference/#/catalog/back-matter/resource/remarks"><button class="schema-link">Switch to XML</button></a></div>
                  <h4 id="/catalog/back-matter/resources/remarks" class="toc4 head">remarks</h4>
               </div>
               <p>See <a href="../json-outline/#/catalog/back-matter/resources/remarks">/catalog/back-matter/resources/remarks</a> in the object map.</p>
               <div class="obj-desc">
                  <div class="obj-matrix">
                     <p class="obj-name">string Remarks</p>
                     <p class="occurrence"><span class="cardinality">[0 or 1]</span></p>
                     <p>A string of type <a href="link.to.markup-multiline">markup-multiline</a> with key <code>remarks</code>.</p>
                     <p class="path">/catalog/back-matter/resources/remarks</p>
                  </div>
                  <p class="description">Additional commentary on the containing object.</p>
               </div>
            </section>
         </section>
      </section>
   </section>
</div>