---
title: "System Security Plan Model JSON Format Outline"
heading: OSCAL System Security Plan (SSP) Model JSON Format Outline
description: An outline of the OSCAL System Security Plan model JSON format.
custom_js:
  - "/js/oscal-metaschema-map-expander.js"
weight: 10
sidenav:
  title: JSON Outline
aliases:
  - /docs/maps/oscal-ssp-json/
  - /documentation/schema/ssp/json-schema-map/
  - /documentation/schema/implementation-layer/ssp/json-model-map/
---

<!-- DO NOT REMOVE. Generated text below -->
<div xmlns="http://www.w3.org/1999/xhtml" class="json-outline">
   <div class="model-container">
      <details class="OM-entry" open="open">
         <summary><a class="OM-name" href="../json-reference/#/catalog">catalog</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
         <div class="model-container object">
            <div class="OM-entry">
               <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
            </div>
            <details class="OM-entry">
               <summary><a class="OM-name" href="../json-reference/#/catalog/metadata">metadata</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/last-modified">last-modified</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/version">version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/oscal-version">oscal-version</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                  </div>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions">revisions</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of revision objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/published">published</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/last-modified">last-modified</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#datetime-with-timezone">dateTime-with-timezone</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/version">version</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/oscal-version">oscal-version</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/revisions/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of document-id objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles">roles</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of role objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/roles/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations">locations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of location objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/address">address</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/address/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/address/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of addr-line strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/address/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/address/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/address/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/address/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of email-address strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of telephone-number objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/urls">urls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of url strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/locations/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties">parties</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of party objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/type">type</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/name">name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/short-name">short-name</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/external-ids">external-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of external-id objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/external-ids/scheme">scheme</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/external-ids/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/email-addresses">email-addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of email-address strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#email">email</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/telephone-numbers">telephone-numbers</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of telephone-number objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/telephone-numbers/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/telephone-numbers/number">number</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-choices">
                                 <p class="OM-lit">A choice:</p>
                                 <div class="OM-choice">
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/addresses">addresses</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of address objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/addresses/type">type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/addresses/addr-lines">addr-lines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of addr-line strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit">], </span></p>
                                                </details>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/addresses/city">city</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/addresses/state">state</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/addresses/postal-code">postal-code</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/addresses/country">country</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/location-uuids">location-uuids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of location-uuid strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">]</span></p>
                                    </details>
                                 </div>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/member-of-organizations">member-of-organizations</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of member-of-organization strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/parties/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties">responsible-parties</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of responsible-party objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/role-id">role-id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/party-uuids">party-uuids</a> <span class="OM-cardinality">[1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of party-uuid strings</span> <span class="OM-cardinality">[1 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/responsible-parties/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit"> }</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit">], </span></p>
                  </details>
                  <div class="OM-entry">
                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/metadata/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                  </div>
               </div>
               <p><span class="OM-lit"> }, </span></p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params">params</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
               <div class="model-container array">
                  <div class="OM-entry">
                     <p><span class="OM-lit">An array of parameter objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/depends-on">depends-on</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/label">label</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/usage">usage</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params/constraints">constraints</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of parameter-constraint objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/constraints/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params/constraints/tests">tests</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of test objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/constraints/tests/expression">expression</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/constraints/tests/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params/guidelines">guidelines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of parameter-guideline objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/guidelines/prose">prose</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <div class="OM-choices">
                           <p class="OM-lit">A choice:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params/values">values</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p class="OM-line"><span class="OM-lit">An array of parameter-value strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/catalog/params/select">select</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/select/how-many">how-many</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/params/select/choice">choice</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p class="OM-line"><span class="OM-lit">An array of parameter-choice strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span></p>
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
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/params/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                        </div>
                     </div>
                     <p><span class="OM-lit"> }</span></p>
                  </div>
               </div>
               <p><span class="OM-lit">], </span></p>
            </details>
            <details class="OM-entry">
               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls">controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
               <div class="model-container array">
                  <div class="OM-entry">
                     <p><span class="OM-lit">An array of control objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params">params</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of parameter objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/depends-on">depends-on</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/label">label</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/usage">usage</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params/constraints">constraints</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of parameter-constraint objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/constraints/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params/constraints/tests">tests</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of test objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/constraints/tests/expression">expression</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/constraints/tests/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params/guidelines">guidelines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of parameter-guideline objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/guidelines/prose">prose</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-choices">
                                       <p class="OM-lit">A choice:</p>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params/values">values</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of parameter-value strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                       </div>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><a class="OM-name" href="../json-reference/#/catalog/controls/params/select">select</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/select/how-many">how-many</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/params/select/choice">choice</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of parameter-choice strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span></p>
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
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/params/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of part objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/prose">prose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of part objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object"></div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/controls/parts/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
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
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/controls/controls">controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of control objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object"></div>
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
               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups">groups</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
               <div class="model-container array">
                  <div class="OM-entry">
                     <p><span class="OM-lit">An array of group objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                     <div class="model-container object">
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <div class="OM-entry">
                           <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                        </div>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params">params</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of parameter objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/depends-on">depends-on</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/label">label</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/usage">usage</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params/constraints">constraints</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of parameter-constraint objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/constraints/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params/constraints/tests">tests</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p><span class="OM-lit">An array of test objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                         <div class="model-container object">
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/constraints/tests/expression">expression</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                            </div>
                                                            <div class="OM-entry">
                                                               <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/constraints/tests/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params/guidelines">guidelines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of parameter-guideline objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/guidelines/prose">prose</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-choices">
                                       <p class="OM-lit">A choice:</p>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params/values">values</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><span class="OM-lit">An array of parameter-value strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                       </div>
                                       <div class="OM-choice">
                                          <details class="OM-entry">
                                             <summary><a class="OM-name" href="../json-reference/#/catalog/groups/params/select">select</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/select/how-many">how-many</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <details class="OM-entry">
                                                   <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/params/select/choice">choice</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                   <div class="model-container array">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><span class="OM-lit">An array of parameter-choice strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span></p>
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
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/params/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }</span></p>
                              </div>
                           </div>
                           <p><span class="OM-lit">], </span></p>
                        </details>
                        <details class="OM-entry">
                           <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                           <div class="model-container array">
                              <div class="OM-entry">
                                 <p><span class="OM-lit">An array of part objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/prose">prose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of part objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object"></div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/parts/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
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
                           <p class="OM-lit">A choice:</p>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/groups">groups</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of group objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object"></div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                           </div>
                           <div class="OM-choice">
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls">controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of control objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/title">title</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params">params</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of parameter objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/id">id</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/depends-on">depends-on</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/label">label</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/usage">usage</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/constraints">constraints</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of parameter-constraint objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/constraints/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/constraints/tests">tests</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ]</span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p><span class="OM-lit">An array of test objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                                           <div class="model-container object">
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/constraints/tests/expression">expression</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                              </div>
                                                                              <div class="OM-entry">
                                                                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/constraints/tests/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
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
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/guidelines">guidelines</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of parameter-guideline objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/guidelines/prose">prose</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-choices">
                                                         <p class="OM-lit">A choice:</p>
                                                         <div class="OM-choice">
                                                            <details class="OM-entry">
                                                               <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/values">values</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                               <div class="model-container array">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><span class="OM-lit">An array of parameter-value strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit">], </span></p>
                                                            </details>
                                                         </div>
                                                         <div class="OM-choice">
                                                            <details class="OM-entry">
                                                               <summary><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/select">select</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }</span></span></summary>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/select/how-many">how-many</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <details class="OM-entry">
                                                                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/select/choice">choice</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                                     <div class="model-container array">
                                                                        <div class="OM-entry">
                                                                           <p class="OM-line"><span class="OM-lit">An array of parameter-choice strings</span> <span class="OM-cardinality">[0 to ∞]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span></p>
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
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/params/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                   </div>
                                                   <p><span class="OM-lit"> }</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit">], </span></p>
                                          </details>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of part objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/id">id</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                               </div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/prose">prose</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/parts">parts</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of part objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object"></div>
                                                               <p><span class="OM-lit"> }</span></p>
                                                            </div>
                                                         </div>
                                                         <p><span class="OM-lit">], </span></p>
                                                      </details>
                                                      <details class="OM-entry">
                                                         <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/links">links</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                                         <div class="model-container array">
                                                            <div class="OM-entry">
                                                               <p><span class="OM-lit">An array of link objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                               <div class="model-container object">
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/links/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/links/rel">rel</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/links/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                                  </div>
                                                                  <div class="OM-entry">
                                                                     <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/parts/links/text">text</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
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
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/groups/controls/controls">controls</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of control objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object"></div>
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
               <summary><a class="OM-name" href="../json-reference/#/catalog/back-matter">back-matter</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
               <div class="model-container object">
                  <details class="OM-entry">
                     <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources">resources</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                     <div class="model-container array">
                        <div class="OM-entry">
                           <p><span class="OM-lit">An array of resource objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                           <div class="model-container object">
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/uuid">uuid</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/title">title</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/description">description</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                              </div>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/document-ids">document-ids</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of document-id objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/document-ids/scheme">scheme</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/document-ids/identifier">identifier</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit"> }</span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit">], </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation">citation</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/text">text</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-line">markup-line</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <details class="OM-entry">
                                       <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/props">props</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                       <div class="model-container array">
                                          <div class="OM-entry">
                                             <p><span class="OM-lit">An array of property objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                             <div class="model-container object">
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/props/name">name</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/props/uuid">uuid</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uuid">uuid</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/props/ns">ns</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri">uri</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/props/value">value</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/props/class">class</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#ncname">NCName</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                                <div class="OM-entry">
                                                   <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/props/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
                                                </div>
                                             </div>
                                             <p><span class="OM-lit"> }</span></p>
                                          </div>
                                       </div>
                                       <p><span class="OM-lit">], </span></p>
                                    </details>
                                    <details class="OM-entry">
                                       <summary><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/citation/biblio">biblio</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                       <div class="model-container object"></div>
                                       <p><span class="OM-lit"> }, </span></p>
                                    </details>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <details class="OM-entry">
                                 <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/rlinks">rlinks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                 <div class="model-container array">
                                    <div class="OM-entry">
                                       <p><span class="OM-lit">An array of rlink objects</span>  <span class="OM-cardinality">[1 to ∞]</span><span class="OM-lit"> { </span></p>
                                       <div class="model-container object">
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/rlinks/href">href</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <div class="OM-entry">
                                             <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/rlinks/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                          </div>
                                          <details class="OM-entry">
                                             <summary><span class="sq"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/rlinks/hashes">hashes</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit"> [ <span class="show-closed">… ], </span></span></span></summary>
                                             <div class="model-container array">
                                                <div class="OM-entry">
                                                   <p><span class="OM-lit">An array of hash objects</span>  <span class="OM-cardinality">[0 to ∞]</span><span class="OM-lit"> { </span></p>
                                                   <div class="model-container object">
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/rlinks/hashes/algorithm">algorithm</a> <span class="OM-cardinality">[1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                                      </div>
                                                      <div class="OM-entry">
                                                         <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/rlinks/hashes/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
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
                                 <summary><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/base64">base64</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-lit">{<span class="show-closed"> … }, </span></span></summary>
                                 <div class="model-container object">
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/base64/filename">filename</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#uri-reference">uri-reference</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/base64/media-type">media-type</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#string">string</a></span><span class="OM-lit">,</span></p>
                                    </div>
                                    <div class="OM-entry">
                                       <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/base64/value">value</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#base64binary">base64Binary</a></span></p>
                                    </div>
                                 </div>
                                 <p><span class="OM-lit"> }, </span></p>
                              </details>
                              <div class="OM-entry">
                                 <p class="OM-line"><a class="OM-name" href="../json-reference/#/catalog/back-matter/resources/remarks">remarks</a> <span class="OM-cardinality">[0 or 1]</span>: <span class="OM-datatype"><a href="../../../datatypes/#markup-multiline">markup-multiline</a></span><span class="OM-lit">,</span></p>
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
</div>