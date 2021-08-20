---
title: "OSCAL System Security Plan Model v1.0.0-rc2 JSON Format Outline"
heading: "System Security Plan Model v1.0.0-rc2 JSON Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 10
generateanchors: false
sidenav:
  title: JSON Outline

---

The following outline is a representation of the [JSON format](https://github.com/usnistgov/OSCAL/blob/v1.0.0-rc2/json/schema/oscal_ssp_schema.json) for this [model](/concepts/layer/implementation/ssp/). For each property, the name links to the corresponding entry in the [JSON Format Reference](../json-reference/). The cardinality and data type are also provided for each property where appropriate.

<!-- DO NOT REMOVE. Generated text below -->
{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="json-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><a class="OM-name" href="../json-reference/#/system-security-plan">system-security-plan</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
         <div class="model-container object">
            <div class="OM-entry">
               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
            </div>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/system-security-plan/metadata">metadata</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/last-modified">last-modified</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/version">version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/oscal-version">oscal-version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions">revisions</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions">revision</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/last-modified">last-modified</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/version">version</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/oscal-version">oscal-version</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/revisions/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/document-ids">document-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles">roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles">role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations">locations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations">location</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address">address</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address/addr-lines">addr-line</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/address/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/email-addresses">email-address</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/telephone-numbers">telephone-number</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/urls">urls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/urls">url</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/locations/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties">parties</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties">party</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/type">type</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/name">name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/external-ids">external-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/external-ids">external-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/external-ids/scheme">scheme</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/external-ids/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/email-addresses">email-address</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/telephone-numbers">telephone-number</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-choices">
                                 <p class="OM-lit">A choice of:</p>
                                 <div class="OM-choice">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses">addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses">address</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses/addr-lines">addr-line</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/addresses/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                 </div>
                                 <div class="OM-choice">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/location-uuids">location-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/location-uuids">location-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">]</span></p>
                                    </details>
                                 </div>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/member-of-organizations">member-of-organizations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/member-of-organizations">member-of-organization</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/parties/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties">responsible-parties</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/responsible-parties/responsible-party/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </details>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/metadata/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/system-security-plan/import-profile">import-profile</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/import-profile/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/import-profile/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics">system-characteristics</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-ids">system-ids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-ids">system-id</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-ids/identifier-type">identifier-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-ids/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-name">system-name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-name-short">system-name-short</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/date-authorized">date-authorized</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#date">date</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/security-sensitivity-level">security-sensitivity-level</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <details class="OM-entry">
                     <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information">system-information</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types">information-types</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types">information-type</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/categorizations">categorizations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/categorizations">categorization</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/categorizations/system">system</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/categorizations/information-type-ids">information-type-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/categorizations/information-type-ids">information-type-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">]</span></p>
                                                </details>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact">confidentiality-impact</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/base">base</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/selected">selected</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/confidentiality-impact/adjustment-justification">adjustment-justification</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }, </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact">integrity-impact</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/base">base</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/selected">selected</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/integrity-impact/adjustment-justification">adjustment-justification</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }, </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact">availability-impact</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/base">base</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/selected">selected</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/system-information/information-types/availability-impact/adjustment-justification">adjustment-justification</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/security-impact-level">security-impact-level</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/security-impact-level/security-objective-confidentiality">security-objective-confidentiality</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/security-impact-level/security-objective-integrity">security-objective-integrity</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/security-impact-level/security-objective-availability">security-objective-availability</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/status">status</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/status/state">state</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/status/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary">authorization-boundary</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams">diagrams</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/uuid">{uuid}</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/caption">caption</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/diagrams/diagram/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </details>
                           </div>
                           <p><span class="OM-lit"> }, </span></p>
                        </details>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/authorization-boundary/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture">network-architecture</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams">diagrams</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/uuid">{uuid}</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/caption">caption</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/diagrams/diagram/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </details>
                           </div>
                           <p><span class="OM-lit"> }, </span></p>
                        </details>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/network-architecture/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow">data-flow</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams">diagrams</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/uuid">{uuid}</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/caption">caption</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/diagrams/diagram/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </details>
                           </div>
                           <p><span class="OM-lit"> }, </span></p>
                        </details>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/data-flow/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties">responsible-parties</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/responsible-parties/responsible-party/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </details>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-characteristics/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation">system-implementation</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations">leveraged-authorizations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations">leveraged-authorization</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/party-uuid">party-uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/date-authorized">date-authorized</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#date">date</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/leveraged-authorizations/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users">users</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/uuid">{uuid}</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/role-ids">role-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/role-ids">role-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/authorized-privileges">authorized-privileges</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/authorized-privileges">authorized-privilege</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/authorized-privileges/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/authorized-privileges/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/authorized-privileges/functions-performed">functions-performed</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/authorized-privileges/functions-performed">function-performed</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">]</span></p>
                                          </details>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/users/user/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </details>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components">components</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/uuid">{uuid}</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/type">type</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/purpose">purpose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/status">status</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/status/state">state</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/status/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols">protocols</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols">protocol</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/port-ranges">port-ranges</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/port-ranges">port-range</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/port-ranges/start">start</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/port-ranges/end">end</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/protocols/port-ranges/transport">transport</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/components/component/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </details>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items">inventory-items</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items">inventory-item</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties">responsible-parties</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/responsible-parties/responsible-party/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components">implemented-components</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components">implemented-component</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/component-uuid">component-uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties">responsible-parties</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                             <div class="model-container object">
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/responsible-parties/responsible-party/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </details>
                                             </div>
                                             <p><span class="OM-lit"> }, </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/implemented-components/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/inventory-items/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/system-implementation/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation">control-implementation</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/set-parameters">set-parameters</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/set-parameters/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/set-parameters/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/set-parameters/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/set-parameters/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </details>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements">implemented-requirements</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements">implemented-requirement</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/control-id">control-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/parameter-settings">parameter-settings</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/parameter-settings/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/parameter-settings/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/parameter-settings/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/parameter-settings/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components">by-components</a> objects , keyed by their <span class="OM-name">component-uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/component-uuid">{component-uuid}</a> objects , keyed by their <span class="OM-name">component-uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/parameter-settings">parameter-settings</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                             <div class="model-container object">
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/parameter-settings/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/parameter-settings/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/parameter-settings/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/parameter-settings/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </details>
                                             </div>
                                             <p><span class="OM-lit"> }, </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/implementation-status">implementation-status</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/implementation-status/state">state</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/implementation-status/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }, </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export">export</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided">provided</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided">provided</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                     <div class="model-container object">
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </details>
                                                               </div>
                                                               <p><span class="OM-lit"> }, </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/provided/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities">responsibilities</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities">responsibility</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/provided-uuid">provided-uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                     <div class="model-container object">
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </details>
                                                               </div>
                                                               <p><span class="OM-lit"> }, </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/responsibilities/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/export/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }, </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited">inherited</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited">inherited</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/provided-uuid">provided-uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/inherited/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </details>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </details>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied">satisfied</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied">satisfied</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsibility-uuid">responsibility-uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </details>
                                                         </div>
                                                         <p><span class="OM-lit"> }, </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/satisfied/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                             <div class="model-container object">
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </details>
                                             </div>
                                             <p><span class="OM-lit"> }, </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/by-component/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements">statements</a> objects , keyed by their <span class="OM-name">statement-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/statement-id">{statement-id}</a> objects , keyed by their <span class="OM-name">statement-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components">by-components</a> objects , keyed by their <span class="OM-name">component-uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                             <div class="model-container object">
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/component-uuid">{component-uuid}</a> objects , keyed by their <span class="OM-name">component-uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/parameter-settings">parameter-settings</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/parameter-settings/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/parameter-settings/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/parameter-settings/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/parameter-settings/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </details>
                                                         </div>
                                                         <p><span class="OM-lit"> }, </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/implementation-status">implementation-status</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/implementation-status/state">state</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/implementation-status/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }, </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export">export</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided">provided</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided">provided</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                                           <div class="model-container object">
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                                 <div class="model-container object">
                                                                                    <details class="OM-entry">
                                                                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                       <div class="model-container array">
                                                                                          <div class="OM-entry">
                                                                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                             <div class="model-container object">
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                             </div>
                                                                                             <p><span class="OM-lit"> }</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit">], </span></p>
                                                                                    </details>
                                                                                    <details class="OM-entry">
                                                                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                       <div class="model-container array">
                                                                                          <div class="OM-entry">
                                                                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                             <div class="model-container object">
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                             </div>
                                                                                             <p><span class="OM-lit"> }</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit">], </span></p>
                                                                                    </details>
                                                                                    <details class="OM-entry">
                                                                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                       <div class="model-container array">
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit">], </span></p>
                                                                                    </details>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </details>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }, </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/provided/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities">responsibilities</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities">responsibility</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/provided-uuid">provided-uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                                           <div class="model-container object">
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                                 <div class="model-container object">
                                                                                    <details class="OM-entry">
                                                                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                       <div class="model-container array">
                                                                                          <div class="OM-entry">
                                                                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                             <div class="model-container object">
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                             </div>
                                                                                             <p><span class="OM-lit"> }</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit">], </span></p>
                                                                                    </details>
                                                                                    <details class="OM-entry">
                                                                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                       <div class="model-container array">
                                                                                          <div class="OM-entry">
                                                                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                             <div class="model-container object">
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                                <div class="OM-entry">
                                                                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                                </div>
                                                                                             </div>
                                                                                             <p><span class="OM-lit"> }</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit">], </span></p>
                                                                                    </details>
                                                                                    <details class="OM-entry">
                                                                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                       <div class="model-container array">
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit">], </span></p>
                                                                                    </details>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </details>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }, </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/responsibilities/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/export/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }, </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited">inherited</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited">inherited</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/provided-uuid">provided-uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                     <div class="model-container object">
                                                                        <details class="OM-entry">
                                                                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                           <div class="model-container object">
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                       <div class="model-container object">
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit"> }</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit">], </span></p>
                                                                              </details>
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                       <div class="model-container object">
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit"> }</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit">], </span></p>
                                                                              </details>
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit">], </span></p>
                                                                              </details>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/inherited/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </details>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </details>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied">satisfied</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied">satisfied</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsibility-uuid">responsibility-uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                                     <div class="model-container object">
                                                                        <details class="OM-entry">
                                                                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                           <div class="model-container object">
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                       <div class="model-container object">
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit"> }</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit">], </span></p>
                                                                              </details>
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                       <div class="model-container object">
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                          </div>
                                                                                       </div>
                                                                                       <p><span class="OM-lit"> }</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit">], </span></p>
                                                                              </details>
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit">], </span></p>
                                                                              </details>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </details>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }, </span></p>
                                                                  </details>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/satisfied/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </details>
                                                         </div>
                                                         <p><span class="OM-lit"> }, </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/by-components/by-component/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </details>
                                             </div>
                                             <p><span class="OM-lit"> }, </span></p>
                                          </details>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/control-implementation/implemented-requirements/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter">back-matter</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources">resources</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources">resource</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/document-ids">document-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation">citation</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/text">text</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/citation/biblio">biblio</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                       <p><span class="OM-lit"> }, </span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks">rlinks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks">rlink</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks/hashes">hashes</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks/hashes">hash</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks/hashes/algorithm">algorithm</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/rlinks/hashes/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/base64">base64</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/base64/filename">filename</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/base64/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/base64/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64Binary</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/system-security-plan/back-matter/resources/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
               </div>
               <p><span class="OM-lit"> }</span></p>
            </details>
         </div>
         <p><span class="OM-lit"> }</span></p>
      </details>
   </div>
</div>{{< /rawhtml >}}
