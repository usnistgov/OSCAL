<?xml version="1.0" encoding="UTF-8"?><html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <style type="text/css">
         html,
         body {
         }
         
         pre {
             color: darkgrey
         }
         .tag {
             color: black;
             font-family: monospace;
             font-size: 80%;
             font-weight: bold
         }
         
         pre.json {
             color: darkblue
         }
         
         .METASCHEMA {
         }
         
         .title {
         }
         
         .define-assembly,
         .define-field,
         .define-flag {
             margin-top: 1ex;
             margin-bottom: 1ex;
             border: thin inset black;
             padding: 0.5em
         }
         
         .define-assembly *,
         .define-field *,
         .define-flag * {
             margin: 0em
         }
         
         
         pre {
             padding: 0.5em;
             background-color: gainsboro
         }
         
         .define-assembly {
         }
         
         .define-field {
         }
         
         .define-flag {
         }
         
         .flag {
         }
         
         .formal-name {
             font-size: 120%;
             font-weight: bold;
             font-family: sans-serif;
             margin: 0.5em 0em
         }
         
         .description {
             font-size: 90%;
             font-family: sans-serif;
             margin: 0.5em 0em
         }
         
         .remarks {
         }
         
         .remarks p {
             margin-top: 0.5em
         }
         // .remarks &gt; p:first-child { margin-top: 0em }
         
         .model {
             margin-top: 1em
         }
         
         .field {
         }
         
         .fields {
         }
         
         .assembly {
         }
         
         .assemblies {
         }
         
         .choice {
         }
         
         .example {
             margin-top: 1em
         }
         
         .prose {
         }
         
         
         .p {
         }
         
         .code {
             display: inline;
         }
         .q {
             display: inline;
         }
         .em {
             display: inline;
         }
         .strong {
             display: inline;
         }
         
         .name {
             color: midnightblue;
             background-color: lavender;
             font-family: monospace;
             font-size: 90%
         }
         
         a {
             text-decoration: none
         }
         a:hover {
             text-decoration: underline
         }
         
         ul.e_map {
             font-family: monospace;
             list-style-type: none
         }
         li.e_map {
             margin: 0em
         }
         .map_label {
             font-family: serif;
             color: darkgrey
         }</style>
   </head>
   <body>
      <div class="METASCHEMA">
         <h2>OSCAL Control Catalog Format: Schema Reference</h2>
         <p>The short name (file identifier) for this schema shall be <i>oscal-catalog</i>. It is used internally when an
            identifier is called for, and may appear in file names of schema artifacts.</p>
         <p>The XML namespace for elements conformant to this schema:
            <code>http://csrc.nist.gov/ns/oscal/1.0</code></p>
         <div class="remarks">
            <p class="p">The OSCAL Control Catalog format can be used to describe a collection of security
               controls and related sub-controls, along with a variety of control metadata. The root
               of the Control Catalog format is <code>catalog</code>.</p>
            <p class="p">An XML Schema is provided for the OSCAL Catalog XML model.</p>
         </div>
         <h5>The root object (element) of this schema is <a href="#catalog"><code>catalog</code></a></h5>
         <div class="definition define-assembly" id="catalog">
            <header>
               <h4 id="oscal-catalog-xml_catalog" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Catalog</b>: <code>catalog</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_catalog"><button>JSON</button></a></div>
            </header>
            <p class="description">A collection of controls</p>
            <div class="model">
               <p class="usa-font-lead">The <code>catalog</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute <i> (required)</i></li>
                  <li><a href="#model-version"><code>model-version</code></a> attribute <i> (required)</i></li>
                  <li><a href="#title"><code>title</code></a> element  (<i>one</i>)</li>
                  <li><a href="#metadata"><code>metadata</code></a> element  (<i>zero or one</i>)</li>
                  <li><a href="#section"><code>section</code></a> element  (<i>zero or more</i>)</li>
                  <li class="choice">A choice between
                     
                     <ul>
                        <li><a href="#group"><code>group</code></a> element  (<i>zero or more</i>)</li>
                        <li><a href="#control"><code>control</code></a> element  (<i>zero or more</i>)</li>
                     </ul>
                  </li>
                  <li><a href="#back"><code>back</code></a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Catalogs may use <code>section</code> to subdivide the textual contents of a catalog.</p>
            </div>
            <ul class="usa-accordion-bordered">
               <li><button class="usa-accordion-button" aria-expanded="true" aria-controls="catalog_example1_xml">Example: A small catalog with a single control</button><div id="catalog_example1_xml" class="usa-accordion-content">
                     <pre>
