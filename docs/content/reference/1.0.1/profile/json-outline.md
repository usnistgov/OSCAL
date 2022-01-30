---
title: "OSCAL Profile Model v1.0.1 JSON Format Outline"
heading: "Profile Model v1.0.1 JSON Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 10
generateanchors: false
sidenav:
  title: JSON Outline

---

The following outline is a representation of the [JSON format](https://github.com/usnistgov/OSCAL/blob/v1.0.1/json/schema/oscal_profile_schema.json) for this [model](/concepts/layer/control/profile/). For each property, the name links to the corresponding entry in the [JSON Format Reference](../json-reference/). The cardinality and data type are also provided for each property where appropriate.

<!-- DO NOT REMOVE. Generated text below -->
{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="json-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><a class="OM-name" href="../json-reference/#/profile">profile</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
         <div class="model-container object">
            <div class="OM-entry">
               <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
            </div>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/profile/metadata">metadata</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/last-modified">last-modified</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/version">version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/oscal-version">oscal-version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions">revisions</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/revisions">revision</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/last-modified">last-modified</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/version">version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/oscal-version">oscal-version</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/revisions/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/revisions/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/document-ids">document-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/roles">roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/roles">role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/locations">locations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/locations">location</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/profile/metadata/locations/address">address</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/address/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/address/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/locations/address/addr-lines">addr-line</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/address/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/address/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/address/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/address/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/locations/email-addresses">email-address</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/locations/telephone-numbers">telephone-number</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/urls">urls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/locations/urls">url</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/locations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/locations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/locations/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties">parties</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties">party</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/type">type</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/name">name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/external-ids">external-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/external-ids">external-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/external-ids/scheme">scheme</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/external-ids/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/email-addresses">email-address</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/telephone-numbers">telephone-number</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses">addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses">address</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses/addr-lines">addr-line</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/addresses/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/location-uuids">location-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/location-uuids">location-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">]</span></p>
                                    </details>
                                 </div>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/member-of-organizations">member-of-organizations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/parties/member-of-organizations">member-of-organization</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/parties/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties">responsible-parties</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties">responsible-party</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/responsible-parties/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/metadata/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/imports">imports</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
               <div class="model-container array">
                  <div class="OM-entry">
                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/imports">import</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/imports/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice of:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/profile/imports/include-all">include-all</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/imports/include-controls">include-controls</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/imports/include-controls">include-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/imports/include-controls/with-child-controls">with-child-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/imports/include-controls/with-ids">with-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/imports/include-controls/with-ids">with-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/imports/include-controls/matching">matching</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/imports/include-controls/matching">matching</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/imports/include-controls/matching/pattern">pattern</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                                 <p><span class="OM-lit">]</span></p>
                              </details>
                           </div>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls">exclude-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls">exclude-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls/with-child-controls">with-child-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls/with-ids">with-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls/with-ids">with-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls/matching">matching</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls/matching">matching</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/imports/exclude-controls/matching/pattern">pattern</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                     </div>
                     <p><span class="OM-lit"> }</span></p>
                  </div>
               </div>
               <p><span class="OM-lit">], </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/profile/merge">merge</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><a class="OM-name" href="../json-reference/#/profile/merge/combine">combine</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/combine/method">method</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
                  </details>
                  <div class="OM-choices">
                     <p class="OM-lit">A choice of:</p>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><a class="OM-name" href="../json-reference/#/profile/merge/flat">flat</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                           <p><span class="OM-lit"> }, </span></p>
                        </details>
                     </div>
                     <div class="OM-choice">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/as-is">as-is</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#boolean">boolean</a></span><span class="OM-lit">,</span></p>
                        </div>
                     </div>
                     <div class="OM-choice">
                        <details class="OM-entry">
                           <summary><a class="OM-name" href="../json-reference/#/profile/merge/custom">custom</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups">groups</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups">group</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params">params</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params">param</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/depends-on">depends-on</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/label">label</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/usage">usage</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/constraints">constraints</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/constraints">constraint</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/constraints/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/constraints/tests">tests</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/constraints/tests">test</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/constraints/tests/expression">expression</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/constraints/tests/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
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
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/guidelines">guidelines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/guidelines">guideline</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/guidelines/prose">prose</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/values">values</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/values">value</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                         </div>
                                                         <div class="OM-choice">
                                                            <details class="OM-entry">
                                                               <summary><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/select">select</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/select/how-many">how-many</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/select/choice">choice</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/select/choice">choice</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </details>
                                                         </div>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/params/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts">part</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/prose">prose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/parts">part</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/parts/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
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
                                          <div class="OM-choices">
                                             <p class="OM-lit">A choice of:</p>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/groups">groups</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/groups">group</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                             </div>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls">insert-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls">insert-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/order">order</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-choices">
                                                               <p class="OM-lit">A choice of:</p>
                                                               <div class="OM-choice">
                                                                  <details class="OM-entry">
                                                                     <summary><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-all">include-all</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                                     <p><span class="OM-lit"> }, </span></p>
                                                                  </details>
                                                               </div>
                                                               <div class="OM-choice">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls">include-controls</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls">include-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/with-child-controls">with-child-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/with-ids">with-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/with-ids">with-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit">], </span></p>
                                                                              </details>
                                                                              <details class="OM-entry">
                                                                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/matching">matching</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                                 <div class="model-container array">
                                                                                    <div class="OM-entry">
                                                                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/matching">matching</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                       <div class="model-container object">
                                                                                          <div class="OM-entry">
                                                                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/include-controls/matching/pattern">pattern</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                                                                     <p><span class="OM-lit">]</span></p>
                                                                  </details>
                                                               </div>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls">exclude-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls">exclude-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/with-child-controls">with-child-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids">with-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/with-ids">with-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/matching">matching</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/matching">matching</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/groups/insert-controls/exclude-controls/matching/pattern">pattern</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">]</span></p>
                                                </details>
                                             </div>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls">insert-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls">insert-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/order">order</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-choices">
                                             <p class="OM-lit">A choice of:</p>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-all">include-all</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                   <p><span class="OM-lit"> }, </span></p>
                                                </details>
                                             </div>
                                             <div class="OM-choice">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls">include-controls</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls">include-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/with-child-controls">with-child-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/with-ids">with-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/with-ids">with-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/matching">matching</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/matching">matching</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/include-controls/matching/pattern">pattern</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                                                   <p><span class="OM-lit">]</span></p>
                                                </details>
                                             </div>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls">exclude-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls">exclude-controls</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/with-child-controls">with-child-controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/with-ids">with-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/with-ids">with-id</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/matching">matching</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/matching">matching</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/merge/custom/insert-controls/exclude-controls/matching/pattern">pattern</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/profile/modify">modify</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters">set-parameters</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters">set-parameter</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/param-id">param-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/depends-on">depends-on</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/label">label</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/usage">usage</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/constraints">constraints</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/constraints">constraint</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/constraints/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/constraints/tests">tests</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/constraints/tests">test</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/constraints/tests/expression">expression</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/constraints/tests/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
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
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/guidelines">guidelines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/guidelines">guideline</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/guidelines/prose">prose</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/values">values</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/values">value</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                 </div>
                                 <div class="OM-choice">
                                    <details class="OM-entry">
                                       <summary><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/select">select</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/select/how-many">how-many</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/select/choice">choice</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/set-parameters/select/choice">choice</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </details>
                                 </div>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters">alters</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters">alter</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/control-id">control-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/removes">removes</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/removes">remove</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/removes/by-name">by-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/removes/by-class">by-class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/removes/by-id">by-id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/removes/by-item-name">by-item-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/removes/by-ns">by-ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds">adds</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds">add</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/position">position</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/by-id">by-id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params">params</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params">param</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/depends-on">depends-on</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/label">label</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/usage">usage</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/constraints">constraints</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/constraints">constraint</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/constraints/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/constraints/tests">tests</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/constraints/tests">test</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/constraints/tests/expression">expression</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/constraints/tests/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit"> }</span></p>
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
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/guidelines">guidelines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/guidelines">guideline</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/guidelines/prose">prose</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/values">values</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/values">value</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                         </div>
                                                         <div class="OM-choice">
                                                            <details class="OM-entry">
                                                               <summary><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/select">select</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/select/how-many">how-many</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/select/choice">choice</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/select/choice">choice</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit">], </span></p>
                                                                  </details>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </details>
                                                         </div>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/params/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts">part</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/prose">prose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/parts">part</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/modify/alters/adds/parts/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
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
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/profile/back-matter">back-matter</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources">resources</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/back-matter/resources">resource</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/back-matter/resources/document-ids">document-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation">citation</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/text">text</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/citation/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
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
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks">rlinks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks">rlink</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks/hashes">hashes</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks/hashes">hash</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks/hashes/algorithm">algorithm</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/rlinks/hashes/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
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
                                 <summary><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/base64">base64</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/base64/filename">filename</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/base64/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/base64/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64Binary</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/profile/back-matter/resources/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
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
         </div>
         <p><span class="OM-lit"> }</span></p>
      </details>
   </div>
</div>{{< /rawhtml >}}
