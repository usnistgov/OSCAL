---
title: "OSCAL Assessment Plan Model Development Snapshot XML Format Outline"
heading: "Assessment Plan Model Development Snapshot XML Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 50
generateanchors: false
sidenav:
  title: XML Outline

---

The following outline is a representation of the [XML format](https://github.com/usnistgov/OSCAL/blob/feature-metadata-actions-assembly/xml/schema/oscal_assessment-plan_schema.xsd) for this [model](/concepts/layer/assessment/assessment-plan/). For each element or attribute, the name links to the corresponding entry in the [XML Format Reference](../xml-reference/). The cardinality and data type are also provided for each element or attribute where appropriate.

<!-- DO NOT REMOVE. Generated text below -->{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="xml-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan">assessment-plan</a></span> <span class="nobr" id="/assessment-plan/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/assessment-plan&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
         <div class="model-container">
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata">metadata</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/metadata&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/published&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                     <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions">revisions</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/revisions&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision">revision</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/revision&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/published">published</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/published&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/published&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/last-modified">last-modified</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span><span class="nobr">&lt;/last-modified&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/last-modified&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/version">version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/oscal-version">oscal-version</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/oscal-version&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/oscal-version&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/revisions/revision/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/revisions/revision/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/document-id">document-id</a></span> <span class="nobr" id="/assessment-plan/metadata/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                     <p class="close-tag nobr">&lt;/document-id&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role">role</a></span> <span class="nobr" id="/assessment-plan/metadata/role/@id"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/role/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/role/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/role/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/role/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/role/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/role/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/role/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/role/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location">location</a></span> <span class="nobr" id="/assessment-plan/metadata/location/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/location&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/address">address</a></span> <span class="nobr" id="/assessment-plan/metadata/location/address/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/city&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/state&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 
                                 
                                 <p class="close-tag nobr">&lt;/country&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/telephone-number">telephone-number</a></span> <span class="nobr" id="/assessment-plan/metadata/location/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/url">url</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="nobr">&lt;/url&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span> value</p>
                           <p class="close-tag nobr">&lt;/url&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/location/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/location/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/location/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/location/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/location/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/location/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/location/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/location/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/location/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/location/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party">party</a></span> <span class="nobr" id="/assessment-plan/metadata/party/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/name">name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/external-id">external-id</a></span> <span class="nobr" id="/assessment-plan/metadata/party/external-id/@scheme"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/external-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/external-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/external-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/party/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/party/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/party/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/email-address">email-address</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span><span class="nobr">&lt;/email-address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">an <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span> value</p>
                           <p class="close-tag nobr">&lt;/email-address&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/telephone-number">telephone-number</a></span> <span class="nobr" id="/assessment-plan/metadata/party/telephone-number/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/telephone-number/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/telephone-number&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/telephone-number&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/address">address</a></span> <span class="nobr" id="/assessment-plan/metadata/party/address/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/address/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/address&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/address/addr-line">addr-line</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/addr-line&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/addr-line&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/address/city">city</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/city&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/city&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/address/state">state</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/state&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/state&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/address/postal-code">postal-code</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/postal-code&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/postal-code&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/address/country">country</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/country&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                       
                                       
                                       <p class="close-tag nobr">&lt;/country&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/address&gt;</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/location-uuid">location-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/location-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/location-uuid&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/member-of-organization">member-of-organization</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/member-of-organization&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/member-of-organization&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party">responsible-party</a></span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action">action</a></span> <span class="nobr" id="/assessment-plan/metadata/action/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/@date"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/@date">date</a>="<span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/@system"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/@system">system</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/action&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/action/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/action/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party">responsible-party</a></span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop">prop</a></span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/link">link</a></span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/metadata/action/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/action/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/metadata/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/import-ssp">import-ssp</a></span> <span class="nobr" id="/assessment-plan/import-ssp/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/import-ssp/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/import-ssp&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/import-ssp/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/import-ssp&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions">local-definitions</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/local-definitions&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component">component</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/component&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/purpose">purpose</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/purpose&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/purpose&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/status">status</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/status/@state"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/status/@state">state</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/status&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/status/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/status&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role">responsible-role</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol">protocol</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/protocol/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/protocol/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/protocol&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol/port-range">port-range</a></span> <span class="nobr" id="/assessment-plan/local-definitions/component/protocol/port-range/@start"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol/port-range/@start">start</a>="<span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonnegativeinteger</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/protocol/port-range/@end"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol/port-range/@end">end</a>="<span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonnegativeinteger</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/component/protocol/port-range/@transport"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/protocol/port-range/@transport">transport</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/protocol&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/component/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item">inventory-item</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/inventory-item&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party">responsible-party</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component">implemented-component</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/@component-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/@component-uuid">component-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/implemented-component&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party">responsible-party</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                       
                                       
                                       
                                       
                                       
                                       <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/implemented-component/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/implemented-component&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/inventory-item/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/inventory-item&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user">user</a></span> <span class="nobr" id="/assessment-plan/local-definitions/user/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/user&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/short-name">short-name</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/short-name&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/short-name&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/user/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/user/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/user/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/user/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/user/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/user/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/user/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/user/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/user/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/role-id">role-id</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/role-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/role-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/authorized-privilege">authorized-privilege</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/authorized-privilege&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/authorized-privilege/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/authorized-privilege/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/authorized-privilege/function-performed">function-performed</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/function-performed&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/function-performed&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/authorized-privilege&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/user/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/user&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods">objectives-and-methods</a></span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/@control-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/objectives-and-methods&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part">part</a></span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/@id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/@id">id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/part">part</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">part</span>) </span><span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/objectives-and-methods/part/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/part/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/objectives-and-methods/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/objectives-and-methods&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity">activity</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/activity&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step">step</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/step&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls">reviewed-controls</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/reviewed-controls&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/description&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection">control-selection</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-selection&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/description&gt;</p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                                   <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                                   <div class="OM-entry">
                                                      <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                                   </div>
                                                   <p class="close-tag nobr">&lt;/text&gt;</p>
                                                </details>
                                             </div>
                                             <p class="close-tag nobr">&lt;/link&gt;</p>
                                          </details>
                                          <div class="OM-choices">
                                             <p class="OM-lit">A choice of:</p>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                                   <p class="OM-map-name">[Empty]</p>
                                                </details>
                                             </div>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/include-control">include-control</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/include-control/@control-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/include-control/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/include-control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                                   <div class="model-container">
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/include-control/statement-id">statement-id</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/statement-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                                         <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                                                         <p class="close-tag nobr">&lt;/statement-id&gt;</p>
                                                      </details>
                                                   </div>
                                                   <p class="close-tag nobr">&lt;/include-control&gt;</p>
                                                </details>
                                             </div>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control">exclude-control</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/@control-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/exclude-control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/statement-id">statement-id</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/statement-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                                   <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                                                   <p class="close-tag nobr">&lt;/statement-id&gt;</p>
                                                </details>
                                             </div>
                                             <p class="close-tag nobr">&lt;/exclude-control&gt;</p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-selection/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/control-selection&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection">control-objective-selection</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-objective-selection&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/description&gt;</p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                                   <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                                   <div class="OM-entry">
                                                      <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                                   </div>
                                                   <p class="close-tag nobr">&lt;/text&gt;</p>
                                                </details>
                                             </div>
                                             <p class="close-tag nobr">&lt;/link&gt;</p>
                                          </details>
                                          <div class="OM-choices">
                                             <p class="OM-lit">A choice of:</p>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                                   <p class="OM-map-name">[Empty]</p>
                                                </details>
                                             </div>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/include-objective">include-objective</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/include-objective/@objective-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/include-objective/@objective-id">objective-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                                   <p class="OM-map-name">[Empty]</p>
                                                </details>
                                             </div>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/exclude-objective">exclude-objective</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/exclude-objective/@objective-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/exclude-objective/@objective-id">objective-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <p class="OM-map-name">[Empty]</p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/control-objective-selection/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/control-objective-selection&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/reviewed-controls/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/reviewed-controls&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role">responsible-role</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/step/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                       
                                       
                                       
                                       
                                       
                                       <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/step/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/step&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls">related-controls</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/related-controls&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection">control-selection</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-selection&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/description&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/text&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/link&gt;</p>
                                    </details>
                                    <div class="OM-choices">
                                       <p class="OM-lit">A choice of:</p>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                             <p class="OM-map-name">[Empty]</p>
                                          </details>
                                       </div>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/include-control">include-control</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/include-control/@control-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/include-control/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/include-control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/include-control/statement-id">statement-id</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/statement-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                                   <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                                                   <p class="close-tag nobr">&lt;/statement-id&gt;</p>
                                                </details>
                                             </div>
                                             <p class="close-tag nobr">&lt;/include-control&gt;</p>
                                          </details>
                                       </div>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/exclude-control">exclude-control</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-selection/exclude-control/@control-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/exclude-control/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/exclude-control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/exclude-control/statement-id">statement-id</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/statement-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                                             <p class="close-tag nobr">&lt;/statement-id&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/exclude-control&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-selection/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/control-selection&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection">control-objective-selection</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-objective-selection&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/description&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/text&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/link&gt;</p>
                                    </details>
                                    <div class="OM-choices">
                                       <p class="OM-lit">A choice of:</p>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                             <p class="OM-map-name">[Empty]</p>
                                          </details>
                                       </div>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/include-objective">include-objective</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/include-objective/@objective-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/include-objective/@objective-id">objective-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                             <p class="OM-map-name">[Empty]</p>
                                          </details>
                                       </div>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/exclude-objective">exclude-objective</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/exclude-objective/@objective-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/exclude-objective/@objective-id">objective-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">[Empty]</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/control-objective-selection/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/control-objective-selection&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/related-controls/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/related-controls&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role">responsible-role</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop">prop</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/link">link</a></span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/local-definitions/activity/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/activity/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/activity&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/local-definitions/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/local-definitions&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions">terms-and-conditions</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/terms-and-conditions&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part">part</a></span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop">prop</a></span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/part">part</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">part</span>) </span><span class="nobr">&lt;/part&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">[Empty]</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/link">link</a></span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/terms-and-conditions/part/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/terms-and-conditions/part/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
               </div>
               <p class="close-tag nobr">&lt;/terms-and-conditions&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls">reviewed-controls</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/reviewed-controls&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/description&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop">prop</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/link">link</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection">control-selection</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-selection&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop">prop</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/link">link</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/include-control">include-control</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/include-control/@control-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/include-control/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/include-control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/include-control/statement-id">statement-id</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/statement-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                                       <p class="close-tag nobr">&lt;/statement-id&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/include-control&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/exclude-control">exclude-control</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-selection/exclude-control/@control-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/exclude-control/@control-id">control-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/exclude-control&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/exclude-control/statement-id">statement-id</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="nobr">&lt;/statement-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span> value</p>
                                 <p class="close-tag nobr">&lt;/statement-id&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/exclude-control&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-selection/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/control-selection&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection">control-objective-selection</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/control-objective-selection&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop">prop</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/link">link</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/include-objective">include-objective</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/include-objective/@objective-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/include-objective/@objective-id">objective-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/exclude-objective">exclude-objective</a></span> <span class="nobr" id="/assessment-plan/reviewed-controls/control-objective-selection/exclude-objective/@objective-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/exclude-objective/@objective-id">objective-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">[Empty]</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/control-objective-selection/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/control-objective-selection&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/reviewed-controls/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/reviewed-controls&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject">assessment-subject</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/assessment-subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/description&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/text&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/link&gt;</p>
                  </details>
                  <div class="OM-choices">
                     <p class="OM-lit">A choice of:</p>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">[Empty]</p>
                        </details>
                     </div>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject">include-subject</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/@subject-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/@subject-uuid">subject-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/include-subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/include-subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/include-subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/include-subject&gt;</p>
                        </details>
                     </div>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject">exclude-subject</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/@subject-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/@subject-uuid">subject-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/exclude-subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-subject/exclude-subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/exclude-subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/exclude-subject&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/assessment-subject&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets">assessment-assets</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/assessment-assets&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component">component</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/component&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/purpose">purpose</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/purpose&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/purpose&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/status">status</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/status/@state"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/status/@state">state</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/status&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/status/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/status&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role">responsible-role</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol">protocol</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/protocol/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/protocol/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/protocol&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/title&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol/port-range">port-range</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/component/protocol/port-range/@start"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol/port-range/@start">start</a>="<span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonnegativeinteger</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/protocol/port-range/@end"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol/port-range/@end">end</a>="<span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonnegativeinteger</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/component/protocol/port-range/@transport"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/protocol/port-range/@transport">transport</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/protocol&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/component/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform">assessment-platform</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/assessment-platform&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component">uses-component</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/@component-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/@component-uuid">component-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/uses-component&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party">responsible-party</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-party&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                       
                                       
                                       
                                       
                                       
                                       <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop">prop</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link">link</a></span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/responsible-party/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/uses-component/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/uses-component&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/assessment-assets/assessment-platform/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/assessment-platform&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/assessment-assets&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task">task</a></span> <span class="nobr" id="/assessment-plan/task/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/task&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                     <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                     </div>
                     <p class="close-tag nobr">&lt;/title&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/description&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/link">link</a></span> <span class="nobr" id="/assessment-plan/task/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing">timing</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <div class="model-container">
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/on-date">on-date</a></span> <span class="nobr" id="/assessment-plan/task/timing/on-date/@date"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/on-date/@date">date</a>="<span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/within-date-range">within-date-range</a></span> <span class="nobr" id="/assessment-plan/task/timing/within-date-range/@start"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/within-date-range/@start">start</a>="<span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span>"</span> <span class="nobr" id="/assessment-plan/task/timing/within-date-range/@end"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/within-date-range/@end">end</a>="<span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">datetime-with-timezone</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/at-frequency">at-frequency</a></span> <span class="nobr" id="/assessment-plan/task/timing/at-frequency/@period"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/at-frequency/@period">period</a>="<span class="OM-datatype"><a href="/reference/datatypes/#positiveinteger">positiveinteger</a></span>"</span> <span class="nobr" id="/assessment-plan/task/timing/at-frequency/@unit"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/timing/at-frequency/@unit">unit</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                        </div>
                     </div>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/dependency">dependency</a></span> <span class="nobr" id="/assessment-plan/task/dependency/@task-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/dependency/@task-uuid">task-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/dependency&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/dependency/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/dependency&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/task">task</a></span>&gt;<span class="show-closed"><span class="OM-lit OM-gloss"> (recursive: model like parent <span class="OM-ref">task</span>) </span><span class="nobr">&lt;/task&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <p class="OM-map-name">[Empty]</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity">associated-activity</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/@activity-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/@activity-uuid">activity-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/associated-activity&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/link">link</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role">responsible-role</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/link">link</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject">subject</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/description&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/link">link</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/text&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/link&gt;</p>
                              </details>
                              <div class="OM-choices">
                                 <p class="OM-lit">A choice of:</p>
                                 <div class="OM-choice">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                       <p class="OM-map-name">[Empty]</p>
                                    </details>
                                 </div>
                                 <div class="OM-choice">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject">include-subject</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/@subject-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/@subject-uuid">subject-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/include-subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/link">link</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/include-subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                             <div class="model-container">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/include-subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                             <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                             <div class="OM-entry">
                                                <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                             </div>
                                             <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                          </details>
                                       </div>
                                       <p class="close-tag nobr">&lt;/include-subject&gt;</p>
                                    </details>
                                 </div>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject">exclude-subject</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/@subject-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/@subject-uuid">subject-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/exclude-subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/link">link</a></span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/associated-activity/subject/exclude-subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/exclude-subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/exclude-subject&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/subject&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/associated-activity/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/associated-activity&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject">subject</a></span> <span class="nobr" id="/assessment-plan/task/subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/link">link</a></span> <span class="nobr" id="/assessment-plan/task/subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/link&gt;</p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-all">include-all</a></span>/&gt;</span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">[Empty]</p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject">include-subject</a></span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/@subject-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/@subject-uuid">subject-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/include-subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/link">link</a></span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/include-subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                       <div class="model-container">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/include-subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                       <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                       <div class="OM-entry">
                                          <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                       </div>
                                       <p class="close-tag nobr">&lt;/remarks&gt;</p>
                                    </details>
                                 </div>
                                 <p class="close-tag nobr">&lt;/include-subject&gt;</p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject">exclude-subject</a></span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/@subject-uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/@subject-uuid">subject-uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/@type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/@type">type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/exclude-subject&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/link">link</a></span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/subject/exclude-subject/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/exclude-subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                                 <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/remarks&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/exclude-subject&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/subject/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/remarks&gt;</p>
                        </details>
                     </div>
                     <p class="close-tag nobr">&lt;/subject&gt;</p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role">responsible-role</a></span> <span class="nobr" id="/assessment-plan/task/responsible-role/@role-id"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/@role-id">role-id</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/responsible-role&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop">prop</a></span> <span class="nobr" id="/assessment-plan/task/responsible-role/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/responsible-role/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/task/responsible-role/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/task/responsible-role/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/task/responsible-role/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/responsible-role/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/link">link</a></span> <span class="nobr" id="/assessment-plan/task/responsible-role/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/task/responsible-role/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/task/responsible-role/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/party-uuid">party-uuid</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="nobr">&lt;/party-uuid&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span> value</p>
                           
                           
                           
                           
                           
                           <p class="close-tag nobr">&lt;/party-uuid&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/responsible-role/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/task/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                     <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                     <div class="OM-entry">
                        <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                     </div>
                     <p class="close-tag nobr">&lt;/remarks&gt;</p>
                  </details>
               </div>
               <p class="close-tag nobr">&lt;/task&gt;</p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter">back-matter</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/back-matter&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
               <div class="model-container">
                  <details class="OM-entry">
                     <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource">resource</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/resource&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                     <div class="model-container">
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/title">title</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/title&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                           </div>
                           <p class="close-tag nobr">&lt;/title&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/description">description</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/description&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">One or more blocks of text: a <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span> value</p>
                           <div class="OM-entry">
                              <p class="OM-line">&lt;p&gt; <span class="OM-lit OM-gloss">or other elements defined as <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></span> <span class="OM-cardinality">[0 to ∞]</span></p>
                           </div>
                           <p class="close-tag nobr">&lt;/description&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop">prop</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/document-id">document-id</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/document-id/@scheme"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/document-id/@scheme">scheme</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/document-id&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                           <p class="close-tag nobr">&lt;/document-id&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation">citation</a></span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/citation&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[1]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span> value</p>
                                 <div class="OM-entry">
                                    <p class="OM-line OM-lit OM-gloss"> Text and inline markup including <code>&lt;insert&gt;</code><code>&lt;em&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;code&gt;</code>. </p>
                                 </div>
                                 <p class="close-tag nobr">&lt;/text&gt;</p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop">prop</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/prop/@name"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop/@name">name</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/prop/@uuid"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop/@uuid">uuid</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/prop/@ns"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop/@ns">ns</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/prop/@value"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop/@value">value</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/prop/@class"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop/@class">class</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/prop/@group"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop/@group">group</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/prop&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/prop/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/link">link</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/link/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/link/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/link/@rel"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/link/@rel">rel</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/citation/link/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/link/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/link&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <div class="model-container">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/citation/link/text">text</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="nobr">&lt;/text&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/rlink">rlink</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/rlink/@href"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/rlink/@href">href</a>="<span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/rlink/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/rlink/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"> … <span class="nobr">&lt;/rlink&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                           <div class="model-container">
                              <details class="OM-entry">
                                 <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/rlink/hash">hash</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/rlink/hash/@algorithm"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/rlink/hash/@algorithm">algorithm</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="nobr">&lt;/hash&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 to ∞]</span></span></summary>
                                 <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span> value</p>
                                 
                                 
                                 
                                 
                                 
                                 <p class="close-tag nobr">&lt;/hash&gt;</p>
                              </details>
                           </div>
                           <p class="close-tag nobr">&lt;/rlink&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/base64">base64</a></span> <span class="nobr" id="/assessment-plan/back-matter/resource/base64/@filename"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/base64/@filename">filename</a>="<span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span>"</span> <span class="nobr" id="/assessment-plan/back-matter/resource/base64/@media-type"><a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/base64/@media-type">media-type</a>="<span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span>"</span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span><span class="nobr">&lt;/base64&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
                           <p class="OM-map-name">a <span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64binary</a></span> value</p>
                           <p class="close-tag nobr">&lt;/base64&gt;</p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><span class="nobr">&lt;<a class="OM-name" href="../xml-reference/#/assessment-plan/back-matter/resource/remarks">remarks</a></span>&gt;<span class="show-closed"><span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="nobr">&lt;/remarks&gt;</span></span></span><span class="sq cardinality"> <span class="OM-cardinality">[0 or 1]</span></span></summary>
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
         <p class="close-tag nobr">&lt;/assessment-plan&gt;</p>
      </details>
   </div>
</div>{{< /rawhtml >}}