&lt;catalog id="simple-example" model-version="0.99"&gt;
&lt;title&gt;A Miniature Catalog&lt;/title&gt;
&lt;control id="single"&gt;
&lt;title&gt;A Single Control&lt;/title&gt;&lt;/control&gt;&lt;/catalog&gt;</pre>
                  </div>
               </li>
            </ul>
         </div>
         <div class="definition define-assembly" id="back">
            <header>
               <h4 id="oscal-catalog-xml_back" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Assets</b>: <code>back</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_back"><button>JSON</button></a></div>
            </header>
            <p class="description">References, resources and attachments</p>
            <div class="model">
               <p class="usa-font-lead">The <code>back</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#ref-list"><code>ref-list</code></a> element  (<i>zero or one</i>)</li>
                  <li><a href="#resource"><code>resource</code></a> element  (<i>zero or more</i>)</li>
               </ul>
            </div>
            <p>This element appears inside: <a href="#catalog">catalog</a>.</p>
         </div>
         <div class="definition define-assembly" id="section">
            <header>
               <h4 id="oscal-catalog-xml_section" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Section</b>: <code>section</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_section"><button>JSON</button></a></div>
            </header>
            <p class="description">Allows the inclusion of prose content within a Catalog.</p>
            <div class="model">
               <p class="usa-font-lead">The <code>section</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#class"><code>class</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#title"><code>title</code></a> element  (<i>one</i>)</li>
                  <li class="prose">Prose contents (paragraphs and lists)</li>
                  <li><a href="#section"><code>section</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#ref-list"><code>ref-list</code></a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <p>This element appears inside: <a href="#catalog">catalog</a>, <a href="#section">section</a>.</p>
         </div>
         <div class="definition define-assembly" id="group">
            <header>
               <h4 id="oscal-catalog-xml_group" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Control Group</b>: <code>group</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_group"><button>JSON</button></a></div>
            </header>
            <p class="description">A group of controls, or of groups of controls.</p>
            <div class="model">
               <p class="usa-font-lead">The <code>group</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#class"><code>class</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#title"><code>title</code></a> element  (<i>one</i>)</li>
                  <li><a href="#param"><code>param</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#prop"><code>prop</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#part"><code>part</code></a> element  (<i>zero or more</i>)</li>
                  <li class="choice">A choice between
                     
                     <ul>
                        <li><a href="#group"><code>group</code></a> element  (<i>zero or more</i>)</li>
                        <li><a href="#control"><code>control</code></a> element  (<i>zero or more</i>)</li>
                     </ul>
                  </li>
                  <li><a href="#ref-list"><code>ref-list</code></a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Catalogs can use groups to provide collections of related controls or Control Groups.
                  A <code>group</code> may have its own properties, statements, parameters, and references, which are inherited
                  by all members of that group. Unlike a <code>section</code>, a <code>group</code> may not contain arbitrary prose directly, only inside its <code>part</code> or <code>control</code> components.</p>
            </div>
            <ul class="usa-accordion-bordered">
               <li><button class="usa-accordion-button" aria-expanded="true" aria-controls="group_example1_xml">Example</button><div id="group_example1_xml" class="usa-accordion-content">
                     <pre>
&lt;group id="xyz"&gt;
&lt;title&gt;My Group&lt;/title&gt;
&lt;prop class="required"&gt;some property&lt;/prop&gt;
&lt;control id="xyz1"&gt;
&lt;title&gt;Control&lt;/title&gt;&lt;/control&gt;&lt;/group&gt;</pre>
                  </div>
               </li>
            </ul>
            <p>This element appears inside: <a href="#catalog">catalog</a>, <a href="#group">group</a>.</p>
         </div>
         <div class="definition define-assembly" id="control">
            <header>
               <h4 id="oscal-catalog-xml_control" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Control</b>: <code>control</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_control"><button>JSON</button></a></div>
            </header>
            <p class="description">A structured information object representing a security or privacy control. Each security
               or privacy control within the Catalog is defined by a distinct control instance.</p>
            <div class="model">
               <p class="usa-font-lead">The <code>control</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute <i> (required)</i></li>
                  <li><a href="#class"><code>class</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#title"><code>title</code></a> element  (<i>one</i>)</li>
                  <li><a href="#param"><code>param</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#prop"><code>prop</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#link"><code>link</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#part"><code>part</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#subcontrol"><code>subcontrol</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#ref-list"><code>ref-list</code></a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Controls may be grouped using <code>group</code>, and controls may be partitioned using
                  <code>part</code> or enhanced using <code>subcontrol</code>.</p>
            </div>
            <ul class="usa-accordion-bordered">
               <li><button class="usa-accordion-button" aria-expanded="true" aria-controls="control_example1_xml">Example</button><div id="control_example1_xml" class="usa-accordion-content">
                     <pre>
