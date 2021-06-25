---
title: "OSCAL Component Definition Model v1.0.0-rc2 JSON Format Outline"
heading: "Component Definition Model v1.0.0-rc2 JSON Format Outline"
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 10
generateanchors: false
sidenav:
  title: JSON Outline

---

The following outline is a representation of the [JSON format](https://github.com/usnistgov/OSCAL/blob/v1.0.0-rc2/json/schema/oscal_component-definition_schema.json) for this [model](/concepts/layer/implementation/component-definition/). For each property, the name links to the corresponding entry in the [JSON Format Reference](../json-reference/). The cardinality and data type are also provided for each property where appropriate.

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
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/version">version</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/revisions/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/address/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/locations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/parties/addresses/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties">responsible-parties</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                     <div class="model-container object">
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/metadata/responsible-parties/responsible-party/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </details>
                     </div>
                     <p><span class="OM-lit"> }, </span></p>
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
               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components">components</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/uuid">{uuid}</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/type">type</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/purpose">purpose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                 <div class="model-container object">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </details>
                           </div>
                           <p><span class="OM-lit"> }, </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols">protocols</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols">protocol</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/port-ranges">port-ranges</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/port-ranges">port-range</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/port-ranges/start">start</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/port-ranges/end">end</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#nonnegativeinteger">nonNegativeInteger</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/protocols/port-ranges/transport">transport</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations">control-implementations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations">control-implementation</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/source">source</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/set-parameters">set-parameters</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/set-parameters/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                             <div class="model-container object">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/set-parameters/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/set-parameters/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/set-parameters/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </details>
                                       </div>
                                       <p><span class="OM-lit"> }, </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements">implemented-requirements</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements">implemented-requirement</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/control-id">control-id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </details>
                                                   </div>
                                                   <p><span class="OM-lit"> }, </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/set-parameters">set-parameters</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/set-parameters/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/set-parameters/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/set-parameters/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/set-parameters/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </details>
                                                   </div>
                                                   <p><span class="OM-lit"> }, </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements">statements</a> objects , keyed by their <span class="OM-name">statement-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/statement-id">{statement-id}</a> objects , keyed by their <span class="OM-name">statement-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                     <div class="model-container object">
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </details>
                                                               </div>
                                                               <p><span class="OM-lit"> }, </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/statements/statement/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </details>
                                                   </div>
                                                   <p><span class="OM-lit"> }, </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/control-implementations/implemented-requirements/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/components/component/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }</span></p>
                  </details>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities">capabilities</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/uuid">{uuid}</a> objects , keyed by their <span class="OM-name">uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/incorporates-components">incorporates-components</a> objects , keyed by their <span class="OM-name">component-uuid</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                           <div class="model-container object">
                              <details class="OM-entry">
                                 <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/incorporates-components/incorporates-component/component-uuid">{component-uuid}</a> objects , keyed by their <span class="OM-name">component-uuid</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/incorporates-components/incorporates-component/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </details>
                           </div>
                           <p><span class="OM-lit"> }, </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations">control-implementations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations">control-implementation</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/source">source</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/set-parameters">set-parameters</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                       <div class="model-container object">
                                          <details class="OM-entry">
                                             <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/set-parameters/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                             <div class="model-container object">
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/set-parameters/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/set-parameters/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/set-parameters/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </details>
                                       </div>
                                       <p><span class="OM-lit"> }, </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements">implemented-requirements</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements">implemented-requirement</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/control-id">control-id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </details>
                                                   </div>
                                                   <p><span class="OM-lit"> }, </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/set-parameters">set-parameters</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/set-parameters/set-parameter/param-id">{param-id}</a> objects , keyed by their <span class="OM-name">param-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                         <div class="model-container object">
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/set-parameters/set-parameter/values">values</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/set-parameters/set-parameter/values">value</a> strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/set-parameters/set-parameter/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </details>
                                                   </div>
                                                   <p><span class="OM-lit"> }, </span></p>
                                                </details>
                                                <details class="OM-entry">
                                                   <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements">statements</a> objects , keyed by their <span class="OM-name">statement-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                   <div class="model-container object">
                                                      <details class="OM-entry">
                                                         <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/statement-id">{statement-id}</a> objects , keyed by their <span class="OM-name">statement-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/description">description</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                     <div class="model-container object">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                            <details class="OM-entry">
                                                               <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles">responsible-roles</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                                               <div class="model-container object">
                                                                  <details class="OM-entry">
                                                                     <summary><span class="OM-lit"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/role-id">{role-id}</a> objects , keyed by their <span class="OM-name">role-id</span> values:</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                                     <div class="model-container object">
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props">prop</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links">link</a> objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                                 <div class="model-container object">
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                    <div class="OM-entry">
                                                                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                                    </div>
                                                                                 </div>
                                                                                 <p><span class="OM-lit"> }</span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <details class="OM-entry">
                                                                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/party-uuids">party-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                           <div class="model-container array">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><span class="OM-lit">An array of <a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/party-uuids">party-uuid</a> strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#uuid">uuid</a></span></p>
                                                                              </div>
                                                                           </div>
                                                                           <p><span class="OM-lit">], </span></p>
                                                                        </details>
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/responsible-roles/responsible-role/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                        </div>
                                                                     </div>
                                                                     <p><span class="OM-lit"> }</span></p>
                                                                  </details>
                                                               </div>
                                                               <p><span class="OM-lit"> }, </span></p>
                                                            </details>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/statements/statement/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit"> }</span></p>
                                                      </details>
                                                   </div>
                                                   <p><span class="OM-lit"> }, </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/control-implementations/implemented-requirements/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/capabilities/capability/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#markup-multiline">markup-multiline</a></span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }</span></p>
                  </details>
               </div>
               <p><span class="OM-lit"> }, </span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="/reference/datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
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
                                       <summary><a class="OM-name" href="../json-reference/#/component-definition/back-matter/resources/citation/biblio">biblio</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                       <p><span class="OM-lit"> }, </span></p>
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
