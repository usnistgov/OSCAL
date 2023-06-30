---
title: "OSCAL Component Definition Model v1.0.6 JSON Format Outline"
heading: "Component Definition Model v1.0.6 JSON Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 10
generateanchors: false
sidenav:
  title: JSON Outline

---

The following outline is a representation of the [JSON format](https://github.com/usnistgov/OSCAL/blob/v1.0.6/json/schema/oscal_component-definition_schema.json) for this [model](/concepts/layer/implementation/component-definition/). For each property, the name links to the corresponding entry in the [JSON Format Reference](../json-reference/). The cardinality and data type are also provided for each property where appropriate.

<!-- DO NOT REMOVE. Generated text below -->
{{< rawhtml >}}
<div xmlns="http://www.w3.org/1999/xhtml" class="json-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><a class="OM-name" href="../json-reference/#/component-definition">component-definition</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
         <div class="model-container object">
            <div class="OM-entry">
               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
            </div>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/component-definition/metadata">metadata</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/last-modified">last-modified</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/version">version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/oscal-version">oscal-version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions">revisions</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions">revision</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/last-modified">last-modified</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/version">version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/oscal-version">oscal-version</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/document-ids">document-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles">roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/roles">role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations">locations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/locations">location</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address">address</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/addr-lines">addr-line</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/email-addresses">email-address</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/telephone-numbers">telephone-number</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/urls">urls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/urls">url</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties">parties</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties">party</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/type">type</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/name">name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/external-ids">external-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/external-ids">external-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/external-ids/scheme">scheme</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/external-ids/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/email-addresses">email-address</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/telephone-numbers">telephone-number</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses">addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses">address</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/addr-lines">addr-line</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/location-uuids">location-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/location-uuids">location-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">]</span></p>
                                    </details>
                                 </div>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/member-of-organizations">member-of-organizations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/member-of-organizations">member-of-organization</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties">responsible-parties</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties">responsible-party</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/import-component-definitions">import-component-definitions</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
               <div class="model-container array">
                  <div class="OM-entry">
                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/import-component-definitions">import-component-definition</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/import-component-definitions/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }</span></p>
                  </div>
               </div>
               <p><span class="OM-lit">], </span></p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components">components</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
               <div class="model-container array">
                  <div class="OM-entry">
                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components">component</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/type">type</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/purpose">purpose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles">responsible-roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles">responsible-role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/responsible-roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols">protocols</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/protocols">protocol</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols/port-ranges">port-ranges</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/protocols/port-ranges">port-range</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols/port-ranges/start">start</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols/port-ranges/end">end</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/protocols/port-ranges/transport">transport</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
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
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations">control-implementations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations">control-implementation</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/source">source</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/set-parameters">set-parameters</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/set-parameters">set-parameter</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/set-parameters/param-id">param-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/set-parameters/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/set-parameters/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/set-parameters/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements">implemented-requirements</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements">implemented-requirement</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/control-id">control-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters">set-parameters</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters">set-parameter</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/param-id">param-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/set-parameters/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles">responsible-roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles">responsible-role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/responsible-roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements">statements</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements">statement</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/statement-id">statement-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles">responsible-roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles">responsible-role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/responsible-roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/statements/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/control-implementations/implemented-requirements/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
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
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }</span></p>
                  </div>
               </div>
               <p><span class="OM-lit">], </span></p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities">capabilities</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
               <div class="model-container array">
                  <div class="OM-entry">
                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities">capability</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/incorporates-components">incorporates-components</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/incorporates-components">incorporates-component</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/incorporates-components/component-uuid">component-uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/incorporates-components/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations">control-implementations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations">control-implementation</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/source">source</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters">set-parameters</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters">set-parameter</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters/param-id">param-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/set-parameters/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements">implemented-requirements</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements">implemented-requirement</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/control-id">control-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters">set-parameters</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters">set-parameter</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/param-id">param-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/set-parameters/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles">responsible-roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles">responsible-role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/responsible-roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements">statements</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements">statement</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/statement-id">statement-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles">responsible-roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles">responsible-role</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/responsible-roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/statements/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/control-implementations/implemented-requirements/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
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
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }</span></p>
                  </div>
               </div>
               <p><span class="OM-lit">], </span></p>
            </details>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/component-definition/back-matter">back-matter</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources">resources</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources">resource</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/document-ids">document-id</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation">citation</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/text">text</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#token">token</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
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
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks">rlinks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks">rlink</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks/hashes">hashes</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks/hashes">hash</a> objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks/hashes/algorithm">algorithm</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/rlinks/hashes/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
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
                                 <summary><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/base64">base64</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/base64/filename">filename</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/base64/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/base64/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#base64binary">base64Binary</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
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