&lt;control id="x"&gt;
&lt;title&gt;Control 1&lt;/title&gt;&lt;/control&gt;</pre>
                  </div>
               </li>
            </ul>
            <p>This element appears inside: <a href="#catalog">catalog</a>, <a href="#group">group</a>.</p>
         </div>
         <div class="definition define-assembly" id="subcontrol">
            <header>
               <h4 id="oscal-catalog-xml_subcontrol" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Sub-Control</b>: <code>subcontrol</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_subcontrol"><button>JSON</button></a></div>
            </header>
            <p class="description">A control extension or enhancement</p>
            <div class="model">
               <p class="usa-font-lead">The <code>subcontrol</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute <i> (required)</i></li>
                  <li><a href="#class"><code>class</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#title"><code>title</code></a> element  (<i>one</i>)</li>
                  <li><a href="#param"><code>param</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#prop"><code>prop</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#link"><code>link</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#part"><code>part</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#ref-list"><code>ref-list</code></a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <p>This element appears inside: <a href="#control">control</a>.</p>
         </div>
         <div class="definition define-field" id="title">
            <header>
               <h4 id="oscal-catalog-xml_title" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Title</b>: <code>title</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_title"><button>JSON</button></a></div>
            </header>
            <p>Supports inline encoding</p>
            <p class="description">A title for display and navigation, exclusive of more specific properties</p>
            <p>This element appears inside: <a href="#catalog">catalog</a>, <a href="#section">section</a>, <a href="#group">group</a>, <a href="#control">control</a>, <a href="#subcontrol">subcontrol</a>, <a href="#part">part</a>.</p>
         </div>
         <div class="definition define-field" id="prop">
            <header>
               <h4 id="oscal-catalog-xml_prop" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Property</b>: <code>prop</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_prop"><button>JSON</button></a></div>
            </header>
            <p class="description">A value with a name, attributed to the containing control, subcontrol, part,
               or group.</p>
            <div class="model">
               <p>The prop element may have attributes</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#class"><code>class</code></a> attribute <i> (required)</i></li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Properties permit the deployment and management of arbitrary controlled values, with
                  and among control objects (controls, parts, and extensions), for any purpose useful
                  to an application or implementation of those controls. Typically, properties will
                  be used to sort, select, order, and arrange controls or relate them to one another
                  or to class hierarchies, taxonomies, or external authorities.</p>
               <p class="p">The value of a property is a
                  simple scalar value or list of values.</p>
               <p class="p">The lexical composition of properties may be constrained by declarations including
                  matching
                  to regular expressions or by declaring a known datatype.</p>
               <p class="p">Because properties are often used as selectors or identifiers for OSCAL operations,
                  their
                  values can be expected frequently to be normalized (e.g., with respect to whitespace)
                  in
                  use; however, this is application defined.</p>
               <p class="p">For singletons (that is, the only element among siblings with its <code>class</code>),
                  properties are especially useful as proxies (unique identifiers) for their controls,
                  such
                  that controls may be returned one for one on queries for properties (name and value).
                  The
                  robustness of such queries can be ensured by appropriate property declarations (as
                  singletons and as identifiers); cf <code>declare-prop</code> in the declarations model
                  (which also supports other constraints over property values).</p>
            </div>
            <ul class="usa-accordion-bordered">
               <li><button class="usa-accordion-button" aria-expanded="true" aria-controls="prop_example1_xml">Example</button><div id="prop_example1_xml" class="usa-accordion-content">
                     <pre>
