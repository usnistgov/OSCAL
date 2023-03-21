---
title: "OSCAL Catalog Model Development Snapshot XML Format Outline"
heading: "Catalog Model Development Snapshot XML Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 50
generateanchors: false
sidenav:
  title: XML Outline

---

The following outline is a representation of the [XML format](https://github.com/usnistgov/OSCAL/blob/feature-ci-diagrams-issue-1678/xml/schema/oscal_catalog_schema.xsd) for this [model](/concepts/layer/control/catalog/). For each element or attribute, the name links to the corresponding entry in the [XML Format Reference](../xml-reference/). The cardinality and data type are also provided for each element or attribute where appropriate.

<!-- DO NOT REMOVE. Generated text below -->{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog">catalog</a></span> <span class="nobr" id="/catalog/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/catalog&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
         <div class="model-container">
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata">metadata</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/metadata&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/published&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions">revisions</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/revisions&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision">revision</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">revision</span>) </span><span class="nobr">&lt;/revision&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/published&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/prop">prop</a></span> <span class="nobr" id="/catalog/metadata/revisions/revision/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/revisions/revision/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/metadata/revisions/revision/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/metadata/revisions/revision/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/metadata/revisions/revision/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/prop&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/link">link</a></span> <span class="nobr" id="/catalog/metadata/revisions/revision/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/metadata/revisions/revision/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/revisions/revision/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/text&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/link&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/revisions/revision/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/revision&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/revisions&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/document-id">document-id</a></span> <span class="nobr" id="/catalog/metadata/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/catalog/metadata/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/document-id&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/prop">prop</a></span> <span class="nobr" id="/catalog/metadata/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/metadata/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/metadata/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/metadata/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/metadata/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/metadata/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/metadata/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/metadata/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/prop&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/link">link</a></span> <span class="nobr" id="/catalog/metadata/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/metadata/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/metadata/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/metadata/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/text&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/link&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role">role</a></span> <span class="nobr" id="/catalog/metadata/role/@id"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/prop">prop</a></span> <span class="nobr" id="/catalog/metadata/role/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/metadata/role/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/metadata/role/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/metadata/role/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/link">link</a></span> <span class="nobr" id="/catalog/metadata/role/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/metadata/role/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/role/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/role&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location">location</a></span> <span class="nobr" id="/catalog/metadata/location/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/location&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/address">address</a></span> <span class="nobr" id="/catalog/metadata/location/address/@type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/city&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/state&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 
                                 
                                 <p class="close-tag nobr">&lt;/country&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/telephone-number">telephone-number</a></span> <span class="nobr" id="/catalog/metadata/location/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/url">url</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="nobr">&lt;/url&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span> value</p>
                           <p class="close-tag nobr">&lt;/url&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/prop">prop</a></span> <span class="nobr" id="/catalog/metadata/location/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/location/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/metadata/location/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/metadata/location/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/metadata/location/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/link">link</a></span> <span class="nobr" id="/catalog/metadata/location/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/metadata/location/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/location/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/location/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/location/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/location&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party">party</a></span> <span class="nobr" id="/catalog/metadata/party/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/metadata/party/@type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/name">name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/external-id">external-id</a></span> <span class="nobr" id="/catalog/metadata/party/external-id/@scheme"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/external-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/external-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/external-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/prop">prop</a></span> <span class="nobr" id="/catalog/metadata/party/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/metadata/party/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/metadata/party/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/metadata/party/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/link">link</a></span> <span class="nobr" id="/catalog/metadata/party/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/metadata/party/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/party/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/telephone-number">telephone-number</a></span> <span class="nobr" id="/catalog/metadata/party/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/address">address</a></span> <span class="nobr" id="/catalog/metadata/party/address/@type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/party/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/city&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/state&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       
                                       
                                       <p class="close-tag nobr">&lt;/country&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/address&gt;</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/location-uuid">location-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/location-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/location-uuid&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/member-of-organization">member-of-organization</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/member-of-organization&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/member-of-organization&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/party&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party">responsible-party</a></span> <span class="nobr" id="/catalog/metadata/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/prop">prop</a></span> <span class="nobr" id="/catalog/metadata/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/metadata/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/metadata/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/metadata/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/link">link</a></span> <span class="nobr" id="/catalog/metadata/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/metadata/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/metadata/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/responsible-party&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/metadata/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/metadata&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param">param</a></span> <span class="nobr" id="/catalog/param/@id"><a class="OM-name" href="../xml-reference/#/catalog/param/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/param/@class"><a class="OM-name" href="../xml-reference/#/catalog/param/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/param/@depends-on"><a class="OM-name" href="../xml-reference/#/catalog/param/@depends-on">depends-on</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/param&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/prop">prop</a></span> <span class="nobr" id="/catalog/param/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/param/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/param/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/param/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/param/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/param/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/param/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/param/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/param/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/param/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/prop&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/link">link</a></span> <span class="nobr" id="/catalog/param/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/param/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/param/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/param/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/param/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/param/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/text&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/link&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/label">label</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/label&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/label&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/usage">usage</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/usage&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/usage&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/constraint">constraint</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/constraint&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/constraint/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/constraint/test">test</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/test&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/constraint/test/expression">expression</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/expression&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/expression&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/constraint/test/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/test&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/constraint&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/guideline">guideline</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/guideline&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/guideline&gt;</p>
                  </details>
                  <div class="OM-choices">
                     <p class="OM-lit">A choice of:</p>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/value&gt;</p>
                        </details>
                     </div>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/select">select</a></span> <span class="nobr" id="/catalog/param/select/@how-many"><a class="OM-name" href="../xml-reference/#/catalog/param/select/@how-many">how-many</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/select&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/select/choice">choice</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/choice&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/choice&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/select&gt;</p>
                        </details>
                     </div>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/param/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/param&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control">control</a></span> <span class="nobr" id="/catalog/control/@id"><a class="OM-name" href="../xml-reference/#/catalog/control/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/@class"><a class="OM-name" href="../xml-reference/#/catalog/control/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param">param</a></span> <span class="nobr" id="/catalog/control/param/@id"><a class="OM-name" href="../xml-reference/#/catalog/control/param/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/param/@class"><a class="OM-name" href="../xml-reference/#/catalog/control/param/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/param/@depends-on"><a class="OM-name" href="../xml-reference/#/catalog/control/param/@depends-on">depends-on</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/param&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/prop">prop</a></span> <span class="nobr" id="/catalog/control/param/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/control/param/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/param/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/control/param/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/control/param/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/control/param/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/control/param/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/control/param/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/control/param/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/control/param/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/link">link</a></span> <span class="nobr" id="/catalog/control/param/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/control/param/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/control/param/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/control/param/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/param/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/control/param/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/label">label</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/label&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/label&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/usage">usage</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/usage&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/usage&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/constraint">constraint</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/constraint&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/constraint/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/constraint/test">test</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/test&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/constraint/test/expression">expression</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/expression&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/expression&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/constraint/test/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/test&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/constraint&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/guideline">guideline</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/guideline&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/guideline&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/value&gt;</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/select">select</a></span> <span class="nobr" id="/catalog/control/param/select/@how-many"><a class="OM-name" href="../xml-reference/#/catalog/control/param/select/@how-many">how-many</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/select&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/select/choice">choice</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/choice&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/choice&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/select&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/param/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/param&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/prop">prop</a></span> <span class="nobr" id="/catalog/control/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/control/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/control/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/control/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/control/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/control/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/control/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/control/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/control/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/prop&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/link">link</a></span> <span class="nobr" id="/catalog/control/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/control/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/control/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/control/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/control/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/text&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/link&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/part">part</a></span> <span class="nobr" id="/catalog/control/part/@id"><a class="OM-name" href="../xml-reference/#/catalog/control/part/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/part/@name"><a class="OM-name" href="../xml-reference/#/catalog/control/part/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/part/@ns"><a class="OM-name" href="../xml-reference/#/catalog/control/part/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/control/part/@class"><a class="OM-name" href="../xml-reference/#/catalog/control/part/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/part/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/part/prop">prop</a></span> <span class="nobr" id="/catalog/control/part/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/control/part/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/part/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/control/part/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/control/part/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/control/part/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/control/part/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/control/part/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/control/part/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/control/part/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/part/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <div class="OM-entry">
                           <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/part/part">part</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">part</span>) </span><span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">[Empty]</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/part/link">link</a></span> <span class="nobr" id="/catalog/control/part/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/control/part/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/control/part/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/control/part/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/control/part/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/control/part/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/part/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/part&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/control/control">control</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">control</span>) </span><span class="nobr">&lt;/control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <p class="OM-map-name">[Empty]</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/control&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group">group</a></span> <span class="nobr" id="/catalog/group/@id"><a class="OM-name" href="../xml-reference/#/catalog/group/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/group&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param">param</a></span> <span class="nobr" id="/catalog/group/param/@id"><a class="OM-name" href="../xml-reference/#/catalog/group/param/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/param/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/param/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/param/@depends-on"><a class="OM-name" href="../xml-reference/#/catalog/group/param/@depends-on">depends-on</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/param&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/prop">prop</a></span> <span class="nobr" id="/catalog/group/param/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/param/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/param/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/group/param/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/group/param/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/param/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/param/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/group/param/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/group/param/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/param/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/link">link</a></span> <span class="nobr" id="/catalog/group/param/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/group/param/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/group/param/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/group/param/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/param/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/group/param/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/label">label</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/label&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/label&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/usage">usage</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/usage&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/usage&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/constraint">constraint</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/constraint&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/constraint/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/constraint/test">test</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/test&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/constraint/test/expression">expression</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/expression&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/expression&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/constraint/test/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/test&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/constraint&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/guideline">guideline</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/guideline&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/guideline&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/value&gt;</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/select">select</a></span> <span class="nobr" id="/catalog/group/param/select/@how-many"><a class="OM-name" href="../xml-reference/#/catalog/group/param/select/@how-many">how-many</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/select&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/select/choice">choice</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/choice&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/choice&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/select&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/param/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/param&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/prop">prop</a></span> <span class="nobr" id="/catalog/group/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/group/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/group/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/group/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/group/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/prop&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/link">link</a></span> <span class="nobr" id="/catalog/group/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/group/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/group/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/group/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/group/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/text&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/link&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/part">part</a></span> <span class="nobr" id="/catalog/group/part/@id"><a class="OM-name" href="../xml-reference/#/catalog/group/part/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/part/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/part/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/part/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/part/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/part/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/part/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/part/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/part/prop">prop</a></span> <span class="nobr" id="/catalog/group/part/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/part/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/part/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/group/part/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/group/part/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/part/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/part/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/group/part/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/group/part/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/part/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/part/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <div class="OM-entry">
                           <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/part/part">part</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">part</span>) </span><span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">[Empty]</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/part/link">link</a></span> <span class="nobr" id="/catalog/group/part/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/group/part/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/group/part/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/group/part/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/part/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/group/part/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/part/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/part&gt;</p>
                  </details>
                  <div class="OM-choices">
                     <p class="OM-lit">A choice of:</p>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/group">group</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like ancestor <span class="OM-ref">group</span>) </span><span class="nobr">&lt;/group&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">[Empty]</p>
                        </details>
                     </div>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control">control</a></span> <span class="nobr" id="/catalog/group/control/@id"><a class="OM-name" href="../xml-reference/#/catalog/group/control/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/control/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param">param</a></span> <span class="nobr" id="/catalog/group/control/param/@id"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/@depends-on"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/@depends-on">depends-on</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/param&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/prop">prop</a></span> <span class="nobr" id="/catalog/group/control/param/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/prop&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/link">link</a></span> <span class="nobr" id="/catalog/group/control/param/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/param/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/text&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/link&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/label">label</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/label&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/label&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/usage">usage</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/usage&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/usage&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/constraint">constraint</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/constraint&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/constraint/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/description&gt;</p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/constraint/test">test</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/test&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/constraint/test/expression">expression</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/expression&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                                   <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                                   <p class="close-tag nobr">&lt;/expression&gt;</p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/constraint/test/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                                   <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                                   <div class="OM-entry">
                                                      <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                                   </div>
                                                   <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                                </details>
                                             </div>
                                             <p class="close-tag nobr">&lt;/test&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/constraint&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/guideline">guideline</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/guideline&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/guideline&gt;</p>
                                    </details>
                                    <div class="OM-choices">
                                       <p class="OM-lit">A choice of:</p>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                             <p class="close-tag nobr">&lt;/value&gt;</p>
                                          </details>
                                       </div>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/select">select</a></span> <span class="nobr" id="/catalog/group/control/param/select/@how-many"><a class="OM-name" href="../xml-reference/#/catalog/group/control/param/select/@how-many">how-many</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/select&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/select/choice">choice</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/choice&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                                   <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                                   <div class="OM-entry">
                                                      <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                                   </div>
                                                   <p class="close-tag nobr">&lt;/choice&gt;</p>
                                                </details>
                                             </div>
                                             <p class="close-tag nobr">&lt;/select&gt;</p>
                                          </details>
                                       </div>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/param/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/param&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/prop">prop</a></span> <span class="nobr" id="/catalog/group/control/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/control/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/group/control/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/group/control/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/control/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/control/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/group/control/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/group/control/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/control/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/prop&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/link">link</a></span> <span class="nobr" id="/catalog/group/control/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/group/control/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/group/control/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/group/control/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/group/control/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/text&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/link&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/part">part</a></span> <span class="nobr" id="/catalog/group/control/part/@id"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/part/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/title&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/part/prop">prop</a></span> <span class="nobr" id="/catalog/group/control/part/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/part/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/prop&gt;</p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/part/part">part</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">part</span>) </span><span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">[Empty]</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/part/link">link</a></span> <span class="nobr" id="/catalog/group/control/part/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/group/control/part/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/group/control/part/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/part/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/text&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/link&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/part&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/group/control/control">control</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">control</span>) </span><span class="nobr">&lt;/control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/control&gt;</p>
                        </details>
                     </div>
                  </div>
               </div>
               <p class="close-tag nobr">&lt;/group&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter">back-matter</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/back-matter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource">resource</a></span> <span class="nobr" id="/catalog/back-matter/resource/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/resource&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/prop">prop</a></span> <span class="nobr" id="/catalog/back-matter/resource/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/prop&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/document-id">document-id</a></span> <span class="nobr" id="/catalog/back-matter/resource/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/document-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation">citation</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/citation&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/prop">prop</a></span> <span class="nobr" id="/catalog/back-matter/resource/citation/prop/@name"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/citation/prop/@uuid"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/citation/prop/@ns"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/citation/prop/@value"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/citation/prop/@class"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/prop&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/link">link</a></span> <span class="nobr" id="/catalog/back-matter/resource/citation/link/@href"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/citation/link/@rel"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/citation/link/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/citation/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/text&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/link&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/citation&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/rlink">rlink</a></span> <span class="nobr" id="/catalog/back-matter/resource/rlink/@href"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/rlink/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/rlink/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/rlink/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/rlink&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/rlink/hash">hash</a></span> <span class="nobr" id="/catalog/back-matter/resource/rlink/hash/@algorithm"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/rlink/hash/@algorithm">algorithm</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/hash&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/hash&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/rlink&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/base64">base64</a></span> <span class="nobr" id="/catalog/back-matter/resource/base64/@filename"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/base64/@filename">filename</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/catalog/back-matter/resource/base64/@media-type"><a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/base64/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span><span class="nobr">&lt;/base64&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span> value</p>
                           <p class="close-tag nobr">&lt;/base64&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/catalog/back-matter/resource/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/resource&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/back-matter&gt;</p>
            </details>
         </div>
         <p class="close-tag nobr">&lt;/catalog&gt;</p>
      </details>
   </div>
</div>{{< /rawhtml >}}
