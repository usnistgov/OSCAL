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
         <h2 class="title">OSCAL Profile Metaschema: XML Schema</h2>
         <p>The short name (file identifier) for this schema shall be <i>oscal-profile</i>. It is used internally when an
         identifier is called for, and may appear in file names of schema artifacts.</p>
         <div class="remarks">
            <p class="p">A profile designates a selection and configuration of controls and subcontrols from one or more catalogs, along with a series of operations over the controls and subcontrols. The topmost element in the OSCAL profile XML schema is <a href="#profile" class="name">&lt;profile&gt;</a>.</p>
         </div>
         <div class="define-assembly" id="profile">
            <h3>
               <b class="formal-name">Profile</b>:
            <code class="name">&lt;profile&gt;</code> element</h3>
            <p class="description">Each OSCAL profile is defined by a Profile element</p>
            <div class="model">
               <p>The <code class="name">&lt;profile&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li class="assemblies">
                     <a class="name" href="#import">
                        <code class="name">&lt;import&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li>A <a class="name" href="#merge">
                        <code class="name">&lt;merge&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
                  <li>A <a class="name" href="#modify">
                        <code class="name">&lt;modify&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">An OSCAL document that describes a selection with possible modification of multiple
          controls from multiple catalogs. It provides mechanisms by which controls may be selected
            (<a href="#import" class="name">&lt;import&gt;</a>), merged or (re)structured (<a href="#merge" class="name">&lt;merge&gt;</a>), and emended
            (<a href="#modify" class="name">&lt;modify&gt;</a>). OSCAL profiles may select subsets of control sets, set parameter
          values for them in application, and even qualify the representation of controls and
          subcontrols as given in and by a catalog. They may also serve as sources for further
          modification in and by other profiles, that import them.</p>
            </div>
         </div>
         <div class="define-assembly" id="import">
            <h3>
               <b class="formal-name">Import resource</b>:
            <code class="name">&lt;import&gt;</code> element</h3>
            <p class="description">An Import element designates a catalog, profile, or other resource to be
         included (referenced and potentially modified) by this profile.</p>
            <div class="model">
               <p>The <code class="name">&lt;import&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>An <a class="name" href="#include">
                        <code class="name">&lt;include&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
                  <li>An <a class="name" href="#exclude">
                        <code class="name">&lt;exclude&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">An <a href="#import" class="name">&lt;import&gt;</a> indicates a source whose controls are to be included (referenced
          and modified) in a profile. This source will either be a catalog whose controls are given
            (<q>by value</q>), or a profile with its own control imports (with possible settings.</p>
               <p class="p">The contents of the <a href="#import" class="name">&lt;import&gt;</a> element indicate which controls and subcontrols
          from the source, will be included. Controls and subcontrols may be either selected (using
          an <a href="#include" class="name">&lt;include&gt;</a> element) or de-selected (using an <a href="#exclude" class="name">&lt;exclude&gt;</a> element)
          from the source catalog or profile.</p>
               <p class="p">When no <a href="#include" class="name">&lt;include&gt;</a> is given (whether an <a href="#exclude" class="name">&lt;exclude&gt;</a> is given or not),
            an <a href="#include" class="name">&lt;include&gt;</a>/<a href="#all" class="name">&lt;all&gt;</a> is assumed (that is, all controls will be
            included by default).</p>
            </div>
            <pre class="xml">
               <code class="tag">&lt;import href="catalog.xml"&gt;</code>
               <code class="tag">&lt;include&gt;</code>
               <code class="tag">&lt;call control-id="ac-1"&gt;</code>
               <code class="tag">&lt;/call&gt;</code>
               <code class="tag">&lt;/include&gt;</code>
               <code class="tag">&lt;/import&gt;</code>
            </pre>
         </div>
         <div class="define-assembly" id="merge">
            <h3>
               <b class="formal-name">Merge controls</b>:
            <code class="name">&lt;merge&gt;</code> element</h3>
            <p class="description">A Merge element merges controls in resolution.</p>
            <div class="model">
               <p>The <code class="name">&lt;merge&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>A <a class="name" href="#combine">
                        <code class="name">&lt;combine&gt;</code>
                     </a> element  (<i>zero or one</i>)</li>
                  <li class="choice">A choice between
         <ul>
                        <li>An <a class="name" href="#as-is">
                              <code class="name">&lt;as-is&gt;</code>
                           </a> element  (<i>zero or one</i>)</li>
                        <li>A <a class="name" href="#custom">
                              <code class="name">&lt;custom&gt;</code>
                           </a> element  (<i>zero or one</i>)</li>
                     </ul>
                  </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">The contents of the <a href="#merge" class="name">&lt;merge&gt;</a> element may be used to <q>reorder</q> or
         <q>restructure</q> controls by indicating an order and/or structure in resolution.</p>
               <p class="p">Implicitly, a <a href="#merge" class="name">&lt;merge&gt;</a> element is also a filter: controls that are included in a
         profile, but not included (implicitly or explicitly) in the scope of a <a href="#merge" class="name">&lt;merge&gt;</a> element,
         will not be merged into (will be dropped) in the resulting resolution.</p>
            </div>
         </div>
         <div class="define-field" id="combine">
            <h3>
               <b class="formal-name">Combination rule</b>:
            <code class="name">&lt;combine&gt;</code> element</h3>
            <p class="description">A Combine element defines whether and how to combine multiple (competing)
        versions of the same control</p>
            <div class="model">
               <p>The <code class="name">&lt;combine&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#method" class="name">
                        <code class="name">@method</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Whenever combining controls from multiple (import) pathways, an issue arises of what to do with
           clashing invocations (multiple competing versions of a control or a subcontrol). </p>
               <p class="p">This setting permits a profile designer to apply a rule for the resolution of such cases.
           In a well-designed profile, such collisions would ordinarily be avoided, but this setting can be
           useful for defining what to do when it occurs.</p>
            </div>
         </div>
         <div class="define-field" id="as-is">
            <h3>
               <b class="formal-name">As is</b>:
            <code class="name">&lt;as-is&gt;</code> element</h3>
            <p>True whenever given (presence signifies Boolean value)</p>
            <p class="description">An As-is element indicates that the controls should be structured in resolution as they are
        structured in their source catalogs. It does not contain any elements or attributes.</p>
         </div>
         <div class="define-flag" id="method">
            <h3>
               <b class="formal-name">Combination method</b>:
            <code class="name">@method</code> attribute</h3>
            <p class="description">How clashing controls and subcontrols should be handled</p>
         </div>
         <div class="define-assembly" id="custom">
            <h3>
               <b class="formal-name">Custom grouping</b>:
            <code class="name">&lt;custom&gt;</code> element</h3>
            <p class="description">A Custom element frames a structure for embedding represented controls in resolution.</p>
            <div class="model">
               <p>The <code class="name">&lt;custom&gt;</code> element has the following contents :</p>
               <ul>
                  <li class="choice">A choice between
         <ul>
                        <li class="assemblies">
                           <a class="name" href="#group">
                              <code class="name">&lt;group&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#call">
                              <code class="name">&lt;call&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#match">
                              <code class="name">&lt;match&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                     </ul>
                  </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">The <a href="#custom" class="name">&lt;custom&gt;</a> element represents a custom arrangement or organization of controls in
        the resolution of a catalog. </p>
               <p class="p">While the <a href="#as-is" class="name">&lt;as-is&gt;</a> element provides for a restitution of a control set's organization
        (in one or more source catalogs), this element permits the definition of an entirely different structure.</p>
            </div>
         </div>
         <div class="define-assembly" id="group">
            <h3>
               <b class="formal-name">Control group</b>:
            <code class="name">&lt;group&gt;</code> element</h3>
            <p class="description">As in catalogs, a group of (selected) controls or of groups of controls</p>
            <div class="model">
               <p>The <code class="name">&lt;group&gt;</code> element has the following contents :</p>
               <ul>
                  <li class="choice">A choice between
         <ul>
                        <li class="assemblies">
                           <a class="name" href="#group">
                              <code class="name">&lt;group&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#call">
                              <code class="name">&lt;call&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#match">
                              <code class="name">&lt;match&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                     </ul>
                  </li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="modify">
            <h3>
               <b class="formal-name">Modify controls</b>:
            <code class="name">&lt;modify&gt;</code> element</h3>
            <p class="description">Set parameters or amend controls in resolution</p>
            <div class="model">
               <p>The <code class="name">&lt;modify&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li class="assemblies">
                     <a class="name" href="#set-param">
                        <code class="name">&lt;set-param&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#alter">
                        <code class="name">&lt;alter&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="include">
            <h3>
               <b class="formal-name">Include controls</b>:
            <code class="name">&lt;include&gt;</code> element</h3>
            <p class="description">Specifies which controls and subcontrols to include from the resource (source catalog) being
          imported</p>
            <div class="model">
               <p>The <code class="name">&lt;include&gt;</code> element has the following contents :</p>
               <ul>
                  <li class="choice">A choice between
         <ul>
                        <li>An <a class="name" href="#all">
                              <code class="name">&lt;all&gt;</code>
                           </a> element  (<i>zero or one</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#call">
                              <code class="name">&lt;call&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#match">
                              <code class="name">&lt;match&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                     </ul>
                  </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">To be schema-valid, this element must contain either (but not both) a single
            <a href="#all" class="name">&lt;all&gt;</a> element, or a sequence of <a href="#call" class="name">&lt;call&gt;</a> elements.</p>
               <p class="p">If this element is not given, it is assumed to be present with contents <a href="#all" class="name">&lt;all&gt;</a>
          (qv); i.e., all controls are included by default, unless the <a href="#include" class="name">&lt;include&gt;</a>
          instruction calls controls specifically.</p>
            </div>
         </div>
         <div class="define-field" id="all">
            <h3>
               <b class="formal-name">Include all</b>:
            <code class="name">&lt;all&gt;</code> element</h3>
            <p class="description">Include all controls from the imported resource (catalog)</p>
            <div class="model">
               <p>The <code class="name">&lt;all&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#with-subcontrols" class="name">
                        <code class="name">@with-subcontrols</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">This element provides an alternative to calling controls and subcontrols individually
            from a catalog. But this is also the default behavior when no <a href="#include" class="name">&lt;include&gt;</a>
            element is given in an <a href="#import" class="name">&lt;import&gt;</a>; so ordinarily one might not see this element
            unless it is for purposes of including its <code>@with-subcontrols='yes'</code>
               </p>
            </div>
         </div>
         <div class="define-field" id="call">
            <h3>
               <b class="formal-name">Call (control or subcontrol)</b>:
            <code class="name">&lt;call&gt;</code> element</h3>
            <p class="description">Call a control or subcontrol by its ID</p>
            <div class="model">
               <p>The <code class="name">&lt;call&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#control-id" class="name">
                        <code class="name">@control-id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#subcontrol-id" class="name">
                        <code class="name">@subcontrol-id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#with-control" class="name">
                        <code class="name">@with-control</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#with-subcontrols" class="name">
                        <code class="name">@with-subcontrols</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Inside <a href="#include" class="name">&lt;include&gt;</a>, If <code>@control-id</code> is used (to indicate the control
          being referenced), <code>@subcontrol-id</code> cannot be used, and vice versa. (A single
            <a href="#call" class="name">&lt;call&gt;</a> element is used for each control.) This constraint is enforced by the
          schema. Likewise, <code>@with-subcontrols</code> can be used only along with
            <code>@control-id</code> not with <code>@subcontrol-id</code>.</p>
               <p class="p">If <code>@with-subcontrols</code> is <q>yes</q> on the call to a control, no sibling
            <a href="#call" class="name">&lt;call&gt;</a>elements need to be used to call its subcontrols. Accordingly it may be
          more common to call subcontrols (enhancements) by ID only to exclude them, not to include
          them.</p>
            </div>
         </div>
         <div class="define-field" id="match">
            <h3>
               <b class="formal-name">Match controls and subcontrols by identifier</b>:
            <code class="name">&lt;match&gt;</code> element</h3>
            <p class="description">Select controls by (regular expression) match on ID</p>
            <div class="model">
               <p>The <code class="name">&lt;match&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#pattern" class="name">
                        <code class="name">@pattern</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#order" class="name">
                        <code class="name">@order</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#with-control" class="name">
                        <code class="name">@with-control</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#with-subcontrols" class="name">
                        <code class="name">@with-subcontrols</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="exclude">
            <h3>
               <b class="formal-name">Exclude controls</b>:
            <code class="name">&lt;exclude&gt;</code> element</h3>
            <p class="description">Which controls and subcontrols to exclude from the resource (source catalog) being
          imported</p>
            <div class="model">
               <p>The <code class="name">&lt;exclude&gt;</code> element has the following contents :</p>
               <ul>
                  <li class="choice">A choice between
         <ul>
                        <li class="assemblies">
                           <a class="name" href="#call">
                              <code class="name">&lt;call&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                        <li class="assemblies">
                           <a class="name" href="#match">
                              <code class="name">&lt;match&gt;</code>
                           </a> elements (<i>zero or more</i>)</li>
                     </ul>
                  </li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Within <a href="#exclude" class="name">&lt;exclude&gt;</a>, <a href="#all" class="name">&lt;all&gt;</a> is not an option since it makes no sense.
         However, it also makes no sense to use exclude/call except with include/all; you would not want to
         include and exclude something by ID simultaneously. If this happens, an error condition will be reported.</p>
            </div>
         </div>
         <div class="define-assembly" id="set-param">
            <h3>
               <b class="formal-name">Parameter Setting</b>:
            <code class="name">&lt;set-param&gt;</code> element</h3>
            <p class="description"> A parameter setting, to be propagated to points of insertion
      </p>
            <div class="model">
               <p>The <code class="name">&lt;set-param&gt;</code> element has the following contents  (in order):</p>
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
                     </a> element  (<i>zero or one</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#desc">
                        <code class="name">&lt;desc&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#constraint">
                        <code class="name">&lt;constraint&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="choice">A choice between
         <ul>
                        <li>A <a class="name" href="#value">
                              <code class="name">&lt;value&gt;</code>
                           </a> element  (<i>zero or one</i>)</li>
                        <li>A <a class="name" href="#select">
                              <code class="name">&lt;select&gt;</code>
                           </a> element  (<i>zero or one</i>)</li>
                     </ul>
                  </li>
                  <li class="assemblies">
                     <a class="name" href="#link">
                        <code class="name">&lt;link&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#part">
                        <code class="name">&lt;part&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
               </ul>
            </div>
         </div>
         <div class="define-assembly" id="alter">
            <h3>
               <b class="formal-name">Alteration</b>:
            <code class="name">&lt;alter&gt;</code> element</h3>
            <p class="description">An Alter element specifies changes to be made to an included control or subcontrol when a profile is resolved.</p>
            <div class="model">
               <p>The <code class="name">&lt;alter&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#control-id" class="name">
                        <code class="name">@control-id</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#subcontrol-id" class="name">
                        <code class="name">@subcontrol-id</code>
                     </a> (<i>optional</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#remove">
                        <code class="name">&lt;remove&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
                  <li class="assemblies">
                     <a class="name" href="#add">
                        <code class="name">&lt;add&gt;</code>
                     </a> elements (<i>zero or more</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Use <code>@control-id</code> or <code>@subcontrol-id</code> to indicate the scope of alteration.</p>
               <p class="p">It is an error for two <a href="#alter" class="name">&lt;alter&gt;</a> elements to apply to the same control or subcontrol.
         In practice, multiple alterations can be applied (together), but it creates confusion.</p>
               <p class="p">At present, no provision is made for altering many controls at once (for example, to systematically
            remove properties or add global properties); extending this element to match multiple control
            IDs could provide for this.</p>
            </div>
         </div>
         <div class="define-field" id="remove">
            <h3>
               <b class="formal-name">Removal</b>:
            <code class="name">&lt;remove&gt;</code> element</h3>
            <p class="description">Specifies elements to be removed from a control or subcontrol, in resolution</p>
            <div class="model">
               <p>The <code class="name">&lt;remove&gt;</code> element supports:</p>
               <ul>
                  <li>Attribute <a href="#class-ref" class="name">
                        <code class="name">@class-ref</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#id-ref" class="name">
                        <code class="name">@id-ref</code>
                     </a> (<i>optional</i>)</li>
                  <li>Attribute <a href="#item-name" class="name">
                        <code class="name">@item-name</code>
                     </a> (<i>optional</i>)</li>
               </ul>
            </div>
            <div class="remarks">
               <p class="p">Use <code>@class-ref</code>, <code>@id-ref</code> or <code>@item-name</code> to indicate
          class tokens or ID reference, or the formal name, of the component to be removed or erased
          from a control or subcontrol, when a catalog is resolved. The control or subcontrol
          affected is indicated by the pointer on the removal's parent (containing)
            <a href="#alter" class="name">&lt;alter&gt;</a> element.</p>
               <p class="p">To change an element, use <a href="#remove" class="name">&lt;remove&gt;</a> to remove the element, then
            <a href="#add" class="name">&lt;add&gt;</a> to add it back again with changes.</p>
            </div>
         </div>
         <div class="define-assembly" id="add">
            <h3>
               <b class="formal-name">Addition</b>:
            <code class="name">&lt;add&gt;</code> element</h3>
            <p class="description">Specifies contents to be added into controls or subcontrols, in resolution</p>
            <div class="model">
               <p>The <code class="name">&lt;add&gt;</code> element has the following contents  (in order):</p>
               <ul>
                  <li>Attribute <a href="#position" class="name">
                        <code class="name">@position</code>
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
         <div class="define-flag" id="control-id">
            <h3>
               <b class="formal-name">Control ID</b>:
            <code class="name">@control-id</code> attribute</h3>
            <p class="description">Value of the 'id' flag on a target control</p>
         </div>
         <div class="define-flag" id="with-control">
            <h3>
               <b class="formal-name">Include control with subcontrol</b>:
            <code class="name">@with-control</code> attribute</h3>
            <p class="description">Whether a control should be implicitly included, if not called.</p>
         </div>
         <div class="define-flag" id="with-subcontrols">
            <h3>
               <b class="formal-name">Include subcontrols with control</b>:
            <code class="name">@with-subcontrols</code> attribute</h3>
            <p class="description">Whether subcontrols should be implicitly included, if not called.</p>
         </div>
         <div class="define-flag" id="subcontrol-id">
            <h3>
               <b class="formal-name">Control ID</b>:
            <code class="name">@subcontrol-id</code> attribute</h3>
            <p class="description">Value of the 'id' flag on a target subcontrol</p>
         </div>
         <div class="define-flag" id="pattern">
            <h3>
               <b class="formal-name">Pattern</b>:
            <code class="name">@pattern</code> attribute</h3>
            <p class="description">A regular expression matching the IDs of one or more controls or subcontrols to be selected</p>
         </div>
         <div class="define-flag" id="order">
            <h3>
               <b class="formal-name">Pattern</b>:
            <code class="name">@order</code> attribute</h3>
            <p class="description">A regular expression matching the IDs of one or more controls or subcontrols to be selected</p>
         </div>
         <div class="define-flag" id="position">
            <h3>
               <b class="formal-name">Position</b>:
            <code class="name">@position</code> attribute</h3>
            <p class="description">Where to add the new content with respect to the targeted element (beside it or inside it)</p>
         </div>
         <div class="define-flag" id="class-ref">
            <h3>
               <b class="formal-name">References by class</b>:
            <code class="name">@class-ref</code> attribute</h3>
            <p class="description">Items to remove, by class</p>
         </div>
         <div class="define-flag" id="id-ref">
            <h3>
               <b class="formal-name">References by ID</b>:
            <code class="name">@id-ref</code> attribute</h3>
            <p class="description">Items to remove, by ID</p>
         </div>
         <div class="define-flag" id="item-name">
            <h3>
               <b class="formal-name">References by name</b>:
            <code class="name">@item-name</code> attribute</h3>
            <p class="description">Items to remove, by item type (name), e.g. title or prop</p>
         </div>
      </div>
      <div class="define-field" id="title">
         <h3>
            <b class="formal-name">Title</b>:
            <code class="name">&lt;title&gt;</code> element</h3>
         <p>Supports inline encoding</p>
         <p class="description">A title for display and navigation, exclusive of more specific properties</p>
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
      </div>
      <div class="define-field" id="prop">
         <h3>
            <b class="formal-name">Property</b>:
            <code class="name">&lt;prop&gt;</code> element</h3>
         <p class="description">A value with a name, attributed to the containing control, subcontrol, part,
          or group.</p>
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
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
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
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
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
      </div>
      <div class="define-field" id="desc">
         <h3>
            <b class="formal-name">Parameter description</b>:
            <code class="name">&lt;desc&gt;</code> element</h3>
         <p>Supports inline encoding</p>
         <p class="description">Indicates and explains the purpose and use of a parameter</p>
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
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
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
         <div class="model">
            <p>The <code class="name">&lt;constraint&gt;</code> element supports:</p>
            <ul>
               <li>Attribute <a href="#test" class="name">
                     <code class="name">@test</code>
                  </a> (<i>optional</i>)</li>
            </ul>
         </div>
      </div>
      <div class="define-field" id="value">
         <h3>
            <b class="formal-name">Value constraint</b>:
            <code class="name">&lt;value&gt;</code> element</h3>
         <p>Supports inline encoding</p>
         <p class="description">Indicates a permissible value for a parameter or property</p>
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
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
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
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
      <div class="define-assembly" id="part">
         <h3>
            <b class="formal-name">Part</b>:
            <code class="name">&lt;part&gt;</code> element</h3>
         <p class="description">A partition or component of a control, subcontrol or part</p>
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
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
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
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
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
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
      <div class="define-flag" id="id">
         <h3>
            <b class="formal-name">ID / identifier</b>:
            <code class="name">@id</code> attribute</h3>
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
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
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
         <p class="description">Identifies the property or object within the control; a semantic hint</p>
         <div class="remarks">
            <p class="p">Overloading this attribute with more than one value is permitted, but not recommended.</p>
         </div>
      </div>
      <div class="define-flag" id="depends-on">
         <h3>
            <b class="formal-name">Depends on</b>:
            <code class="name">@depends-on</code> attribute</h3>
         <p>Note: definition adopted from <a href="oscal-catalog-metaschema.xml">oscal-catalog-metaschema.xml</a>
         </p>
         <p class="description">Another parameter invoking this one</p>
      </div>
   </body>
</html>
