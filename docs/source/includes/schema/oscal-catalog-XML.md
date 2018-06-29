<?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <style type="text/css">
html, body {  }

pre { color: darkgrey }
.tag { color: black; font-family: monospace; font-size: 80%; font-weight: bold }

.METASCHEMA { }

.title { }

.define-assembly,
.define-field,
.define-flag      { margin-top: 1ex; margin-bottom: 1ex; border: thin inset black; padding: 0.5em }

.define-assembly *,
.define-field    *,
.define-flag     *  { margin: 0em }

.define-assembly &gt; div { margin-top: 1em }

pre { padding: 0.5em; background-color: gainsboro }

.define-assembly { }

.define-field { }

.define-flag { }

.flag { }

.formal-name { font-size: 120%; font-weight: bold; font-family: sans-serif; margin: 0.5em 0em }

.description { font-size: 90%; font-family: sans-serif; margin: 0.5em 0em }

.remarks { }

.remarks p { margin-top: 0.5em }
// .remarks &gt; p:first-child { margin-top: 0em }

.model { margin-top: 1em }

.field { }

.fields { }

.assembly { }

.assemblies { }

.choice { }

.example { margin-top: 1em }

.prose { }


.p { }

.code {  display: inline; }
.q {  display: inline; }
.em {  display: inline; }
.strong {  display: inline; }

.name { color: midnightblue; background-color: lavender;
        font-family: monospace; font-size: 90% }

a { text-decoration:none }
a:hover { text-decoration: underline }


