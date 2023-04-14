---
title: "OSCAL Control Mapping Model Development Snapshot XML Format Outline"
heading: "Control Mapping Model Development Snapshot XML Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 50
generateanchors: false
sidenav:
  title: XML Outline

---

The following outline is a representation of the [XML format](https://github.com/usnistgov/OSCAL/blob/feature-profile-resolution-unittestingA/xml/schema/oscal_mapping_schema.xsd) for this [model](/concepts/layer/control/mapping/). For each element or attribute, the name links to the corresponding entry in the [XML Format Reference](../xml-reference/). The cardinality and data type are also provided for each element or attribute where appropriate.

<!-- DO NOT REMOVE. Generated text below -->{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection">mapping-collection</a></span> <span class="nobr" id="/mapping-collection/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/mapping-collection&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
         <div class="model-container">
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata">metadata</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/metadata&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/published&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions">revisions</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/revisions&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision">revision</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/revision&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/published&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/revisions/revision/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/revisions/revision/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/document-id">document-id</a></span> <span class="nobr" id="/mapping-collection/metadata/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/document-id&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role">role</a></span> <span class="nobr" id="/mapping-collection/metadata/role/@id"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/role/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/role/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/role/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location">location</a></span> <span class="nobr" id="/mapping-collection/metadata/location/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/location&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/address">address</a></span> <span class="nobr" id="/mapping-collection/metadata/location/address/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/city&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/state&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 
                                 
                                 <p class="close-tag nobr">&lt;/country&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/telephone-number">telephone-number</a></span> <span class="nobr" id="/mapping-collection/metadata/location/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/url">url</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="nobr">&lt;/url&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span> value</p>
                           <p class="close-tag nobr">&lt;/url&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/location/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/location/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/location/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/location/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party">party</a></span> <span class="nobr" id="/mapping-collection/metadata/party/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/name">name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/external-id">external-id</a></span> <span class="nobr" id="/mapping-collection/metadata/party/external-id/@scheme"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/external-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/external-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/external-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/party/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/party/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/party/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/telephone-number">telephone-number</a></span> <span class="nobr" id="/mapping-collection/metadata/party/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/address">address</a></span> <span class="nobr" id="/mapping-collection/metadata/party/address/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/city&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/state&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       
                                       
                                       <p class="close-tag nobr">&lt;/country&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/address&gt;</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/location-uuid">location-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/location-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/location-uuid&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/member-of-organization">member-of-organization</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/member-of-organization&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/member-of-organization&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party">responsible-party</a></span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/responsible-party/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action">action</a></span> <span class="nobr" id="/mapping-collection/metadata/action/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/@date"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/@date">date</a>="<span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/@system"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/@system">system</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/action&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/action/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/action/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party">responsible-party</a></span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop">prop</a></span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/link">link</a></span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/metadata/action/responsible-party/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/action/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/action&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/metadata/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping">mapping</a></span> <span class="nobr" id="/mapping-collection/mapping/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/mapping&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource">source-resource</a></span> <span class="nobr" id="/mapping-collection/mapping/source-resource/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/source-resource&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop">prop</a></span> <span class="nobr" id="/mapping-collection/mapping/source-resource/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/link">link</a></span> <span class="nobr" id="/mapping-collection/mapping/source-resource/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/source-resource/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/source-resource/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/source-resource&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource">target-resource</a></span> <span class="nobr" id="/mapping-collection/mapping/target-resource/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/target-resource&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop">prop</a></span> <span class="nobr" id="/mapping-collection/mapping/target-resource/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/link">link</a></span> <span class="nobr" id="/mapping-collection/mapping/target-resource/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/target-resource/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/target-resource/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/target-resource&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map">map</a></span> <span class="nobr" id="/mapping-collection/mapping/map/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/map&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop">prop</a></span> <span class="nobr" id="/mapping-collection/mapping/map/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/link">link</a></span> <span class="nobr" id="/mapping-collection/mapping/map/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/relationship">relationship</a></span> <span class="nobr" id="/mapping-collection/mapping/map/relationship/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/relationship/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/relationship&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                           
                           The effective requirements of the source is equivalent in semantic meaning to the
                           effective requirements of the target. The words may differ, but both mapped sets convey
                           similar information with the same effective meaning. This relationship may be reversed,
                           since `A equivalent-to B` also means that `B equivalent-to A`.
                           The actual requirements of the source are the same as the actual requirements target.
                           Differences in capitalization, spelling, and grammar can be ignored, if these differences
                           do not change the meaning. This relationship may be reversed, since `A equal-to B`
                           also means that `B equal-to A`.
                           The effective requirements of the source is a semantic subset of the effective requirements
                           of the target. This relationship may be reversed as a `superset-of`, since `A subset-of
                           B` also means that `B superset-of A`.
                           The effective requirements of the source is a semantic superset of the effective requirements
                           of the target. This relationship may be reversed as a `subset-of`, since `A superset-of
                           B` also means that `B subset-of A`.
                           The effective requirements of the source and target have some semantic equivalence,
                           but not all effective requirements from each are contained within the other. This
                           relationship may be reversed, since `A intersects-with B` also means that `B intersects-with
                           A`. A lower granularity mapping, such as a statement level mapping using 'equivalent-to',
                           'subset-of', and/or 'superset-of', may provide a more functional mapping that allows
                           for more inference than using this relationship type.
                           
                           
                           <p class="close-tag nobr">&lt;/relationship&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source">source</a></span> <span class="nobr" id="/mapping-collection/mapping/map/source/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/@id-ref"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/@id-ref">id-ref</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/source&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop">prop</a></span> <span class="nobr" id="/mapping-collection/mapping/map/source/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/link">link</a></span> <span class="nobr" id="/mapping-collection/mapping/map/source/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/source/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/source/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/source&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target">target</a></span> <span class="nobr" id="/mapping-collection/mapping/map/target/@type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/@id-ref"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/@id-ref">id-ref</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/target&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop">prop</a></span> <span class="nobr" id="/mapping-collection/mapping/map/target/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/link">link</a></span> <span class="nobr" id="/mapping-collection/mapping/map/target/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/mapping/map/target/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/target/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/target&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/mapping/map/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/map&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/mapping&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter">back-matter</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/back-matter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource">resource</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/resource&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop">prop</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/document-id">document-id</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/document-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation">citation</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/citation&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop">prop</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/prop/@name"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/prop/@uuid"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/prop/@ns"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/prop/@value"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/prop/@class"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/prop/@group"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/link">link</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/link/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/link/@rel"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/link/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/citation/link/@resource-fragment"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/link/@resource-fragment">resource-fragment</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/citation/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/rlink">rlink</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/rlink/@href"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/rlink/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/rlink/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/rlink/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/rlink&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/rlink/hash">hash</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/rlink/hash/@algorithm"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/rlink/hash/@algorithm">algorithm</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/hash&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/hash&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/rlink&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/base64">base64</a></span> <span class="nobr" id="/mapping-collection/back-matter/resource/base64/@filename"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/base64/@filename">filename</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/mapping-collection/back-matter/resource/base64/@media-type"><a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/base64/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span><span class="nobr">&lt;/base64&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span> value</p>
                           <p class="close-tag nobr">&lt;/base64&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/mapping-collection/back-matter/resource/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
         <p class="close-tag nobr">&lt;/mapping-collection&gt;</p>
      </details>
   </div>
</div>{{< /rawhtml >}}
