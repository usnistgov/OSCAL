---
title: "OSCAL Component Definition Model v1.0.1 XML Format Outline"
heading: "Component Definition Model v1.0.1 XML Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 50
generateanchors: false
sidenav:
  title: XML Outline
aliases:
  - /docs/maps/oscal-component-xml/
  - /documentation/schema/component/xml-model-map/
  - /documentation/schema/implementation-layer/component/xml-model-map/
---

The following outline is a representation of the [XML format](https://github.com/usnistgov/OSCAL/blob/main/xml/schema/oscal_component-definition_schema.xsd) for this [model](/concepts/layer/implementation/component-definition/). For each element or attribute, the name links to the corresponding entry in the [XML Format Reference](../xml-reference/). The cardinality and data type are also provided for each element or attribute where appropriate.

<!-- DO NOT REMOVE. Generated text below -->{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition">component-definition</a></span> <span class="nobr" id="/component-definition/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/component-definition&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
         <div class="model-container">
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata">metadata</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/metadata&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/published&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions">revisions</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/revisions&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision">revision</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">revision</span>) </span><span class="nobr">&lt;/revision&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/published&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/prop">prop</a></span> <span class="nobr" id="/component-definition/metadata/revisions/revision/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/revisions/revision/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/metadata/revisions/revision/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/metadata/revisions/revision/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/metadata/revisions/revision/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/link">link</a></span> <span class="nobr" id="/component-definition/metadata/revisions/revision/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/metadata/revisions/revision/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/revisions/revision/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/revisions/revision/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/document-id">document-id</a></span> <span class="nobr" id="/component-definition/metadata/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/document-id&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/prop">prop</a></span> <span class="nobr" id="/component-definition/metadata/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/metadata/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/metadata/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/metadata/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/link">link</a></span> <span class="nobr" id="/component-definition/metadata/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/metadata/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role">role</a></span> <span class="nobr" id="/component-definition/metadata/role/@id"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/prop">prop</a></span> <span class="nobr" id="/component-definition/metadata/role/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/metadata/role/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/metadata/role/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/metadata/role/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/link">link</a></span> <span class="nobr" id="/component-definition/metadata/role/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/metadata/role/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/role/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location">location</a></span> <span class="nobr" id="/component-definition/metadata/location/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/location&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/address">address</a></span> <span class="nobr" id="/component-definition/metadata/location/address/@type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/city&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/state&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 
                                 
                                 <p class="close-tag nobr">&lt;/country&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/telephone-number">telephone-number</a></span> <span class="nobr" id="/component-definition/metadata/location/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/url">url</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="nobr">&lt;/url&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span> value</p>
                           <p class="close-tag nobr">&lt;/url&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/prop">prop</a></span> <span class="nobr" id="/component-definition/metadata/location/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/location/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/metadata/location/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/metadata/location/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/metadata/location/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/link">link</a></span> <span class="nobr" id="/component-definition/metadata/location/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/metadata/location/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/location/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/location/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party">party</a></span> <span class="nobr" id="/component-definition/metadata/party/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/metadata/party/@type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/name">name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/external-id">external-id</a></span> <span class="nobr" id="/component-definition/metadata/party/external-id/@scheme"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/external-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/external-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/external-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/prop">prop</a></span> <span class="nobr" id="/component-definition/metadata/party/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/metadata/party/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/metadata/party/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/metadata/party/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/link">link</a></span> <span class="nobr" id="/component-definition/metadata/party/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/metadata/party/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/party/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/telephone-number">telephone-number</a></span> <span class="nobr" id="/component-definition/metadata/party/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/address">address</a></span> <span class="nobr" id="/component-definition/metadata/party/address/@type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/city&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/state&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       
                                       
                                       <p class="close-tag nobr">&lt;/country&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/address&gt;</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/location-uuid">location-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/location-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/location-uuid&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/member-of-organization">member-of-organization</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/member-of-organization&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/member-of-organization&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party">responsible-party</a></span> <span class="nobr" id="/component-definition/metadata/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/prop">prop</a></span> <span class="nobr" id="/component-definition/metadata/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/metadata/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/metadata/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/metadata/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/link">link</a></span> <span class="nobr" id="/component-definition/metadata/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/metadata/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/metadata/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/metadata/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/import-component-definition">import-component-definition</a></span> <span class="nobr" id="/component-definition/import-component-definition/@href"><a class="OM-name" href="../xml-reference/#/component-definition/import-component-definition/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <p class="OM-map-name">[Empty]</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component">component</a></span> <span class="nobr" id="/component-definition/component/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/@type"><a class="OM-name" href="../xml-reference/#/component-definition/component/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/component&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/description&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/purpose">purpose</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/purpose&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/purpose&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/prop">prop</a></span> <span class="nobr" id="/component-definition/component/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/component/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/component/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/component/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/component/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/component/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/link">link</a></span> <span class="nobr" id="/component-definition/component/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/component/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/component/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/component/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/component/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role">responsible-role</a></span> <span class="nobr" id="/component-definition/component/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/prop">prop</a></span> <span class="nobr" id="/component-definition/component/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/component/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/component/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/link">link</a></span> <span class="nobr" id="/component-definition/component/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/component/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/responsible-role&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/protocol">protocol</a></span> <span class="nobr" id="/component-definition/component/protocol/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/protocol/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/protocol/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/protocol/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/protocol&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/protocol/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/protocol/port-range">port-range</a></span> <span class="nobr" id="/component-definition/component/protocol/port-range/@start"><a class="OM-name" href="../xml-reference/#/component-definition/component/protocol/port-range/@start">start</a>="<span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonnegativeinteger</a></span>"</span> <span class="nobr" id="/component-definition/component/protocol/port-range/@end"><a class="OM-name" href="../xml-reference/#/component-definition/component/protocol/port-range/@end">end</a>="<span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonnegativeinteger</a></span>"</span> <span class="nobr" id="/component-definition/component/protocol/port-range/@transport"><a class="OM-name" href="../xml-reference/#/component-definition/component/protocol/port-range/@transport">transport</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">[Empty]</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/protocol&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation">control-implementation</a></span> <span class="nobr" id="/component-definition/component/control-implementation/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/@source"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/@source">source</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-implementation&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/prop">prop</a></span> <span class="nobr" id="/component-definition/component/control-implementation/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/link">link</a></span> <span class="nobr" id="/component-definition/component/control-implementation/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/set-parameter">set-parameter</a></span> <span class="nobr" id="/component-definition/component/control-implementation/set-parameter/@param-id"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/set-parameter/@param-id">param-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/set-parameter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/set-parameter/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/value&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/set-parameter/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/set-parameter&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement">implemented-requirement</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/@control-id"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/implemented-requirement&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop">prop</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link">link</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter">set-parameter</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/set-parameter/@param-id"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/@param-id">param-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/set-parameter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/value&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/set-parameter/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/set-parameter&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role">responsible-role</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop">prop</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link">link</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                       
                                       
                                       
                                       
                                       
                                       <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/responsible-role&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement">statement</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/@statement-id"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/@statement-id">statement-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/statement&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/description&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop">prop</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link">link</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role">responsible-role</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop">prop</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link">link</a></span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                             
                                             
                                             
                                             
                                             
                                             <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/responsible-role&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/statement/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/statement&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/control-implementation/implemented-requirement/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/implemented-requirement&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/control-implementation&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/component/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/component&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability">capability</a></span> <span class="nobr" id="/component-definition/capability/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/@name"><a class="OM-name" href="../xml-reference/#/component-definition/capability/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/capability&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/description&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/prop">prop</a></span> <span class="nobr" id="/component-definition/capability/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/capability/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/capability/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/capability/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/capability/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/capability/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/capability/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/link">link</a></span> <span class="nobr" id="/component-definition/capability/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/capability/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/capability/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/capability/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/capability/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/incorporates-component">incorporates-component</a></span> <span class="nobr" id="/component-definition/capability/incorporates-component/@component-uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/incorporates-component/@component-uuid">component-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/incorporates-component&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/incorporates-component/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/incorporates-component&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation">control-implementation</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/@source"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/@source">source</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-implementation&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/prop">prop</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/link">link</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter">set-parameter</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/set-parameter/@param-id"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter/@param-id">param-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/set-parameter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/value&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/set-parameter/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/set-parameter&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement">implemented-requirement</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/@control-id"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/implemented-requirement&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop">prop</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link">link</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter">set-parameter</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/set-parameter/@param-id"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/@param-id">param-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/set-parameter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/value">value</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/value&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/value&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/set-parameter/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/set-parameter&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role">responsible-role</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop">prop</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link">link</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                       
                                       
                                       
                                       
                                       
                                       <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/responsible-role&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement">statement</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/@statement-id"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/@statement-id">statement-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/statement&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/description&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop">prop</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link">link</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role">responsible-role</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop">prop</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link">link</a></span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                             
                                             
                                             
                                             
                                             
                                             <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/responsible-role&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/statement/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/statement&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/control-implementation/implemented-requirement/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/implemented-requirement&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/control-implementation&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/capability/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/capability&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter">back-matter</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/back-matter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource">resource</a></span> <span class="nobr" id="/component-definition/back-matter/resource/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/resource&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/prop">prop</a></span> <span class="nobr" id="/component-definition/back-matter/resource/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/document-id">document-id</a></span> <span class="nobr" id="/component-definition/back-matter/resource/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/document-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation">citation</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/citation&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/prop">prop</a></span> <span class="nobr" id="/component-definition/back-matter/resource/citation/prop/@name"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/citation/prop/@uuid"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/citation/prop/@ns"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/citation/prop/@value"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/citation/prop/@class"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/link">link</a></span> <span class="nobr" id="/component-definition/back-matter/resource/citation/link/@href"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/citation/link/@rel"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/citation/link/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/citation/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/rlink">rlink</a></span> <span class="nobr" id="/component-definition/back-matter/resource/rlink/@href"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/rlink/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/rlink/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/rlink/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/rlink&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/rlink/hash">hash</a></span> <span class="nobr" id="/component-definition/back-matter/resource/rlink/hash/@algorithm"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/rlink/hash/@algorithm">algorithm</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/hash&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/hash&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/rlink&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/base64">base64</a></span> <span class="nobr" id="/component-definition/back-matter/resource/base64/@filename"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/base64/@filename">filename</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/component-definition/back-matter/resource/base64/@media-type"><a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/base64/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span><span class="nobr">&lt;/base64&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span> value</p>
                           <p class="close-tag nobr">&lt;/base64&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/component-definition/back-matter/resource/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
         <p class="close-tag nobr">&lt;/component-definition&gt;</p>
      </details>
   </div>
</div>{{< /rawhtml >}}