</style>
   </head>
   <body>
      <div class="METASCHEMA">
         <h2 class="title">OSCAL Control Catalog Format: XML Schema</h2>
         <p>The short name (file identifier) for this schema shall be <i>oscal-catalog</i>. It is used internally when an
         identifier is called for, and may appear in file names of schema artifacts.</p>
         <div class="remarks">
            <p class="p">The OSCAL Control Catalog format can be used to describe a collection of security controls and related sub-controls, along with a variety of control metadata. The root of the Control Catalog format is <a href="#catalog" class="name">&lt;catalog&gt;</a>.</p>
            <p class="p">An XML Schema is provided for the OSCAL Catalog XML model.</p>
         </div>
         <div class="define-assembly" id="catalog">
            <h3>
               <b class="formal-name">Catalog</b>:
            <code class="name">&lt;catalog&gt;</code> element</h3>
            <p class="description">A collection of controls</p>
            <div class="model">
               <p>The <code class="name">&lt;catalog&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a>
                     <i> (required)</i>
                  </li>
                  <li>Attribute <a href="#model-version" class="name">
                        <code class="name">@model-version</code>
                     </a>
                     <i> (required)</i>
                  </li>
                  <li>A <a class="name" href="#title">
                        <code class="name">&lt;title&gt;</code>
                     </a> element  (<i>one</i>)</li>
                  <li>A <a class="name" href="#declarations">
                        <code class="name">&lt;declarations&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
                  <li>A <a class="name" href="#references">
                        <code class="name">&lt;references&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#section">
                        <code class="name">&lt;section&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="choice">A choice between
         <ul>
                        <li class="assemblies">
                           <a class="name" href="#group">
                              <code class="name">&lt;group&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#control">
                              <code class="name">&lt;control&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                     </ul>
                  </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Catalogs may use <a href="#section" class="name">&lt;section&gt;</a> to subdivide the textual contents of a catalog.</p>
            </div>
            <blockquote class="description">
               <p>A small catalog with a single control</p>
            </blockquote>
            <pre class="xml">
               <code class="tag">&lt;catalog id="simple-example" model-version="0.99"&gt;</code>
               <code class="tag">&lt;title&gt;</code>A Miniature Catalog<code class="tag">&lt;/title&gt;</code>
               <code class="tag">&lt;control id="single"&gt;</code>
               <code class="tag">&lt;title&gt;</code>A Single Control<code class="tag">&lt;/title&gt;</code>
               <code class="tag">&lt;/control&gt;</code>
               <code class="tag">&lt;/catalog&gt;</code>
            </pre>
         </div>
         <div class="define-field" id="declarations">
            <h3>
               <b class="formal-name">Declarations</b>:
            <code class="name">&lt;declarations&gt;</code> element</h3>
            <p class="description">Either a reference to a declarations file, or a set of declarations</p>
            <div class="model">
               <p>The <code class="name">&lt;declarations&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#href" class="name">
                        <code class="name">@href</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="section">
            <h3>
               <b class="formal-name">Section</b>:
            <code class="name">&lt;section&gt;</code> element</h3>
            <p class="description">Allows the inclusion of prose content within a Catalog.</p>
            <div class="model">
               <p>The <code class="name">&lt;section&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#class" class="name">
                        <code class="name">@class</code>
                     </a> (<i>optional</i>)</li>
                  <li>A <a class="name" href="#title">
                        <code class="name">&lt;title&gt;</code>
                     </a> element  (<i>one</i>)</li>
                  <li class="prose">Prose contents (paragraphs and lists)</li>
                  <li class="assemblies">
                     <a class="name" href="#section">
                        <code class="name">&lt;section&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li>A <a class="name" href="#references">
                        <code class="name">&lt;references&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="group">
            <h3>
               <b class="formal-name">Control Group</b>:
            <code class="name">&lt;group&gt;</code> element</h3>
            <p class="description">A group of controls, or of groups of controls.</p>
            <div class="model">
               <p>The <code class="name">&lt;group&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#class" class="name">
                        <code class="name">@class</code>
                     </a> (<i>optional</i>)</li>
                  <li>A <a class="name" href="#title">
                        <code class="name">&lt;title&gt;</code>
                     </a> element  (<i>one</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#param">
                        <code class="name">&lt;param&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#prop">
                        <code class="name">&lt;prop&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#part">
                        <code class="name">&lt;part&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="choice">A choice between
         <ul>
                        <li class="assemblies">
                           <a class="name" href="#group">
                              <code class="name">&lt;group&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#control">
                              <code class="name">&lt;control&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                     </ul>
                  </li>
                  <li>A <a class="name" href="#references">
                        <code class="name">&lt;references&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Catalogs can use groups to provide collections of related controls or Control Groups. A <a href="#group" class="name">&lt;group&gt;</a> may have its own properties, statements, parameters, and references, which are inherited by all members of that group. Unlike a <a href="#section" class="name">&lt;section&gt;</a>, a <a href="#group" class="name">&lt;group&gt;</a> may not contain arbitrary prose directly, only inside its <a href="#part" class="name">&lt;part&gt;</a> or <a href="#control" class="name">&lt;control&gt;</a> components.</p>
            </div>
            <pre class="xml">
               <code class="tag">&lt;group id="xyz"&gt;</code>
               <code class="tag">&lt;title&gt;</code>My Group<code class="tag">&lt;/title&gt;</code>
               <code class="tag">&lt;prop class="required"&gt;</code>some property<code class="tag">&lt;/prop&gt;</code>
               <code class="tag">&lt;control id="xyz1"&gt;</code>
               <code class="tag">&lt;title&gt;</code>Control<code class="tag">&lt;/title&gt;</code>
               <code class="tag">&lt;/control&gt;</code>
               <code class="tag">&lt;/group&gt;</code>
            </pre>
         </div>
         <div class="define-assembly" id="control">
            <h3>
               <b class="formal-name">Control</b>:
            <code class="name">&lt;control&gt;</code> element</h3>
            <p class="description">A structured information object representing a security or privacy control. Each security or privacy control within the Catalog is defined by a distinct control instance.</p>
            <div class="model">
               <p>The <code class="name">&lt;control&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a>
                     <i> (required)</i>
                  </li>
                  <li>Attribute <a href="#class" class="name">
                        <code class="name">@class</code>
                     </a> (<i>optional</i>)</li>
                  <li>A <a class="name" href="#title">
                        <code class="name">&lt;title&gt;</code>
                     </a> element  (<i>one</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#param">
                        <code class="name">&lt;param&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#prop">
                        <code class="name">&lt;prop&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#link">
                        <code class="name">&lt;link&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#part">
                        <code class="name">&lt;part&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#subcontrol">
                        <code class="name">&lt;subcontrol&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li>A <a class="name" href="#references">
                        <code class="name">&lt;references&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Controls may be grouped using <a href="#group" class="name">&lt;group&gt;</a>, and controls may be partitioned using
        <a href="#part" class="name">&lt;part&gt;</a> or enhanced using <a href="#subcontrol" class="name">&lt;subcontrol&gt;</a>.</p>
            </div>
            <pre class="xml">
               <code class="tag">&lt;control id="x"&gt;</code>
               <code class="tag">&lt;title&gt;</code>Control 1<code class="tag">&lt;/title&gt;</code>
               <code class="tag">&lt;/control&gt;</code>
            </pre>
         </div>
         <div class="define-assembly" id="subcontrol">
            <h3>
               <b class="formal-name">Sub-Control</b>:
            <code class="name">&lt;subcontrol&gt;</code> element</h3>
            <p class="description">A control extension or enhancement</p>
            <div class="model">
               <p>The <code class="name">&lt;subcontrol&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a>
                     <i> (required)</i>
                  </li>
                  <li>Attribute <a href="#class" class="name">
                        <code class="name">@class</code>
                     </a> (<i>optional</i>)</li>
                  <li>A <a class="name" href="#title">
                        <code class="name">&lt;title&gt;</code>
                     </a> element  (<i>one</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#param">
                        <code class="name">&lt;param&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#prop">
                        <code class="name">&lt;prop&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#link">
                        <code class="name">&lt;link&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#part">
                        <code class="name">&lt;part&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li>A <a class="name" href="#references">
                        <code class="name">&lt;references&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-field" id="title">
            <h3>
               <b class="formal-name">Title</b>:
            <code class="name">&lt;title&gt;</code> element</h3>
            <p>Supports inline encoding</p>
            <p class="description">A title for display and navigation, exclusive of more specific properties</p>
         </div>
         <div class="define-field" id="prop">
            <h3>
               <b class="formal-name">Property</b>:
            <code class="name">&lt;prop&gt;</code> element</h3>
            <p class="description">A value with a name, attributed to the containing control, subcontrol, part,
          or group.</p>
            <div class="model">
               <p>The <code class="name">&lt;prop&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#class" class="name">
                        <code class="name">@class</code>
                     </a>
                     <i> (required)</i>
                  </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls, parts, and extensions), for any purpose useful to an application or implementation of those controls. Typically, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.</p>
               <p class="p">The value of a property is a
        simple scalar value or list of values.</p>
               <p class="p">The lexical composition of properties may be constrained by declarations including matching
        to regular expressions or by declaring a known datatype.</p>
               <p class="p">Because properties are often used as selectors or identifiers for OSCAL operations, their
        values can be expected frequently to be normalized (e.g., with respect to whitespace) in
        use; however, this is application defined.</p>
               <p class="p">For singletons (that is, the only element among siblings with its <a href="#class" class="name">&lt;class&gt;</a>),
        properties are especially useful as proxies (unique identifiers) for their controls, such
        that controls may be returned one for one on queries for properties (name and value). The
        robustness of such queries can be ensured by appropriate property declarations (as
        singletons and as identifiers); cf <code>declare-prop</code> in the declarations model
        (which also supports other constraints over property values).</p>
            </div>
            <pre class="xml">
               <code class="tag">&lt;o:prop class="name"&gt;</code>A1<code class="tag">&lt;/o:prop&gt;</code>
            </pre>
         </div>
         <div class="define-assembly" id="param">
            <h3>
               <b class="formal-name">Parameter</b>:
            <code class="name">&lt;param&gt;</code> element</h3>
            <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
            <div class="model">
               <p>The <code class="name">&lt;param&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a>
                     <i> (required)</i>
                  </li>
                  <li>Attribute <a href="#class" class="name">
                        <code class="name">@class</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#depends-on" class="name">
                        <code class="name">@depends-on</code>
                     </a> (<i>optional</i>)</li>
                  <li>A <a class="name" href="#label">
                        <code class="name">&lt;label&gt;</code>
                     </a> element  (<i>zero or one</i>): A short name for the parameter.<br class="br"/>The label value should be suitable for inline display in a rendered catalog.</li>
                  <li class="assemblies">
                     <a class="name" href="#desc">
                        <code class="name">&lt;desc&gt;</code>
                     </a> elements (<i>zero or more</i>): A short summary of the parameter's intended use.<br class="br"/> A label is optional, but should be provided unless a <a href="#select" class="name">&lt;select&gt;</a> (selection) is provided.</li>
                  <li class="assemblies">
                     <a class="name" href="#constraint">
                        <code class="name">&lt;constraint&gt;</code>
                     </a> elements (<i>zero or more</i>): A rule describing the permissible parameter values.<br class="br"/>Currently, OSCAL does not standardize any formal rules language for value constraints. A <a href="#test" class="name">&lt;test&gt;</a> option may be used to specify a formal rule that may be automatically used if recognized by an OSCAL tool. Further development is needed to support the declaration of a rule language and value.</li>
                  <li class="assemblies">
                     <a class="name" href="#guideline">
                        <code class="name">&lt;guideline&gt;</code>
                     </a> elements (<i>zero or more</i>): Additional recommendations for the use of the parameter, or around what values should be provided.</li>
                  <li class="choice">A choice between
         <ul>
                        <li>A <a class="name" href="#value">
                              <code class="name">&lt;value&gt;</code>
                           </a> element  (<i>zero or one</i>): A recommended parameter value or set of values.<br class="br"/>A value provided in a catalog can be redefined at any higher layer of OSCAL (e.g., Profile).</li>
                        <li>A <a class="name" href="#select">
                              <code class="name">&lt;select&gt;</code>
                           </a> element  (<i>zero or one</i>): A set of parameter value choices, that may be picked from to set the parameter value.<br class="br"/>.</li>
                     </ul>
                  </li>
                  <li class="assemblies">
                     <a class="name" href="#link">
                        <code class="name">&lt;link&gt;</code>
                     </a> elements (<i>zero or more</i>): </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">In a catalog, a parameter is typically used as a placeholder for the future assignment of a parameter value, although the OSCAL model allows for the direct assignment of a value if desired by the control author. The <a href="#value" class="name">&lt;value&gt;</a> may be optionally used to specify one or more values. If no value is provided, then it is expected that the value will be provided at the Profile or Implementation layer.</p>
               <p class="p">A parameter can include a variety of metadata options that support the future solicitation of one or more values. A <a href="#label" class="name">&lt;label&gt;</a> provides a textual placeholder that can be used in a tool to solicit parameter value input, or to display in catalog documentation. The <a href="#desc" class="name">&lt;desc&gt;</a> provides a short description of what the parameter is used for, which can be used in tooling to help a user understand how to use the parameter. A <a href="#constraint" class="name">&lt;constraint&gt;</a> can be used to provide criteria for the allowed values. A <a href="#guideline" class="name">&lt;guideline&gt;</a> provides a recommendation for the use of a parameter.</p>
            </div>
         </div>
         <div class="define-field" id="label">
            <h3>
               <b class="formal-name">Parameter label</b>:
            <code class="name">&lt;label&gt;</code> element</h3>
            <p>Supports inline encoding</p>
            <p class="description">A placeholder for a missing value, in display.</p>
         </div>
         <div class="define-field" id="desc">
            <h3>
               <b class="formal-name">Parameter description</b>:
            <code class="name">&lt;desc&gt;</code> element</h3>
            <p>Supports inline encoding</p>
            <p class="description">Indicates and explains the purpose and use of a parameter</p>
            <div class="model">
               <p>The <code class="name">&lt;desc&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-field" id="constraint">
            <h3>
               <b class="formal-name">Constraint</b>:
            <code class="name">&lt;constraint&gt;</code> element</h3>
            <p class="description">A formal or informal expression of a constraint or test</p>
            <div class="model">
               <p>The <code class="name">&lt;constraint&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#test" class="name">
                        <code class="name">@test</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="guideline">
            <h3>
               <b class="formal-name">Guideline</b>:
            <code class="name">&lt;guideline&gt;</code> element</h3>
            <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
            <div class="model">
               <p>The <code class="name">&lt;guideline&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li class="prose">Prose contents (paragraphs and lists)</li>
               </ul>
            </div>
         </div>
         <div class="define-field" id="value">
            <h3>
               <b class="formal-name">Value constraint</b>:
            <code class="name">&lt;value&gt;</code> element</h3>
            <p>Supports inline encoding</p>
            <p class="description">Indicates a permissible value for a parameter or property</p>
            <div class="remarks">
               <p class="p">In a declaration, <a href="#value" class="name">&lt;value&gt;</a> will commonly be given in groups, indicating a set of
        enumerated permissible values (i.e., for an element to be valid to a value constraint, it
        must equal one of the given values).</p>
               <p class="p">In a parameter, a value represents a value assignment to the parameter, overriding any
        value given at the point of insertion. When parameters are provided in OSCAL profiles, their
        values will override any values assigned <q>lower down the stack</q>.</p>
            </div>
         </div>
         <div class="define-assembly" id="select">
            <h3>
               <b class="formal-name">Selection</b>:
            <code class="name">&lt;select&gt;</code> element</h3>
            <p class="description">Presenting a choice among alternatives</p>
            <div class="model">
               <p>The <code class="name">&lt;select&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#how-many" class="name">
                        <code class="name">@how-many</code>
                     </a> (<i>optional</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#choice">
                        <code class="name">&lt;choice&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-field" id="choice">
            <h3>
               <b class="formal-name">Choice</b>:
            <code class="name">&lt;choice&gt;</code> element</h3>
            <p>Supports inline encoding</p>
            <p class="description">A value selection among several such options</p>
         </div>
         <div class="define-assembly" id="part">
            <h3>
               <b class="formal-name">Part</b>:
            <code class="name">&lt;part&gt;</code> element</h3>
            <p class="description">A partition or component of a control, subcontrol or part</p>
            <div class="model">
               <p>The <code class="name">&lt;part&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#class" class="name">
                        <code class="name">@class</code>
                     </a> (<i>optional</i>)</li>
                  <li>A <a class="name" href="#title">
                        <code class="name">&lt;title&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#prop">
                        <code class="name">&lt;prop&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="prose">Prose contents (paragraphs and lists)</li>
                  <li class="assemblies">
                     <a class="name" href="#part">
                        <code class="name">&lt;part&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#link">
                        <code class="name">&lt;link&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Like properties (<a href="#prop" class="name">&lt;prop&gt;</a>) and parameters (<a href="#param" class="name">&lt;param&gt;</a>), parts can be
        distinguished from other elements within their controls by their assigned
        <a href="#class" class="name">&lt;class&gt;</a>, such that they may be subjected to <q>declarations logic</q> using
        these values as bindings (and thereby getting open-ended extensibility).</p>
               <p class="p">An assigned class may frequently provide for a header in display, such that
        <a href="#part" class="name">&lt;part&gt;</a>
                  <code>[@class='objectives']</code> is displayed under a header <em>Objectives</em>, etc.
        Parts may also however have their own titles (<a href="#title" class="name">&lt;title&gt;</a> elements).</p>
               <p class="p">Many parts are logical partitions or sections for prose. Other parts may be more formally
        constructed out of properties (<a href="#prop" class="name">&lt;prop&gt;</a> elements) and/or their own parts. Such
        structured objects may, at the extreme, function virtually as control extensions or
        subcontrol-like objects (<q>enhancements</q>).</p>
            </div>
         </div>
         <div class="define-field" id="link">
            <h3>
               <b class="formal-name">Link</b>:
            <code class="name">&lt;link&gt;</code> element</h3>
            <p>Supports inline encoding</p>
            <p class="description">
        A line or paragraph with a hypertext link
      </p>
            <div class="model">
               <p>The <code class="name">&lt;link&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#href" class="name">
                        <code class="name">@href</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#rel" class="name">
                        <code class="name">@rel</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Works like an HTML anchor (<code>a</code>) except this is a line-oriented (block)
        element.</p>
            </div>
         </div>
         <div class="define-assembly" id="references">
            <h3>
               <b class="formal-name">References</b>:
            <code class="name">&lt;references&gt;</code> element</h3>
            <p class="description">
        A group of reference descriptions
      </p>
            <div class="model">
               <p>The <code class="name">&lt;references&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#link">
                        <code class="name">&lt;link&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#ref">
                        <code class="name">&lt;ref&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="ref">
            <h3>
               <b class="formal-name">Reference</b>:
            <code class="name">&lt;ref&gt;</code> element</h3>
            <p class="description">
        A reference, with one or more citations to standards, related documents, or other
          resources
      </p>
            <div class="model">
               <p>The <code class="name">&lt;ref&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#citation">
                        <code class="name">&lt;citation&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="prose">Prose contents (paragraphs and lists)</li>
               </ul>
            </div>
         </div>
         <div class="define-field" id="citation">
            <h3>
               <b class="formal-name">Citation</b>:
            <code class="name">&lt;citation&gt;</code> element</h3>
            <p>Supports inline encoding</p>
            <p class="description">Citation of a resource</p>
            <div class="model">
               <p>The <code class="name">&lt;citation&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#id" class="name">
                        <code class="name">@id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#href" class="name">
                        <code class="name">@href</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Semantics of any contents within citation are implicit, not encoded. To mitigate problems establishin
        matches with bibliograpical databases, it is recommended a canonical
      identifier such as a DOI be provided for any citation.</p>
            </div>
            <pre class="xml">
               <code class="tag">&lt;o:citation&gt;</code>Some <code class="tag">&lt;o:strong&gt;</code>citation<code class="tag">&lt;/o:strong&gt;</code> of some sort<code class="tag">&lt;/o:citation&gt;</code>
            </pre>
         </div>
         <div class="define-flag" id="id">
            <h3>
               <b class="formal-name">ID / identifier</b>:
            <code class="name">@id</code> attribute</h3>
            <p class="description">Unique identifier</p>
            <div class="remarks">
               <p class="p">No mechanism is proposed to ensure that <a href="#id" class="name">&lt;id&gt;</a> values do not collide across
        different catalogs. Use profiling without <q>merge</q> to detect such clashes.</p>
            </div>
            <pre class="xml">
               <code class="tag">&lt;o:citation id="xyz2"&gt;</code>Some <code class="tag">&lt;o:strong&gt;</code>citation<code class="tag">&lt;/o:strong&gt;</code> of some sort<code class="tag">&lt;/o:citation&gt;</code>
            </pre>
         </div>
         <div class="define-flag" id="class">
            <h3>
               <b class="formal-name">Class</b>:
            <code class="name">@class</code> attribute</h3>
            <p class="description">Identifies the property or object within the control; a semantic hint</p>
            <div class="remarks">
               <p class="p">Overloading this attribute with more than one value is permitted, but not recommended.</p>
            </div>
         </div>
         <div class="define-flag" id="href">
            <h3>
               <b class="formal-name">hypertext reference</b>:
            <code class="name">@href</code> attribute</h3>
            <p class="description">A link to a document or document fragment (actual, nominal or projected)</p>
            <div class="remarks">
               <p class="p">Note in particular that <a href="#href" class="name">&lt;href&gt;</a> targets include elements (locations) in
        representations of documents that exist only by virtue of dynamic application, such as (for
        example) the results of profile resolution.</p>
            </div>
         </div>
         <div class="define-flag" id="test">
            <h3>
               <b class="formal-name">Constraint test</b>:
            <code class="name">@test</code> attribute</h3>
            <p class="description">A formal (executable) expression of a constraint</p>
         </div>
         <div class="define-flag" id="rel">
            <h3>
               <b class="formal-name">Relation</b>:
            <code class="name">@rel</code> attribute</h3>
            <p class="description">Purpose of the link</p>
         </div>
         <div class="define-flag" id="how-many">
            <h3>
               <b class="formal-name">Cardinality</b>:
            <code class="name">@how-many</code> attribute</h3>
            <p class="description">When selecting, a requirement such as one or more</p>
         </div>
         <div class="define-flag" id="depends-on">
            <h3>
               <b class="formal-name">Depends on</b>:
            <code class="name">@depends-on</code> attribute</h3>
            <p class="description">Another parameter invoking this one</p>
         </div>
         <div class="define-flag" id="model-version">
            <h3>
               <b class="formal-name">Model version</b>:
            <code class="name">@model-version</code> attribute</h3>
            <p class="description">Declares a major/minor version for this metaschema</p>
         </div>
      </div>
   </body>
</html>