&lt;prop class="name"&gt;A1&lt;/prop&gt;</pre>
                  </div>
               </li>
            </ul>
            <p>This element appears inside: <a href="#group">group</a>, <a href="#control">control</a>, <a href="#subcontrol">subcontrol</a>, <a href="#part">part</a>.</p>
         </div>
         <div class="definition define-assembly" id="param">
            <header>
               <h4 id="oscal-catalog-xml_param" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Parameter</b>: <code>param</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_param"><button>JSON</button></a></div>
            </header>
            <p class="description">Parameters provide a mechanism for the dynamic assignment of value(s) in a control.</p>
            <div class="model">
               <p class="usa-font-lead">The <code>param</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute <i> (required)</i></li>
                  <li><a href="#class"><code>class</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#depends-on"><code>depends-on</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#label"><code>label</code></a> element  (<i>zero or one</i>): A short name for the parameter.<br />The label value should be suitable for inline display in a rendered catalog.</li>
                  <li><a href="#desc"><code>desc</code></a> element  (<i>zero or more</i>): A short summary of the parameter's intended use.<br /> A label is optional, but should be provided unless a <code>select</code> (selection) is provided.</li>
                  <li><a href="#constraint"><code>constraint</code></a> element  (<i>zero or more</i>): A rule describing the permissible parameter values.<br />Currently, OSCAL does not standardize any formal rules language for value constraints.
                     A <code>test</code> option may be used to specify a formal rule that may be automatically used if recognized
                     by an OSCAL tool. Further development is needed to support the declaration of a rule language and value.</li>
                  <li><a href="#guideline"><code>guideline</code></a> element  (<i>zero or more</i>): Additional recommendations for the use of the parameter, or around what values should
                     be provided.</li>
                  <li class="choice">A choice between
                     
                     <ul>
                        <li><a href="#value"><code>value</code></a> element  (<i>zero or one</i>): A recommended parameter value or set of values.<br />A value provided in a catalog can be redefined at any higher layer of OSCAL (e.g.,
                           Profile).</li>
                        <li><a href="#select"><code>select</code></a> element  (<i>zero or one</i>): A set of parameter value choices, that may be picked from to set the parameter value.<br />.</li>
                     </ul>
                  </li>
                  <li><a href="#link"><code>link</code></a> element  (<i>zero or more</i>): </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">In a catalog, a parameter is typically used as a placeholder for the future assignment
                  of a parameter value, although the OSCAL model allows for the direct assignment of
                  a value if desired by the control author. The <code>value</code> may be optionally used to specify one or more values. If no value is provided, then
                  it is expected that the value will be provided at the Profile or Implementation layer.</p>
               <p class="p">A parameter can include a variety of metadata options that support the future solicitation
                  of one or more values. A <code>label</code> provides a textual placeholder that can be used in a tool to solicit parameter value
                  input, or to display in catalog documentation. The <code>desc</code> provides a short description of what the parameter is used for, which can be used
                  in tooling to help a user understand how to use the parameter. A <code>constraint</code> can be used to provide criteria for the allowed values. A <code>guideline</code> provides a recommendation for the use of a parameter.</p>
            </div>
            <p>This element appears inside: <a href="#group">group</a>, <a href="#control">control</a>, <a href="#subcontrol">subcontrol</a>.</p>
         </div>
         <div class="definition define-field" id="label">
            <header>
               <h4 id="oscal-catalog-xml_label" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Parameter label</b>: <code>label</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_label"><button>JSON</button></a></div>
            </header>
            <p>Supports inline encoding</p>
            <p class="description">A placeholder for a missing value, in display.</p>
            <p>This element appears inside: <a href="#param">param</a>.</p>
         </div>
         <div class="definition define-field" id="desc">
            <header>
               <h4 id="oscal-catalog-xml_desc" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Parameter description</b>: <code>desc</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_desc"><button>JSON</button></a></div>
            </header>
            <p>Supports inline encoding</p>
            <p class="description">Indicates and explains the purpose and use of a parameter</p>
            <div class="model">
               <p>The desc element may have an attribute</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute  (<i>optional</i>)</li>
               </ul>
            </div>
            <p>This element appears inside: <a href="#param">param</a>.</p>
         </div>
         <div class="definition define-field" id="constraint">
            <header>
               <h4 id="oscal-catalog-xml_constraint" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Constraint</b>: <code>constraint</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_constraint"><button>JSON</button></a></div>
            </header>
            <p class="description">A formal or informal expression of a constraint or test</p>
            <div class="model">
               <p>The constraint element may have an attribute</p>
               <ul>
                  <li><a href="#test"><code>test</code></a> attribute  (<i>optional</i>)</li>
               </ul>
            </div>
            <p>This element appears inside: <a href="#param">param</a>.</p>
         </div>
         <div class="definition define-assembly" id="guideline">
            <header>
               <h4 id="oscal-catalog-xml_guideline" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Guideline</b>: <code>guideline</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_guideline"><button>JSON</button></a></div>
            </header>
            <p class="description">A prose statement that provides a recommendation for the use of a parameter.</p>
            <div class="model">
               <p class="usa-font-lead">The <code>guideline</code> element has the following contents  (in order):</p>
               <ul>
                  <li class="prose">Prose contents (paragraphs and lists)</li>
               </ul>
            </div>
            <p>This element appears inside: <a href="#param">param</a>.</p>
         </div>
         <div class="definition define-field" id="value">
            <header>
               <h4 id="oscal-catalog-xml_value" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Value constraint</b>: <code>value</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_value"><button>JSON</button></a></div>
            </header>
            <p>Supports inline encoding</p>
            <p class="description">Indicates a permissible value for a parameter or property</p>
            <div class="remarks">
               <p class="p">In a declaration, <code>value</code> will commonly be given in groups, indicating a set of
                  enumerated permissible values (i.e., for an element to be valid to a value constraint,
                  it
                  must equal one of the given values).</p>
               <p class="p">In a parameter, a value represents a value assignment to the parameter, overriding
                  any
                  value given at the point of insertion. When parameters are provided in OSCAL profiles,
                  their
                  values will override any values assigned <q>lower down the stack</q>.</p>
            </div>
            <p>This element appears inside: <a href="#param">param</a>.</p>
         </div>
         <div class="definition define-assembly" id="select">
            <header>
               <h4 id="oscal-catalog-xml_select" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Selection</b>: <code>select</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_select"><button>JSON</button></a></div>
            </header>
            <p class="description">Presenting a choice among alternatives</p>
            <div class="model">
               <p class="usa-font-lead">The <code>select</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#how-many"><code>how-many</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#choice"><code>choice</code></a> element  (<i>zero or more</i>)</li>
               </ul>
            </div>
            <p>This element appears inside: <a href="#param">param</a>.</p>
         </div>
         <div class="definition define-field" id="choice">
            <header>
               <h4 id="oscal-catalog-xml_choice" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Choice</b>: <code>choice</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_choice"><button>JSON</button></a></div>
            </header>
            <p>Supports inline encoding</p>
            <p class="description">A value selection among several such options</p>
            <p>This element appears inside: <a href="#select">select</a>.</p>
         </div>
         <div class="definition define-assembly" id="part">
            <header>
               <h4 id="oscal-catalog-xml_part" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Part</b>: <code>part</code> element</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_part"><button>JSON</button></a></div>
            </header>
            <p class="description">A partition or component of a control, subcontrol or part</p>
            <div class="model">
               <p class="usa-font-lead">The <code>part</code> element has the following contents  (in order):</p>
               <ul>
                  <li><a href="#id"><code>id</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#class"><code>class</code></a> attribute  (<i>optional</i>)</li>
                  <li><a href="#title"><code>title</code></a> element  (<i>zero or one</i>)</li>
                  <li><a href="#prop"><code>prop</code></a> element  (<i>zero or more</i>)</li>
                  <li class="prose">Prose contents (paragraphs and lists)</li>
                  <li><a href="#part"><code>part</code></a> element  (<i>zero or more</i>)</li>
                  <li><a href="#link"><code>link</code></a> element  (<i>zero or more</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Like properties (<code>prop</code>) and parameters (<code>param</code>), parts can be
                  distinguished from other elements within their controls by their assigned
                  <code>class</code>, such that they may be subjected to <q>declarations logic</q> using
                  these values as bindings (and thereby getting open-ended extensibility).</p>
               <p class="p">An assigned class may frequently provide for a header in display, such that
                  <code>part</code><code>[@class='objectives']</code> is displayed under a header <em>Objectives</em>, etc.
                  Parts may also however have their own titles (<code>title</code> elements).</p>
               <p class="p">Many parts are logical partitions or sections for prose. Other parts may be more formally
                  constructed out of properties (<code>prop</code> elements) and/or their own parts. Such
                  structured objects may, at the extreme, function virtually as control extensions or
                  subcontrol-like objects (<q>enhancements</q>).</p>
            </div>
            <p>This element appears inside: <a href="#group">group</a>, <a href="#control">control</a>, <a href="#subcontrol">subcontrol</a>, <a href="#part">part</a>.</p>
         </div>
         <div class="definition define-flag" id="id">
            <header>
               <h4 id="oscal-catalog-xml_id" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">ID / identifier</b>: <code>id</code> attribute</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_id"><button>JSON</button></a></div>
            </header>
            <p class="description">Unique identifier</p>
            <div class="remarks">
               <p class="p">No mechanism is proposed to ensure that <code>id</code> values do not collide across
                  different catalogs. Use profiling without <q>merge</q> to detect such clashes.</p>
            </div>
            <ul class="usa-accordion-bordered">
               <li><button class="usa-accordion-button" aria-expanded="true" aria-controls="id_example1_xml">Example</button><div id="id_example1_xml" class="usa-accordion-content">
                     <pre>
&lt;citation id="xyz2"&gt;Some 
&lt;strong&gt;citation&lt;/strong&gt; of some sort&lt;/citation&gt;</pre>
                  </div>
               </li>
            </ul>
            <p>This attribute appears on: <a href="#catalog">catalog</a>, <a href="#back">back</a>, <a href="#section">section</a>, <a href="#group">group</a>, <a href="#control">control</a>, <a href="#subcontrol">subcontrol</a>, <a href="#prop">prop</a>, <a href="#param">param</a>, <a href="#desc">desc</a>, <a href="#part">part</a>.</p>
         </div>
         <div class="definition define-flag" id="class">
            <header>
               <h4 id="oscal-catalog-xml_class" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Class</b>: <code>class</code> attribute</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_class"><button>JSON</button></a></div>
            </header>
            <p class="description">Identifies the property or object within the control; a semantic hint</p>
            <div class="remarks">
               <p class="p">Overloading this attribute with more than one value is permitted, but not recommended.</p>
            </div>
            <p>This attribute appears on: <a href="#section">section</a>, <a href="#group">group</a>, <a href="#control">control</a>, <a href="#subcontrol">subcontrol</a>, <a href="#prop">prop</a>, <a href="#param">param</a>, <a href="#part">part</a>.</p>
         </div>
         <div class="definition define-flag" id="test">
            <header>
               <h4 id="oscal-catalog-xml_test" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Constraint test</b>: <code>test</code> attribute</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_test"><button>JSON</button></a></div>
            </header>
            <p class="description">A formal (executable) expression of a constraint</p>
            <p>This attribute appears on: <a href="#constraint">constraint</a>.</p>
         </div>
         <div class="definition define-flag" id="how-many">
            <header>
               <h4 id="oscal-catalog-xml_how-many" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Cardinality</b>: <code>how-many</code> attribute</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_how-many"><button>JSON</button></a></div>
            </header>
            <p class="description">When selecting, a requirement such as one or more</p>
            <p>This attribute appears on: <a href="#select">select</a>.</p>
         </div>
         <div class="definition define-flag" id="depends-on">
            <header>
               <h4 id="oscal-catalog-xml_depends-on" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Depends on</b>: <code>depends-on</code> attribute</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_depends-on"><button>JSON</button></a></div>
            </header>
            <p class="description">Another parameter invoking this one</p>
            <p>This attribute appears on: <a href="#param">param</a>.</p>
         </div>
         <div class="definition define-flag" id="model-version">
            <header>
               <h4 id="oscal-catalog-xml_model-version" class="usa-color-text usa-color-primary-darkest usa-color-text-white"><b class="formal-name">Model version</b>: <code>model-version</code> attribute</h4>
               <div style="float:right"><button disabled="disabled">XML</button><a href="/OSCAL/docs/schemas/oscal-catalog-json/#oscal-catalog-json_model-version"><button>JSON</button></a></div>
            </header>
            <p class="description">Declares a major/minor version for this metaschema</p>
            <p>This attribute appears on: <a href="#catalog">catalog</a>.</p>
         </div>
      </div>
   </body>
</html>